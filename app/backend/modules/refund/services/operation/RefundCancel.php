<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/12/22
 * Time: 15:11
 */

namespace app\backend\modules\refund\services\operation;


use app\common\events\order\AfterOrderRefundCancelEvent;
use app\common\models\refund\RefundGoodsLog;
use app\common\models\refund\RefundProcessLog;

class RefundCancel extends RefundOperation
{
    protected $statusBeforeChange = [self::WAIT_CHECK];
    protected $statusAfterChanged = self::CANCEL;
    protected $name = '取消';

    protected function updateBefore()
    {

    }

    protected function updateAfter()
    {
        $this->order->cancelRefund();

        //取消申请删除记录
        $this->delRefundOrderGoodsLog();
    }


    protected function writeLog()
    {
        $detail = [
            '用户关闭申请',
        ];
        $processLog = RefundProcessLog::logInstance($this, RefundProcessLog::OPERATOR_MEMBER);
        $processLog->setAttribute('operate_type', RefundProcessLog::OPERATE_APPLY);
        $processLog->saveLog($detail);
    }

    protected function afterEventClass()
    {
        return new AfterOrderRefundCancelEvent($this);
    }
}