<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/1/13
 * Time: 17:03
 */

namespace app\frontend\modules\refund\services\back_way_operation;

use app\common\models\Order;
use app\common\models\refund\RefundApply;

abstract class RefundBackWayOperation
{
    public $code;
    public $value;
    public $name;

    /**
     * @var Order
     */
    public $order;
    /**
     * @var RefundApply
     */
    public $refundApply;


    /**
     * todo 传入此可根据需要通过订单信息判断是否显示退货方式（此属性只在判断是否显示退货方式时设置，其余都设置refundApply属性）
     * @param Order $order
     * @return $this
     */
    public function setOrder(Order $order)
    {
        $this->order = $order;
        return $this;
    }

    /**
     * todo 传入此可判断是否添加/修改/取消售后申请以及退货方式$refundApply 目前只有修改和申请调用saveRelation&init
     * @param RefundApply $refundApply
     * @return $this
     */
    public function setRefundApply(RefundApply $refundApply)
    {
        $this->refundApply = $refundApply;
        return $this;
    }

    /**
     * 可抛出AppException异常终止售后申请提交
     * @return mixed
     */
    abstract function init();

    abstract function saveRelation();

    abstract function isEnabled();

    /**
     * 编辑售后页面获取回显数据
     * @return mixed
     */
    abstract function getEditData();

    /**
     * 售后详情页面获取其他数据
     * @return mixed
     */
    abstract function getOtherData();

    public function getCode()
    {
        return $this->code;
    }

    public function getValue()
    {
        return $this->value;
    }

    public function getName()
    {
        return $this->name;
    }
}