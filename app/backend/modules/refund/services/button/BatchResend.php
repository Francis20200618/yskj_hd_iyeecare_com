<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/12/27
 * Time: 19:09
 */

namespace app\backend\modules\refund\services\button;


use app\common\models\refund\RefundApply;

class BatchResend  extends RefundButtonBase
{
    public function getApi()
    {
        return 'refund.vue-operation.batch-resend';
    }

    public function getName()
    {

        return '分批发货';
    }

    public function getValue()
    {
        return 'batch_resend';
    }

    public function enable()
    {
        return (RefundApply::WAIT_CHECK < $this->refund->status &&  $this->refund->status < RefundApply::WAIT_RECEIVE_RESEND_GOODS)
            && $this->refund->refundOrderGoods->isNotEmpty();
    }

    public function getType()
    {
        return self::TYPE_PRIMARY;
    }

    public function getDesc()
    {
        if ($this->refund->status < RefundApply::WAIT_RECEIVE_RETURN_GOODS) {
            return '无需客户寄回商品，商家直接发换货商品';
        }

        return '';
    }
}