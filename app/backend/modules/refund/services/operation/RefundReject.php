<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/12/22
 * Time: 14:22
 */

namespace app\backend\modules\refund\services\operation;


use app\backend\modules\refund\services\RefundMessageService;
use app\common\events\order\AfterOrderRefundRejectEvent;
use app\common\models\refund\RefundApply;
use app\common\models\refund\RefundGoodsLog;
use app\common\models\refund\RefundProcessLog;

/**
 * 驳回退款申请
 * Class RefundReject
 * @package app\backend\modules\refund\services\operation
 */
class RefundReject extends RefundOperation
{
    protected $statusBeforeChange = [self::WAIT_CHECK,self::WAIT_RETURN_GOODS,self::WAIT_RECEIVE_RETURN_GOODS];


    protected $name = '驳回';

    protected $statusAfterChanged = self::REJECT;

    protected function afterEventClass()
    {
        return new AfterOrderRefundRejectEvent($this);
    }

    protected function updateBefore()
    {
        $this->setAttribute('reject_reason', $this->getRequest()->input('reject_reason'));
        $this->setAttribute('status', self::REJECT);
    }

    protected function updateAfter()
    {
        $this->cancelRefund();
        //取消申请删除记录
       $this->delRefundOrderGoodsLog();
    }

    protected function writeLog()
    {
        $detail = [
            '驳回原因：'.$this->reject_reason,
        ];
        $processLog = RefundProcessLog::logInstance($this, RefundProcessLog::OPERATOR_SHOP);
        $processLog->setAttribute('operate_type', RefundProcessLog::OPERATE_REJECT);
        $processLog->saveLog($detail);
    }


    protected function sendMessage()
    {
        RefundMessageService::rejectMessage($this);//通知买家

        if (app('plugins')->isEnabled('instation-message')) {
            //开启了站内消息插件
            event(new \Yunshop\InstationMessage\event\RejectOrderRefundEvent($this));
        }
    }
}