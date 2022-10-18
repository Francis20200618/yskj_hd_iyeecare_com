<?php
/**
 * Created by PhpStorm.
 * User: shenyang
 * Date: 2018/8/2
 * Time: 下午5:51
 */

namespace app\frontend\modules\order\operations\member;


use app\frontend\modules\order\operations\OrderOperation;

class ApplyRefund extends OrderOperation
{
    public function getApi()
    {
        return 'refund.apply.store';
    }
    public function getValue()
    {
        return static::REFUND;
    }
    public function getName()
    {
        return '申请售后';
    }
    public function enable()
    {
        //商城关闭退款按钮
        if (!\Setting::get('shop.trade.refund_status')) {
            return false;
        }

        //商品开启不可退款
        if ($this->order->no_refund) {
            return false;
        }
        return $this->order->canRefund();
    }

}