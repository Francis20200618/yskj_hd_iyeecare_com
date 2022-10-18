<?php
/**
 * Created by PhpStorm.
 * User: shenyang
 * Date: 2018/12/27
 * Time: 10:57 PM
 */

namespace app\common\modules\coupon\models;

use app\common\exceptions\AppException;
use app\common\models\Coupon;
use app\common\models\Member;
use app\common\models\MemberCoupon;
use app\common\models\MemberShopInfo;
use app\common\modules\coupon\events\AfterMemberReceivedCoupon;

class PreMemberCoupon extends MemberCoupon
{
    /**
     * @var Member $member
     */
    private $member;
    /**
     * @var Coupon $coupon
     */
    private $coupon;

    private $exchange_total;

    private $integralCanExchange;

    /**
     * @param Member $member
     * @param Coupon $coupon
     * @param int $exchange_total
     */
    public function init(Member $member, Coupon $coupon, $exchange_total = 1)
    {
        $this->member = $member;
        $this->coupon = $coupon;
        $this->exchange_total = $exchange_total;
        $this->initAttributes();
    }

    private function initAttributes()
    {
        $data = [
            'uniacid' => $this->member->uniacid,
            'uid' => $this->member->uid,
            'coupon_id' => $this->coupon->id,
            'get_type' => 1,
            'get_time' => time(),
        ];
        $this->fill($data);
    }

    /**
     * @throws AppException
     */
    public function generate()
    {
        $this->verify($this->member->yzMember, $this->coupon, $this->exchange_total);
        $validator = $this->validator();
        if ($validator->fails()) {
            throw new AppException('领取失败', $validator->messages());
        }
        if ($this->exchange_total == 1) {
            $this->save();
        } else {
            for ($i = 1; $i <= $this->exchange_total; $i++) {
                $insertData[] = [
                    'uniacid' => $this->member->uniacid,
                    'uid' => $this->member->uid,
                    'coupon_id' => $this->coupon->id,
                    'get_type' => 1,
                    'get_time' => time(),
                ];
            }
            if (empty($insertData)) {
                throw new AppException('领取优惠券失败');
            }
            static::insert($insertData);
        }

        if (!empty($this->integralCanExchange)) {
            //扣除兑换优惠券需要的消费积分
            $this->deductIntegral();
        }

        event(new AfterMemberReceivedCoupon($this,$this->exchange_total));
    }

    /**
     * @param MemberShopInfo $yzMember
     * @param Coupon $coupon
     * @param $exchange_total
     * @throws AppException
     */
    public function verify(MemberShopInfo $yzMember, Coupon $coupon, $exchange_total = 1)
    {
        if (!$coupon->available()) {
            throw new AppException('没有该优惠券或者优惠券不可用');
        }
        if (!empty($coupon->level_limit) && ($coupon->level_limit != -1)) { //优惠券有会员等级要求
            // 通过会员记录的level_id找到会员等级
            $memberLevel = \app\common\models\MemberLevel::find($yzMember->level_id)->level;
            // 通过优惠券记录的level_id找到会员等级,level_limit实际就是level_id
            $couponMemberLevel = \app\common\models\MemberLevel::find($coupon->level_limit)->level;
            if (empty($yzMember->level_id)) {
                throw new AppException('该优惠券有会员等级要求,但该用户没有会员等级');
            } elseif ((!empty($memberLevel) ? $memberLevel : 0) < $couponMemberLevel) {
                throw new AppException('没有达到领取该优惠券的会员等级要求');
            }
        }

        //判断优惠券是否过期
        $timeLimit = $coupon->time_limit;

        if ($timeLimit == 1 && (time() > $coupon->time_end->timestamp)) {
            throw new AppException('优惠券已过期');

        }

        //是否达到个人领取上限
        $counts = self::where('uid', $yzMember->member_id)->where('coupon_id', $coupon->id)->where('get_type',1);
        $count = $counts->count();
        if ($exchange_total > 1) {
            $count += ($exchange_total-1);//领取多张需要增加当前数量进行判断
        }

        if ($count >= $coupon->get_max && ($coupon->get_max != -1)) {
            throw new AppException('已经达到个人领取上限',['reason' => '每人限领' . $coupon->get_max . '张,当前已领取' . $counts->count() . '张']);
        }

        $today_count = $counts->where('get_time','>',strtotime(date('Y-m-d',time())))->count();
        if($coupon->get_limit_type == 1 and $coupon->get_limit_max != -1 and $today_count >= $coupon->get_limit_max){
            throw new AppException('今日领取已达上限',['reason' => '每人每天限领' . $coupon->get_limit_max . '张']);
        }

        //验证是否达到优惠券总数上限
        if ($coupon->getReceiveCount() >= $coupon->total && ($coupon->total != -1)) {
            throw new AppException('该优惠券已经被抢光');
        }

        //验证会员标签
        if (app('plugins')->isEnabled('member-tags')) {
            $memberTags = \Yunshop\MemberTags\Common\models\MemberTagsRelationModel::uniacid()->where('member_id', $yzMember->member_id)->pluck('tag_id');
            if (!empty($coupon->member_tags_ids) && empty(array_intersect($memberTags->toArray(), $coupon->member_tags_ids))) {
                throw new AppException('不符合领取该优惠券的标签分组要求');
            }
        }

        //消费积分兑换优惠券
        if (app('plugins')->isEnabled('integral')) {
            $integralName = \Yunshop\Integral\Common\Services\SetService::getIntegralName();
            $integralMember = (float)\Yunshop\Integral\Common\Models\IntegralMemberModel::uniacid()->where('uid', $yzMember->member_id)->pluck('integral')->first(); //用户消费积分余额
            if ($coupon->is_integral_exchange_coupon && !empty($coupon->exchange_coupon_integral)) {
                if (bccomp($coupon->exchange_coupon_integral, $integralMember) == 1) {
                    $exchangeIntegralMsg = str_replace('消费积分', $integralName, '兑换需要' . $coupon->exchange_coupon_integral . '消费积分，当前消费积分 ' . $integralMember . '，消费积分不足，不能进行兑换');
                    $this->integralCanExchange = 0;
                    throw new AppException($exchangeIntegralMsg);
                } else {
                    $this->integralCanExchange = 1;
                }
            }
        }
    }

    private function deductIntegral()
    {
        $changeValue = bcmul($this->coupon->exchange_coupon_integral,$this->exchange_total,2);
        $plugin_name = INTEGRAL_NAME ?: '消费积分';
        try {
            $order_sn = MemberCoupon::createOrderSn('DIEC');//DIEC扣除消费积分兑换优惠券
            $changeData = [
                'uid' => $this->member->uid,
                'uniacid' => $this->member->uniacid,
                'change_value' => $changeValue,
                'order_sn' => $order_sn,
                'source_type' => self::class,
                'source_id' => \Yunshop\Integral\Common\Services\ConstService::EXCHANGE_COUPON_DEDUCT,
                'remark' => $plugin_name.'兑换优惠券',
                'type' => 0,//0为减
            ];
            (new \Yunshop\Integral\Common\Services\IntegralChangeServer())->exchangeCouponDeduct($changeData);
        } catch (\Exception $e) {
            \Log::error('消费积分兑换优惠券错误：' . $e->getMessage());
        }
    }
}