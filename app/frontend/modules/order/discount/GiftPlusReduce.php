<?php
/**
 * Created by PhpStorm.
 * User: shenyang
 * Date: 2018/5/23
 * Time: 下午3:55
 */

namespace app\frontend\modules\order\discount;

use app\common\modules\orderGoods\models\PreOrderGiftGoods;
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
    protected $name = '加价购折扣';

    /**
     * 订单中订单商品单品满减的总金额
     * @return float
     */
    protected function _getAmount()
    {

        //对订单商品按goods_id去重 累加单品满减金额
        $result = $this->order->orderGoods->onlyGift()->sum(function (PreOrderGoods $orderGoods) {
            if($orderGoods->memberCart->marketingService->giftType() == Marketing::GIFT_TYPE_PLUS_GOODS){
                return $orderGoods->getGoodsPrice() - $orderGoods->getGiftPrice();
            }else{
                return 0;
            }
        });
        return min($result, $this->order->getPriceBefore($this->getCode()));
//        return $result;
    }

    /**
     * @return mixed
     * @throws \app\common\exceptions\AppException
     */
//    function getPrice()
//    {
//        return max($this->order->getPriceBefore($this->getKey()) - $this->discount->getAmount(),0);
//    }

}