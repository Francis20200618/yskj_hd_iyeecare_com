<?php
/**
 * Created by PhpStorm.
 * User: shenyang
 * Date: 2018/5/23
 * Time: 下午3:55
 */

namespace app\frontend\modules\orderGoods\discount;

use app\common\modules\orderGoods\models\PreOrderGoods;
use Yunshop\Marketing\models\Marketing;

/**
 * 单品满减优惠
 * Class SingleEnoughReduce
 * @package app\frontend\modules\order\discount
 */
class GiftPlusReduce extends BaseDiscount
{
    protected $code = 'giftPlus';
    protected $name = '加价购';

    /**
     * 获取金额
     * @return float|int|null
     */
    protected function _getAmount()
    {
        $orderGoodsPrice = $this->getOrderGoodsPrice();
        if(!$orderGoodsPrice){
            return 0;
        }
        return $orderGoodsPrice - $this->orderGoods->getGiftPrice();
    }

    /**
     * 订单中同商品的价格小计
     * @return float
     */
    protected function getOrderGoodsPrice()
    {
        return $this->orderGoods->order->orderGoods->onlyGift()->where('goods_id', $this->orderGoods->goods_id)->sum(function (PreOrderGoods $preOrderGoods) {
            if(
                $preOrderGoods->memberCart->marketingService->giftType() == Marketing::GIFT_TYPE_PLUS_GOODS
                && $preOrderGoods->memberCart->marketing_id == $this->orderGoods->memberCart->marketing_id
            ){
                return $preOrderGoods->getPriceBefore($this->getCode());
            }else{
                return 0;
            }
        });
    }

}