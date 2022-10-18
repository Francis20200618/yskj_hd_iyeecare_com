<?php
/**
 * Created by PhpStorm.
 * User: shenyang
 * Date: 2018/5/23
 * Time: 下午3:55
 */

namespace app\frontend\modules\orderGoods\discount;

use app\common\modules\orderGoods\models\PreOrderGiftGoods;
use app\common\modules\orderGoods\models\PreOrderGoods;
use Yunshop\Marketing\models\Marketing;
use Yunshop\Marketing\service\MarketingEnoughReduceService;
use Yunshop\Marketing\service\MarketingService;

class EnoughReduce extends BaseDiscount
{
    protected $code = 'enoughReduce';
    protected $name = '全场满减优惠';

    /**
     * @return float|int|null
     */
    protected function _getAmount()
    {
        if (!MarketingService::inStackableActByGoods($this->orderGoods->goods, Marketing::STACKABLE_ACT_ENOUGH_REDUCE)) {
            return 0;
        }
        if(!MarketingEnoughReduceService::inStackableActByGoods($this->orderGoods->goods, $this->orderGoods->order, Marketing::STACKABLE_ACT_ENOUGH_REDUCE)){
            return 0;
        }
        if ($this->getOrderGoodsPrice() == 0) {
            return 0;
        }
        return $this->aa();
        // (支付金额/订单中同种商品已计算的支付总价 ) * 全场满减金额
//        return ($this->orderGoods->getPriceBefore($this->getCode()) / $this->getOrderGoodsPrice()) * $this->getAmountInOrder();
    }

    /**
     * 全场满减金额分摊到商品 ，优化原来的分摊算法，使分担加起来等于总分摊金额
     * @return float|int|void
     */
    protected function aa(){
        $order_goods_list = $this->orderGoods->order->orderGoods->exceptGift()->values();
        $total_goods_price = $this->getOrderGoodsPrice();
        $amount_in_order = $this->getAmountInOrder();
        $used_money = 0;
        foreach ($order_goods_list as $key => $value) {
            if ($key < $order_goods_list->count() - 1) {
                $this_amount = ($value->getPriceBefore($this->getCode())/$total_goods_price) * $amount_in_order;
                $used_money += $this_amount;
            }else{
                $this_amount = $amount_in_order - $used_money;
            }
            if ($this->orderGoods->goods->id == $value->goods->id) {
                return $this_amount;
            }
        }
        return 0;
    }

    /**
     * 订单此种优惠总金额
     * @return float
     */
    protected function getAmountInOrder()
    {
        return $this->orderGoods->order->getDiscount()->getAmountByCode($this->code)->getAmount();
    }

    /**
     * 订单中同商品的价格小计
     * @return float
     */
    protected function getOrderGoodsPrice()
    {
        return $this->orderGoods->order->orderGoods->sum(function (PreOrderGoods $preOrderGoods) {
            if ($preOrderGoods instanceof PreOrderGiftGoods) {
                return $preOrderGoods->getGiftPrice();
            }
            //不可叠加的商品不算在内
            if (!MarketingService::inStackableActByGoods($preOrderGoods->goods, Marketing::STACKABLE_ACT_ENOUGH_REDUCE)) {
                return 0;
            }
            if(!MarketingEnoughReduceService::inStackableActByGoods($preOrderGoods->goods, $preOrderGoods->order, Marketing::STACKABLE_ACT_ENOUGH_REDUCE)){
                return 0;
            }
            return $preOrderGoods->getPriceBefore($this->getCode());
        });
    }
}