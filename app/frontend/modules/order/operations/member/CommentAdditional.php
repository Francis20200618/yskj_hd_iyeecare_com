<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/1/13
 * Time: 16:45
 */

namespace app\frontend\modules\order\operations\member;

use app\frontend\modules\order\operations\OrderOperation;

class CommentAdditional extends OrderOperation
{
    public function getApi()
    {
        return '';
    }

    public function getValue()
    {
        return static::ADDITIONAL_COMMENT;
    }

    public function getName()
    {
        return '追评';
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