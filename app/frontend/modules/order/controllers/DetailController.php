<?php
/**
 * Created by PhpStorm.
 * Author: 芸众商城 www.yunzshop.com
 * Date: 2017/3/3
 * Time: 上午9:10
 */

namespace app\frontend\modules\order\controllers;

use app\common\components\ApiController;
use app\common\exceptions\AppException;
use app\common\models\DispatchType;
use app\common\models\Goods;
use app\common\models\Member;
use app\common\models\Order;
use app\common\models\orderGoods\OrderGoodsDiscount;
use app\common\models\PayType;
use app\framework\Http\Request;
use app\frontend\models\OrderAddress;
use app\common\services\goods\VideoDemandCourseGoods;
use app\frontend\modules\member\models\MemberModel;
use app\frontend\modules\member\services\MemberService;
use app\frontend\modules\goods\services\TradeGoodsPointsServer;
use Yunshop\Diyform\models\OrderGoodsDiyForm;
use app\frontend\modules\order\services\OrderService;
use Yunshop\PhotoOrder\models\OrderModel;
use Yunshop\StoreReserve\models\ReserveOrder;
use Yunshop\YsSystem\common\OrderDistinguish;

class DetailController extends ApiController
{
    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws AppException
     */
    public function index(Request $request)
    {

        $this->validate([
            'order_id' => 'required|integer'
        ]);
        $orderId = request()->query('order_id');
        $order = $this->getOrder()->with(['hasManyOrderGoods', 'orderDeduction', 'orderDiscount', 'orderFees', 'orderServiceFees', 'orderCoupon', 'orderInvoice', 'orderAddress'])->find($orderId);

        if (is_null($order)) {
            return $this->errorJson('订单不存在');
        }

        $order->hasManyOrderGoods->each(function ($orderGoods) {
            //评论
            $orderGoods->hasOneComment;
            //计算积分显示
            $orderGoods->points = $this->setGoodPoints($orderGoods->hasOneGoods, $orderGoods->price, $orderGoods->goods_cost_price);
            if($orderGoods->is_gift){
                $gift_discount = $orderGoods->orderGoodsDiscounts->first(function (OrderGoodsDiscount $orderGoodsDiscount) {
                    return in_array($orderGoodsDiscount->discount_code, ['gift','giftPlus']);
                });
                $orderGoods->offsetSet('gift_discount', $gift_discount);
            }else{
                $orderGoods->offsetSet('gift_discount', null);
            }
        });


        if ($order->orderInvoice) {
            $invoice = $order->orderInvoice;

        } else {
            $invoice = Order::getInvoice($orderId);

        }

        if (is_null($order)) {
            return $this->errorJson('未找到数据', []);
        }
        $orderCollect = collect([$order]);
        OrderDistinguish::setOverseasBatch($orderCollect);
        $order = $orderCollect->first();

        $data = $order->toArray();
        $data['pay_type_name'] = $this->getPayTypeName($order);//自定义显示支付类型名称
        $invoice->invoice = ("0" != $invoice->invoice) ? 1 : 0;
        $data['invoice_type'] = $invoice->invoice_type;
        $data['email'] = $invoice->email;
        $data['rise_type'] = $invoice->rise_type;
        $data['company_number'] = $invoice->company_number;
        $data['invoice_state'] = $invoice->invoice;
        $data['state'] = $invoice->state;//ShiJian20220505发票模块
        $data['phone'] = $invoice->phone;//ShiJian20220505发票模块
        $data['invoice_status'] = $invoice->rise_type;//ShiJian20220505发票模块
        if($data['order_invoice']['invoice_date'] == "")
        {
            $data['invoice_time'] = "";//开票时间//ShiJian20220505发票模块
        }
        else 
        {
            $data['invoice_time'] = date('Y-m-d H:i:s', ($data['order_invoice']['invoice_date']));//开票时间//ShiJian20220505发票模块
        }
        if($invoice->collect_name == "")
        {
            $data['collect_name'] = $invoice->call;
            $data['call'] = $invoice->call; 
        }
        else
        {
            $data['collect_name'] = $invoice->collect_name;
            $data['call'] = $invoice->collect_name;
        }        
        $data['invoice_price'] = $data['goods_price'];//开票金额//ShiJian20220505发票模块   
        $data['apply_time'] = date('Y-m-d H:i:s', ($data['order_invoice']['apply_time']));;//申请时间//ShiJian20220505发票模块
        $backups_button = $data['button_models'];
        $data['address_info'] = OrderAddress::select('address', 'mobile', 'realname')->where('order_id', $order['id'])->first() ?: [];
        if (app('plugins')->isEnabled('diyform')) {
            $orderGoodsIds = $order->hasManyOrderGoods->pluck('id');
            $formDatas = OrderGoodsDiyForm::whereIn('order_goods_id', $orderGoodsIds)->with(['diyformData' => function ($diyformData) {
                $diyformData->with(['diyformType']);
            }])->get()->toArray();
            foreach ($data['has_many_order_goods'] as &$orderGoods) {
                foreach ($formDatas as $formData) {
                    if ($orderGoods['id'] == $formData['order_goods_id']) {
                        $formType = unserialize($formData['diyform_data']['diyform_type']['fields']);
                        $formData = unserialize($formData['diyform_data']['data']);
                        $formContent = [];
                        foreach ($formData as $formKey => $formItem) {
                            if ($formType[$formKey]['data_type'] == 5) {
                                $formItem = array_map(function ($image) {
                                    return yz_tomedia($image);
                                }, $formItem);
                                $formContent[] = [
                                    'title' => $formType[$formKey]['tp_name'],
                                    'content' => [
                                        'title' => $formType[$formKey]['tp_name'],
                                        'vlaue' => $formItem
                                    ],
                                    'type' => 5,
                                ];
                            } else {
                                $formContent[] = [
                                    'title' => $formType[$formKey]['tp_name'],
                                    'content' => [$formItem],
                                    'type' => $formKey,
                                ];
                            }
                        }
                        //
                        $orderGoods['diyform_data'] = $formContent;
                        break;
                    }
                }
            }

        }
        if (app('plugins')->isEnabled('photo-order')) {
            $photo = OrderModel::where('order_id', $order['id'])->first();
            if ($photo) {
                $data['photo_order_thumbs'] = unserialize($photo['thumbs']);
            } else {
                $data['photo_order_thumbs'] = '';
            }
        }
        if (app('plugins')->isEnabled('store-cashier')) {

            //加入门店ID，订单跳转商品详情需要
            $store_id = \Yunshop\StoreCashier\store\models\StoreGoods::select()->byGoodsId($order->hasManyOrderGoods[0]->goods_id)->first()->store_id;
            $data['has_many_order_goods']['0']['store_id'] = $store_id;

            //临时解决
            $storeObj = \Yunshop\StoreCashier\common\models\Store::getStoreByCashierId($order->hasManyOrderGoods[0]->goods_id)->first();

            if ($storeObj) {
                $data['button_models'] = $backups_button;
            }

            $data['is_boss'] = false;
            if ($order->store->uid == MemberService::getCurrentMemberModel()->uid) {
                $data['is_boss'] = true;//店长标识
            }

            if ($order['dispatch_type_id'] == DispatchType::SELF_DELIVERY) {
                // $data['address_info'] = \Yunshop\StoreCashier\common\models\SelfDelivery::where('order_id', $order['id'])->first();

            } elseif ($order['dispatch_type_id'] == DispatchType::STORE_DELIVERY) {
                // $data['address_info'] = \Yunshop\StoreCashier\common\models\StoreDelivery::where('order_id', $order['id'])->first();
            }

            if (app('plugins')->isEnabled('store-reserve')) {
                $reserveOrder = ReserveOrder::where('order_id', $orderId)->first();
                if ($reserveOrder && $reserveOrder->date) {
                    $data['reserve_date'] = date('Y-m-d', $reserveOrder->date);
                }
            }
        }


        $videoDemand = new VideoDemandCourseGoods();
        foreach ($data['has_many_order_goods'] as &$value) {
            $value['thumb'] = yz_tomedia($value['thumb']);
            //视频点播
            $value['is_course'] = $videoDemand->isCourse($value['goods_id']);


        }

        $configs = \app\common\modules\shop\ShopConfig::current()->get('shop-foundation.order.order_detail');

        if ($configs) {
            foreach ($configs as $pluginName => $pluginOperators) {
                $class = array_get($pluginOperators, 'class');
                $function = array_get($pluginOperators, 'api_function');
                if (class_exists($class) && method_exists($class, $function) && is_callable([$class, $function])) {
                    $plugin_data = $class::$function($data['id']);
                    if ($plugin_data) {
                        $data[$pluginName] = $plugin_data;
                    }
                }
            }
        }
        if ($order['dispatch_type_id'] == 2) {
            $data['custom'] = $this->custom();
        }
        $data['receipt_goods_notice'] = OrderService::getReceiptGoodsNotice();

        return $this->successJson($msg = 'ok', $data);
    }

    private function custom()
    {
        $custom = '';
        if ($this->aSwitch()) {
            $lis = Order::find(request()->query('order_id'));
            $member_info = MemberModel::getUserInfos_v2($lis->uid)->first();
            if (empty($member_info)) {
                $this->jump = true;
                $this->jumpUrl(\YunShop::request()->type, Member::getMid());
            }
            //自定义表单
            $custom = (new MemberService())->newMemberInfoAttrStatus($member_info);
        }
        return $custom;
    }

    /**
     * 自定义显示支付方式名称
     * @param $order
     * @return string
     */
    protected function getPayTypeName($order)
    {
        if ($order->pay_type_id != PayType::CASH_PAY && $order->status == Order::WAIT_PAY) {
            return '未支付';
        }
        $append = '';
        if ($order->hasOneBehalfPay) {
            $append = "（代付:{$order->hasOneBehalfPay->behalf_id}）";
        }

        if ($order->pay_type_id == PayType::CREDIT) {
            $setCredit = \Setting::get('shop.shop.credit');
            return ($setCredit ?: '余额') . $append;
        }

        $pay_type_name = $order->hasOnePayType->name;
        if (app('plugins')->isEnabled('pay-manage')) {
            $pay_type_name = \Yunshop\PayManage\models\PayType::currentPayAlias($order->pay_type_id);
        }


        return $pay_type_name.$append;
    }

    private function memberId()
    {
        return \YunShop::app()->getMemberId();
    }

    private function aSwitch()
    {
        return \app\common\facades\Setting::get('plugin.store.membership_open') == 1;
    }

    protected function getOrder()
    {
        return app('OrderManager')->make('Order');
    }

    /**
     * @description 获取积分
     * @param $goodsModel
     * @param $goods_market_price
     * @param $goods_cost_price
     * @return mixed|string
     */
    private function setGoodPoints($goodsModel, $goods_market_price, $goods_cost_price)
    {
        $points = '';
        $tradeGoodsPointsServer = new TradeGoodsPointsServer;

        if ($tradeGoodsPointsServer->close(TradeGoodsPointsServer::ORDER_PAGE)) {
            return $points;
        }

        $tradeGoodsPointsServer->getPointSet($goodsModel);
        $points = $tradeGoodsPointsServer->finalSetPoint($points);

        return $tradeGoodsPointsServer->getPoint($points, $goods_market_price, $goods_cost_price);
    }

}