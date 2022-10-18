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
class GiftReduce extends BaseDiscount
{
    protected $code = 'gift';
    protected $name = '赠品优惠';

    /**
     * 获取金额
     * @return float|int|null
     */
    protected function _getAmount()
    {
        if(!$this->getOrderGoodsPrice()){
            return 0;
        }
        return $this->getOrderGoodsPrice();
    }

    /**
     * 订单中同商品的价格小计
     * @return float
     */
    protected function getOrderGoodsPrice()
    {
        return $this->orderGoods->order->orderGoods->onlyGift()->where('goods_id', $this->orderGoods->goods_id)->sum(function (PreOrderGoods $preOrderGoods) {
            if($preOrderGoods->memberCart->marketingService->giftType() == Marketing::GIFT_TYPE_GOODS){
                return $preOrderGoods->getPriceBefore($this->getCode());
            }else{
                return 0;
            }
        });
    }

}