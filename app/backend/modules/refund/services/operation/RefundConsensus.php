<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/12/22
 * Time: 14:50
 */

namespace app\backend\modules\refund\services\operation;


use app\backend\modules\refund\services\RefundMessageService;
use app\common\events\order\AfterOrderRefundedEvent;
use app\common\events\order\AfterOrderRefundSuccessEvent;
use app\common\models\refund\RefundProcessLog;

/**
 * 手动退款
 * Class RefundConsensus
 * @package app\backend\modules\refund\services\operation
 */
class RefundConsensus extends RefundOperation
{

    protected $statusAfterChanged = self::CONSENSUS;
    protected $name = '手动退款';
    protected $timeField = 'refund_time';

    protected function afterEventClass()
    {
        //event(new AfterOrderRefundedEvent($this->order));
        return new AfterOrderRefundSuccessEvent($this);
    }

    protected function updateBefore()
    {
        // TODO: Implement updateBefore() method.
    }

    protected function updateAfter()
    {
        $this->updateOrderGoodsRefundStatus();
    }

    //必须要触发完退款事件，才订单关闭
    protected function triggerEventAfter()
    {
        if ($this->part_refund === 1) {
            $this->cancelRefund();
        } else {
            $this->closeOrder();
        }
    }

    protected function writeLog()
    {
        $detail = [
            $this->getRefundTypeName()[$this->refund_type].'完成',
        ];
        $processLog = RefundProcessLog::logInstance($this, RefundProcessLog::OPERATOR_SHOP);
        $processLog->setAttribute('operate_type', RefundProcessLog::OPERATE_REFUND_CONSENSUS);
        $processLog->saveLog($detail);
    }

    protected function sendMessage()
    {
        RefundMessageService::passMessage($this);//通知买家

        if (app('plugins')->isEnabled('instation-message')) {
            event(new \Yunshop\InstationMessage\event\OrderRefundSuccessEvent($this));
        }
    }
}