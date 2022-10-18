<?php
/**
 * Created by PhpStorm.
 * User: shenyang
 * Date: 2018/5/23
 * Time: 下午3:55
 */

namespace app\frontend\modules\order\discount;

use app\common\facades\Setting;
use app\common\models\MemberCart;
use app\common\modules\orderGoods\models\PreOrderGoods;
use Yunshop\Marketing\service\MarketingContainer;
use Yunshop\Marketing\service\MarketingEnoughReduceService;
use Yunshop\Marketing\service\MarketingService;

class GiftEnoughReduce extends BaseDiscount
{
    protected $code = 'giftEnoughReduce';
    protected $name = '满额减';

    /**
     * 获取总金额
     * @return int|mixed
     * @throws \app\common\exceptions\AppException
     */
    protected function _getAmount()
    {
        $result = $this->order->orderGoods->exceptGift()->sum(function (PreOrderGoods $orderGoods){
            return MarketingEnoughReduceService::getDiscountMoneyByGoodsInTrade($orderGoods->goods, $orderGoods->goods_option_id);
        });
        return $result;
    }
}