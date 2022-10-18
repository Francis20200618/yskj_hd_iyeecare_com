<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/12/22
 * Time: 15:20
 */

namespace app\backend\modules\refund\services\operation;


use app\common\events\order\AfterOrderRefundResendEvent;
use app\common\models\refund\RefundProcessLog;
use app\common\models\refund\ResendExpress;
use app\common\repositories\ExpressCompany;

class RefundResend extends RefundOperation
{
    protected $statusAfterChanged = self::WAIT_RECEIVE_RESEND_GOODS;
    protected $name = '商家发货';
    protected $timeField = 'send_time';

    protected $resendExpress;

    protected function afterEventClass()
    {
        return new AfterOrderRefundResendEvent($this);
    }

    protected function updateBefore()
    {
        $expressData = $this->getRequest()->only('express_code', 'express_sn');

        $expressData['express_company_name'] = array_get(ExpressCompany::create()->where('value', $expressData['express_code'])->first(), 'name', '其他快递');

        
        $order_goods = $this->order->orderGoods;
        if ($order_goods) {
            foreach ($order_goods as $goods) {
                $refundGoods = $this->refundOrderGoods->where('order_goods_id', $goods['id'])->first();
                if ($refundGoods) {
                    $expressData['pack_goods'][] = [
                        'order_goods_id' => $refundGoods->order_goods_id,
                        'title' => $refundGoods->goods_title,
                        'goods_option_title' => $refundGoods->goods_option_title,
                        'thumb' => $refundGoods->goods_thumb,
                        'total' => $refundGoods->total,
                    ];
                    $refundGoods->fill(['send_num'=> 0])->save();
                }
            }
        }

        $resendExpress = new ResendExpress($expressData);
        $this->resendExpress()->save($resendExpress);

        $this->resendExpress = $resendExpress;
    }


    protected function updateAfter()
    {

    }

    protected function writeLog()
    {
        $detail = [
            '快递公司：'.$this->resendExpress->express_company_name,
            '快递单号：'.$this->resendExpress->express_sn,
        ];
        $processLog = RefundProcessLog::logInstance($this, RefundProcessLog::OPERATOR_SHOP);
        $processLog->setAttribute('operate_type', RefundProcessLog::OPERATE_SHOP_RESEND);
        $processLog->saveLog($detail);
    }
}