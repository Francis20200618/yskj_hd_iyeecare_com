<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/1/12
 * Time: 16:29
 */

namespace app\outside\modules\order\models;


use app\common\models\order\OrderMergeCreate;
use app\common\modules\memberCart\MemberCartCollection;
use app\frontend\modules\order\models\PreOrder;
use Illuminate\Support\Facades\DB;
use Yunshop\Marketing\models\MarketingOrder;

class BuyTrade extends \app\common\modules\trade\models\Trade
{

    public function generate()
    {
        DB::transaction(function () {
            $this->orders->map(function (PreOrder $order) {
                /**
                 * @var $order
                 */
                $order->generate();
                $order->fireCreatedEvent();
            });
            OrderMergeCreate::saveData($this->orders->pluck('id')->implode(','));

            //设置订单与第三方请求下单关系
            $preOutsideOrder = new PreOutsideOrder();
            $preOutsideOrder->setOrders($this->orders);
            $preOutsideOrder->store();
            $this->setRelation('outsideOrder', $preOutsideOrder);

            //设置订单与营销活动关联关系
            $groups = [];
            /**
             * @var PreOrder $order
             */
            foreach ($this->orders as $order) {
                $marketings = $order->getOccurredMarketings();
                if (empty($marketings)) {
                    continue;
                }
                foreach ($marketings as $marketing_info) {
                    if (!empty($marketing_info['desc']['rule'])) {
                        $groups[$marketing_info['id']][] = $order;
                    }
                }
            }
            foreach ($groups as $marketing_id => $orders) {
                $marketingOrder = new MarketingOrder();
                $marketingOrder->uniacid = $orders[0]->uniacid;
                $marketingOrder->member_id = $orders[0]->uid;
                $marketingOrder->marketing_id = $marketing_id;
                $marketingOrder->order_ids = collect($orders)->pluck('id')->unique()->implode(',');
                $marketingOrder->occurred_marketing_rule = $marketings[$marketing_id]['desc']['rule'];
                $marketingOrder->created_at = $marketingOrder->updated_at = date('Y-m-d H:i:s');
                $marketingOrder->save();
            }
            return $this->orders;
        });
    }
}