<?php
/**
 * Created by PhpStorm.
 * User: shenyang
 * Date: 2018/5/23
 * Time: 下午3:55
 */

namespace app\frontend\modules\orderGoods\discount;

use app\common\facades\Setting;
use app\common\modules\orderGoods\models\PreOrderGiftGoods;
use app\common\modules\orderGoods\models\PreOrderGoods;
use Yunshop\Marketing\models\Marketing;
use Yunshop\Marketing\service\MarketingEnoughReduceService;
use Yunshop\Marketing\service\MarketingService;

class FullPiece extends BaseDiscount
{
    protected $code = 'fullPiece';
    protected $name = '满件优惠';
    private $setting;

    /**
     * 获取总金额
     * @return float|int
     */
    protected function _getAmount()
    {
        $settings = $this->getSetting();
        if(!$settings['open']){
            return 0;
        }
        //只有商城,供应商订单参加
        if($this->orderGoods->order->plugin_id != 0){
            return 0;
        }
        if (empty($settings['fullPiece'])) {
            return 0;
        }
        //赠品不参与"满件优惠"
        if ($this->orderGoods instanceof PreOrderGiftGoods) {
            return 0;
        }

        if (!MarketingService::inStackableActByGoods($this->orderGoods->goods, Marketing::STACKABLE_ACT_ENOUGH_NUM_REDUCE)) {
            return 0;
        }
        if(!MarketingEnoughReduceService::inStackableActByGoods($this->orderGoods->goods, $this->orderGoods->order, Marketing::STACKABLE_ACT_ENOUGH_NUM_REDUCE)){
            return 0;
        }

        // (支付金额/订单中同种商品已计算的支付总价 ) * 全场满减金额
        return $this->getOrderGoodsPrice($this->orderGoods);
    }

    protected function getSetting()
    {
        if (!isset($this->setting)) {
            $this->setting = Setting::get('shop.fullPieceNew');
        }
        return $this->setting;
    }

    /**
     * @param PreOrderGoods $orderGoods
     * @return int|mixed
     */
    private function getOrderGoodsPrice(PreOrderGoods $orderGoods)
    {
        $settings = $this->getSetting();
        $fullPiece = [];
        foreach ($settings['fullPiece'] as $k=>$v) {
            $fullPiece[$k] = $v;
            $fullPiece[$k]['goods'] = [];
            if (empty($v['goods'])) {
                continue;
            }
            foreach ($orderGoods->order->orderGoods->exceptGift() as $item) {
                if (in_array($item->goods_id,$v['goods'])) {
                    $fullPiece[$k]['goods'][] = $item->goods_id;
                }
            }
        }

        $inFullPiece = [];
        foreach ($fullPiece as $item) {
            if (empty($item['goods']) || !in_array($orderGoods->goods_id,$item['goods'])) {
                continue;
            }
            $inFullPiece = $item;
            break;
        }
        if (!$inFullPiece) {
            return 0;
        }

        // 求和所属订单中指定goods_id的订单商品支付金额
        $amount =  $orderGoods->order->orderGoods->exceptGift()->whereIn('goods_id', $inFullPiece['goods'])->sum(function (PreOrderGoods $preOrderGoods) {
            return $preOrderGoods->getPriceBefore($this->getCode());
        });
        $goods_count = $orderGoods->total;
        $goods_total_count = $orderGoods->order->orderGoods->exceptGift()->whereIn('goods_id', $inFullPiece['goods'])->sum('total');

        $rules = collect($inFullPiece['rules']);
        $rules = $rules->sortByDesc(function ($rule) {
            return $rule['enough'];
        });
        $discount = 0;
        foreach ($rules as $rule) {
            if ($goods_total_count < $rule['enough']) {
                continue;
            }
            if ($inFullPiece['discount_type']) {//折扣
                $reduce = bcsub(10,$rule['reduce'],2);
                $discount = bcmul(bcdiv($reduce,10,2),$amount,2);
                break;
            } else {//立减
                $discount = min($rule['reduce'],$amount);
                break;
            }
        }

        if (!$discount) {
            return 0;
        }

        if ($discount == $amount) { //优惠与商品价格相同
            return $this->orderGoods->order->orderGoods->exceptGift()->where('goods_id', $orderGoods->goods_id)->sum(function (PreOrderGoods $preOrderGoods) {
                return $preOrderGoods->getPriceBefore($this->getCode());
            });
        }
        //一共折扣多少钱 * 商品数量 / 商品总数量
        return bcdiv(($discount * $goods_count),$goods_total_count,2);
    }
}