<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/9/6
 * Time: 15:15
 */

namespace app\frontend\modules\order\operations\member;


use app\frontend\modules\order\operations\OrderOperation;


class CloseReason extends OrderOperation
{
    public function getApi()
    {
        return 'order.operation.close-reason';
    }
    public function getName()
    {
        return '关闭原因';
    }

    public function getValue()
    {
        return 'close_reason';
    }

    public function enable()
    {
        if ($this->order->close_reason) {
            return true;
        }
        return false;
    }
}