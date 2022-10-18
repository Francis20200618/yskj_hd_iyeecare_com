<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/12/23
 * Time: 15:39
 */

namespace app\frontend\modules\refund\services\operation;


use app\backend\modules\refund\services\operation\RefundOperation;
use app\common\exceptions\AppException;
use app\common\models\OrderGoods;
use app\common\models\refund\RefundGoodsLog;
use app\common\models\refund\RefundProcessLog;
use app\frontend\modules\refund\services\RefundMessageService;
use app\common\events\order\OrderRefundApplyEvent;
use app\common\services\SystemMsgService;
use app\frontend\modules\refund\services\RefundService;

class RefundApply extends RefundOperation
{
    protected $statusAfterChanged = self::WAIT_CHECK;
    protected $name = '申请退款';
    protected $timeField = 'create_time'; //操作时间

    protected $refundGoods;


    //退款金额
    public function getRefundPrice()
    {

        $refund_price = collect($this->getRefundGoods())->sum('refund_price');

        return $refund_price;
    }

    public function isPartRefund()
    {
//        $orderGoodsNum = $this->order->orderGoods->count();
//
//        $refundedNum = RefundGoodsLog::where('order_id',$this->order->id)->count();
//
//        if ($orderGoodsNum == count($this->refundGoods)) {
//            return 0; //全额退款
//        }
//
//        if ($orderGoodsNum == (count($this->refundGoods) + $refundedNum)) {
//            return 2; //最后一次退款
//        }

        //按商品数量进行售后而非按sku数
        $orderGoodsNum = $this->order->orderGoods->sum('total');

        $collection = RefundGoodsLog::where('order_id', $this->order->id)->get();
         //换货类型的售后不算在内
        $refundedNum = $collection->isEmpty() ? 0 : RefundGoodsLog::filterExchangeType($collection)->sum('refund_total');

        $applyNumber = collect($this->getRefundGoods())->sum('total');
        if ($orderGoodsNum == $applyNumber) {
            return 0; //全额退款
        }

        if ($orderGoodsNum == ($applyNumber + $refundedNum)) {
            return 2; //最后一次退款
        }

        if(($applyNumber + $refundedNum) > $orderGoodsNum){
            throw new AppException("申请售后的商品数量超过可售后的商品数量！");
        }

        return 1; //部分退款
    }

    protected function updateBefore()
    {

        $refundApplyData = $this->getRequest()->only([
            'reason', 'content', 'refund_type', 'order_id','receive_status','refund_way_type',
        ]);

        if (is_array($this->getRequest()->input('images'))) {
            $refundApplyData['images'] = $this->getRequest()->input('images');
        } else {
            $refundApplyData['images'] = $this->getRequest()->input('images') ? json_decode($this->getRequest()->input('images'), true):[];
        }

        //申请退款金额
        $refundApplyData['apply_price'] =  $this->getRefundPrice();
        //退款运费金额
        $refundApplyData['freight_price'] = $this->getRequest()->input('freight_price',0);
        //退款其他金额
        $refundApplyData['other_price'] =  $this->getRequest()->input('other_price',0);
        //售后次数
        $refundApplyData['part_refund'] = $this->isPartRefund();

        //退款总金额,换货售后退款金额为0
        $price = bcadd($refundApplyData['apply_price'], ($refundApplyData['freight_price'] + $refundApplyData['other_price']),2);

        if ($refundApplyData['refund_type'] == static::REFUND_TYPE_EXCHANGE_GOODS) {
            $refundApplyData['price'] = 0;
        } else {
            //售后金额不能大于订单实付金额
            $refundApplyData['price'] = min($this->order->price, $price);
        }
        $refundApplyData['refund_sn'] = RefundService::createOrderRN();

        $this->fill($refundApplyData);

        $this->backWay()->init($this);  //走退货方式验证
    }

    protected function updateAfter()
    {

        $this->order->refund_id = $this->id;
        if (!$this->order->save()) {
            throw new AppException('订单退款状态改变失败');
        }

        if ($this->refundGoods) {
            foreach ($this->refundGoods as $goodsItem) {
                RefundGoodsLog::saveData($this,$goodsItem);
            }
        }

        $this->setBackWay();    //保存退货方式内容
    }

    protected function afterEventClass()
    {
        return new OrderRefundApplyEvent($this);
    }


    protected function writeLog()
    {
        $detail = [
            '售后类型：'. $this->getRefundTypeName()[$this->refund_type],
            $this->refund_type == static::REFUND_TYPE_EXCHANGE_GOODS ? '': '退款金额：'.$this->price,
            $this->freight_price?'运费:'. $this->freight_price :'',
            $this->other_price?'其他费用:'. $this->other_price :'',
            '售后原因：'.$this->reason,
            '说明：'.$this->content,
        ];
        $processLog = RefundProcessLog::logInstance($this, RefundProcessLog::OPERATOR_MEMBER);
        $processLog->setAttribute('operate_type', RefundProcessLog::OPERATE_APPLY);
        $processLog->saveLog($detail);
    }

    protected function sendMessage()
    {
        //通知买家
        RefundMessageService::applyRefundNotice($this);
        RefundMessageService::applyRefundNoticeBuyer($this);

        //【系統消息通知】
        (new SystemMsgService())->applyRefundNotice($this);

        if (app('plugins')->isEnabled('instation-message')) {
            //开启了站内消息插件
            event(new \Yunshop\InstationMessage\event\OrderRefundApplyEvent($this));
        }
    }


    protected function getRefundGoods()
    {
        if (isset($refundGoods)) {
            return $this->refundGoods;
        }

        if (is_array($this->getRequest()->input('order_goods'))) {
            $refundGoods = $this->getRequest()->input('order_goods');
        } else {
            $refundGoods = json_decode($this->getRequest()->input('order_goods'), true);
        }


        if (!$refundGoods) {
            $refundGoods = $this->order->orderGoods->where('is_refund',0)->map(function ($orderGoods) {
                return ['id'=> $orderGoods->id, 'total'=>$orderGoods->total,'refund_price'=> $orderGoods->payment_amount, 'refund_type'=>$this->getRequest()->input('refund_type')];
            })->values()->all();
        } else {

            $totalArrays = array_column($refundGoods,'total','id');
            $refundGoods = $this->order->orderGoods->whereIn('id',array_keys($totalArrays))->map(function ($orderGoods) use ($totalArrays) {
                $refund_price = ($orderGoods->payment_amount / $orderGoods->total) * $totalArrays[$orderGoods->id];
                return ['id'=> $orderGoods->id, 'total'=>$totalArrays[$orderGoods->id],'refund_price'=> $refund_price, 'refund_type'=>$this->getRequest()->input('refund_type')];
            })->values()->all();

        }
        \Log::debug('refundGoods::', $refundGoods);

        return $this->refundGoods = $refundGoods;
    }
}