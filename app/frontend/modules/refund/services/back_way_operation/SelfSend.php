<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/1/13
 * Time: 17:13
 */

namespace app\frontend\modules\refund\services\back_way_operation;


class SelfSend extends RefundBackWayOperation
{
    public $code = 'self_send';
    public $value = 0;
    public $name = '自行寄回';

    public function init()
    {

    }

    public function saveRelation()
    {

    }

    public function getEditData()
    {
        return [];
    }

    public function getOtherData()
    {
        return [];
    }

    public function isEnabled()
    {
        return true;
    }
}