<?php
/**
 * Created by PhpStorm.
 * User: shenyang
 * Date: 2018/5/23
 * Time: 下午3:55
 */

namespace app\frontend\modules\orderGoods\discount;

use Yunshop\Marketing\service\MarketingEnoughReduceService;
use Yunshop\Marketing\service\MarketingService;

/**
 * 单品满减优惠
 * Class SingleEnoughReduce
 * @package app\frontend\modules\order\discount
 */
class GiftEnoughReduce extends BaseDiscount
{
    protected $code = 'giftEnoughReduce';
    protected $name = '满额减';

    /**
     * 获取金额
     * @return float|int|null
     */
    protected function _getAmount()
    {
        return MarketingEnoughReduceService::getDiscountMoneyByGoodsInTrade($this->orderGoods->goods, $this->orderGoods->goods_option_id);
    }
}