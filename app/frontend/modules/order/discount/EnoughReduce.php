<?php
/**
 * Created by PhpStorm.
 * User: shenyang
 * Date: 2018/5/23
 * Time: 下午3:55
 */

namespace app\frontend\modules\order\discount;

use app\common\facades\Setting;
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
     * 获取总金额
     * @return int|mixed
     * @throws \app\common\exceptions\AppException
     */
    protected function _getAmount()
    {

        if(!Setting::get('enoughReduce.open')){
            return 0;
        }

        //只有商城,供应商,益生插件订单参加
        if(!in_array($this->order->plugin_id,[0,61])){
            return 0;
        }


        // 获取满减设置,按enough倒序
        $settings = collect(Setting::get('enoughReduce.enoughReduce'));

        if (empty($settings)) {
            return 0;
        }

        $settings = $settings->sortByDesc(function ($setting) {
            return $setting['enough'];
        });

        $total_price = $this->getOrderGoodsPrice();
        // 订单总价满足金额,则返回优惠金额
        foreach ($settings as $setting) {
            if ($total_price >= $setting['enough']) {
                return min($setting['reduce'],$total_price);
            }
        }
        return 0;
    }

    private function getOrderGoodsPrice()
    {
        return $this->order->orderGoods->sum(function (PreOrderGoods $preOrderGoods) {
            if ($preOrderGoods instanceof PreOrderGiftGoods) {
                return $preOrderGoods->getGiftPrice();
            }
            //不可叠加的商品不算在内
            if (!MarketingService::inStackableActByGoods($preOrderGoods->goods, Marketing::STACKABLE_ACT_ENOUGH_REDUCE)) {
                return 0;
            }
            if(!MarketingEnoughReduceService::inStackableActByGoods($preOrderGoods->goods, $this->order, Marketing::STACKABLE_ACT_ENOUGH_REDUCE)){
                return 0;
            }
            return $preOrderGoods->getPriceBefore($this->getCode());
        });
    }
}