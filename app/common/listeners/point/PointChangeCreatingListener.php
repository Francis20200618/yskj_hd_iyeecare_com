<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/12/29
 * Time: 17:45
 */

namespace app\common\listeners\point;

use app\common\events\finance\PointChangeCreatingEvent;
use app\common\models\finance\PointLog;
use app\common\models\MemberShopInfo;
use app\common\services\finance\PointService;
use Carbon\Carbon;
use Illuminate\Contracts\Events\Dispatcher;

class PointChangeCreatingListener
{
    private $no_limit = [
        PointService::POINT_MODE_GOODS,
        PointService::POINT_MODE_ADMIN,
        PointService::POINT_MODE_RECHARGE_CODE,
        PointService::POINT_MODE_RECIPIENT,
        PointService::POINT_MODE_ROLLBACK,
        PointService::POINT_MODE_COMMISSION_TRANSFER,
        PointService::POINT_MODE_EXCEL_RECHARGE,
        PointService::POINT_MODE_ORDER_ATTACHED,
    ];

    public function subscribe(Dispatcher $events)
    {
        $events->listen(PointChangeCreatingEvent::class, self::class . '@handle');
    }

    public function handle(PointChangeCreatingEvent $event)
    {
        $point_data = $event->changeData;
        if (!$point_data['member_id'] || $point_data['point_income_type'] != PointService::POINT_INCOME_GET || in_array($point_data['point_mode'],$this->no_limit)) {
            return;
        }
        $yz_member = MemberShopInfo::select('level_id')
            ->with(['level' => function ($level) {
                $level->select('id','give_point_today');
            }])
            ->where('member_id',$point_data['member_id'])->first();
        if (!$yz_member || $yz_member->level_id == 0 || !$yz_member->level || !$yz_member->level->give_point_today || $yz_member->level->give_point_today < 0) {
            return;
        }
        $todaySum = PointLog::uniacid()->where('member_id',$point_data['member_id'])
            ->where('point_income_type',1)->whereNotIn('point_mode',$this->no_limit)
            ->whereBetween('created_at', [Carbon::today()->startOfDay()->timestamp,Carbon::today()->endOfDay()->timestamp])
            ->sum('point') ? : 0;
        if ($todaySum >= $yz_member->level->give_point_today) {
            $event->is_change = 0;
            \Log::debug('会员:'.$point_data['member_id'].'今天所获积分已超过当前会员等级限制的每天可获得积分数',[$todaySum,$yz_member,$point_data]);
        } elseif (bcadd($todaySum,$point_data['point'],2) > $yz_member->level->give_point_today) {
            $point_data['point'] = bcsub($yz_member->level->give_point_today,$todaySum,2);
            \Log::debug('会员:'.$point_data['member_id'].'本次所赠积分已超过当前会员等级限制的每天获得积分数的剩余额度',[$todaySum,$yz_member,$point_data['point'],$event->changeData]);
            $event->changeData = $point_data;
        }
        return;
    }
}