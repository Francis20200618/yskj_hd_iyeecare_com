<?php

namespace app\frontend\modules\refund\controllers;

use app\common\components\ApiController;
use app\common\events\order\OrderRefundApplyEvent;
use app\common\exceptions\AppException;
use app\common\models\refund\RefundApply;
use app\common\services\SystemMsgService;
use app\framework\Http\Request;
use app\frontend\models\Order;
use app\frontend\modules\refund\services\RefundService;
use app\frontend\modules\refund\services\RefundMessageService;
use app\frontend\modules\order\services\MiniMessageService;
/**
 * Created by PhpStorm.
 * Author: 芸众商城 www.yunzshop.com
 * Date: 2017/4/12
 * Time: 下午4:24
 */
class ApplyController extends ApiController
{
    public function index(Request $request)
    {
        $this->validate([
            'order_id' => 'required|integer'
        ]);
        $order = Order::select(['id','status','plugin_id','goods_price','order_goods_price','price','refund_id','dispatch_price','fee_amount','service_fee_amount'])
            ->with('orderGoods')
            ->find($request->query('order_id'));
        if (!isset($order)) {
            throw new AppException('订单不存在');
        }

        //预约订单限制
        if (!is_null(\app\common\modules\shop\ShopConfig::current()->get('store_reserve_refund'))) {
            $class = array_get(\app\common\modules\shop\ShopConfig::current()->get('store_reserve_refund'), 'class');
            $function = array_get(\app\common\modules\shop\ShopConfig::current()->get('store_reserve_refund'), 'function');
            $plugin_res = $class::$function($request->query('order_id'));
            if(!$plugin_res['res'])
            {
                throw new AppException($plugin_res['msg']);
            }
        }

        $refundTypes = RefundService::getOptionalType($order);


        $data = compact('order','refundTypes');


        $refundedPrice =  \app\common\models\refund\RefundApply::uniacid()
            ->select('order_id','price','apply_price', 'freight_price', 'other_price')
            ->where('order_id', $order->id)
            ->where('status', '>=', RefundApply::COMPLETE)
            ->get();


        $orderOtherPrice = $this->getOrderOtherPrice($order);

        $data['order']['price'] = max($order->price - $order->dispatch_price - $orderOtherPrice,0);
        //可退运费
        $data['refundable_freight'] = max(bcsub($order->dispatch_price, $refundedPrice->sum('freight_price'),2),0);
        //订单可退其他费用
        $data['refundable_other'] = max(bcsub($orderOtherPrice, $refundedPrice->sum('other_price'),2),0);

        $data['support_batch'] = in_array($order->plugin_id, [0]);

        $data['send_back_way'] = RefundService::getSendBackWay($order);

        return $this->successJson('成功', $data);
    }

    //订单其他费用退款
    protected function getOrderOtherPrice($order)
    {
        //预约商品服务费不退
        if (!is_null(\app\common\modules\shop\ShopConfig::current()->get('store_reserve_refund_price')) && $order->status == Order::COMPLETE) {
            $class = array_get(\app\common\modules\shop\ShopConfig::current()->get('store_reserve_refund_price'), 'class');
            $function = array_get(\app\common\modules\shop\ShopConfig::current()->get('store_reserve_refund_price'), 'function');
            $plugin_res = $class::$function($order);
            if($plugin_res['res']) {
                return $order->service_fee_amount;
            }
        }

        return $order->fee_amount + $order->service_fee_amount;
    }


    public function store(Request $request)
    {
        $this->validate([
//            'reason' => 'required|string',
            'content' => 'sometimes|string',
            'refund_type' => 'required|integer',
            'order_id' => 'required|integer'
        ], $request,[
            'reason.required'=>'退款原因未选择',
            'refund_type.required'=>'退款方式未选择',
        ]);

        //预约订单限制
        if (!is_null(\app\common\modules\shop\ShopConfig::current()->get('store_reserve_refund'))) {
            $class = array_get(\app\common\modules\shop\ShopConfig::current()->get('store_reserve_refund'), 'class');
            $function = array_get(\app\common\modules\shop\ShopConfig::current()->get('store_reserve_refund'), 'function');
            $plugin_res = $class::$function($request->input('order_id'));
            if(!$plugin_res['res'])
            {
                throw new AppException($plugin_res['msg']);
            }
        }

        $order = Order::find($request->input('order_id'));
        if (!isset($order)) {
            throw new AppException('订单不存在');
        }
        if ($order->uid != \YunShop::app()->getMemberId()) {
            throw new AppException('无效申请,该订单属于其他用户');
        }
        if ($order->status < Order::WAIT_SEND) {
            throw new AppException('订单未付款,无法退款');
        }

        if ($order->hasOneRefundApply && $order->hasOneRefundApply->isRefunding()) {
            throw new AppException('申请已提交,处理中');
        }

        $refundApply = new \app\frontend\modules\refund\services\operation\RefundApply();
        $refundApply->setRelation('order',$order);

        $refundApply->execute();

        return $this->successJson('成功', $refundApply->toArray());

//        $refundApply = new RefundApply($request->only(['reason', 'content', 'refund_type', 'order_id']));
//
//        if (is_array(request()->input('images'))) {
//             $refundApply->images = request()->input('images');
//        } else {
//            $refundApply->images = request()->input('images') ? json_decode(request()->input('images'), true):[];
//        }
//
//
//        $refundApply->content = $request->input('content', '');
//        $refundApply->refund_sn = RefundService::createOrderRN();
//        $refundApply->create_time = time();
//        $refundApply->price = $order->price;
//        $refundApply->status = $refundApply->status ?: 0;
//        //预约商品服务费不退
//        if (!is_null(\app\common\modules\shop\ShopConfig::current()->get('store_reserve_refund_price')) && $order->status == Order::COMPLETE) {
//            $class = array_get(\app\common\modules\shop\ShopConfig::current()->get('store_reserve_refund_price'), 'class');
//            $function = array_get(\app\common\modules\shop\ShopConfig::current()->get('store_reserve_refund_price'), 'function');
//            $plugin_res = $class::$function($order);
//            if($plugin_res['res'])
//            {
//                $refundApply->price = $plugin_res['price'];
//            }
//        }
//
//        if (!$refundApply->save()) {
//            throw new AppException('请求信息保存失败');
//        }
//        $order->refund_id = $refundApply->id;
//        if (!$order->save()) {
//            throw new AppException('订单退款状态改变失败');
//        }
//
//        //通知买家
//        RefundMessageService::applyRefundNotice($refundApply);
//        RefundMessageService::applyRefundNoticeBuyer($refundApply);
//
//        event(new OrderRefundApplyEvent($refundApply));
//
//        //【系統消息通知】
//        (new SystemMsgService())->applyRefundNotice($refundApply);
//
//        if (app('plugins')->isEnabled('instation-message')) {
//            //开启了站内消息插件
//            event(new \Yunshop\InstationMessage\event\OrderRefundApplyEvent($refundApply));
//        }

//        return $this->successJson('成功', $refundApply->toArray());
    }
}