<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/2/14
 * Time: 13:56
 */

namespace app\common\events\order;

use app\common\models\refund\RefundApply;
use app\common\events\Event;

/**
 * 换货商家发货
 * Class AfterOrderRefundResendEvent
 * @package app\common\events\order
 */
class AfterOrderRefundResendEvent extends Event
{
    protected $refundModel;

    public function __construct(RefundApply $refundModel)
    {
        $this->refundModel = $refundModel;
    }

    public function getModel()
    {
        return $this->refundModel;
    }

    public function getOrderModel()
    {
        return $this->refundModel->order;
    }
}