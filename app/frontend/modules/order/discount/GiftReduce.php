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
class GiftReduce extends BaseDiscount
{
    protected $code = 'gift';
    protected $name = '赠品折扣';

    /**
     * 订单中订单商品单品满减的总金额
     * @return float
     */
    protected function _getAmount()
    {
        //对订单商品按goods_id去重 累加单品满减金额
        $result = $this->order->orderGoods->onlyGift()->sum(function (PreOrderGiftGoods $orderGoods) {
            if($orderGoods->memberCart->marketingService->giftType() == Marketing::GIFT_TYPE_GOODS){
                return $orderGoods->getPriceBefore($this->getCode());
            }else{
                return 0;
            }
        });
        return min($result,$this->order->getPriceBefore($this->getCode()));
    }
}