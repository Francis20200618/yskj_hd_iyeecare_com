<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/1/13
 * Time: 16:57
 */

namespace app\frontend\modules\refund\services;


use app\common\models\Order;
use app\common\models\refund\RefundApply;
use app\frontend\modules\refund\services\back_way_operation\RefundBackWayOperation;
use app\frontend\modules\refund\services\back_way_operation\SelfSend;

class RefundBackWayService
{
    public static function getBackWayConfig()
    {
        $configs = \app\common\modules\shop\ShopConfig::current()->get('shop-foundation.send_back_way');
        return $configs;
    }

    public static function getBackWay(Order $order)
    {
        $config = self::getBackWayConfig();
        $backWay = [];
        foreach ($config as $class) {
            if (!class_exists($class)) {
                continue;
            }
            $operation = new $class();
            if (!$operation instanceof RefundBackWayOperation) {
                continue;
            }
            $operation->setOrder($order);
            if (!$operation->isEnabled()) {
                continue;
            }
            $backWay[] = [
                'code' => $operation->getCode(),
                'value' => $operation->getValue(),
                'name' => $operation->getName(),
            ];
        }
        return $backWay;
    }

    /**
     * @param $code
     * @return RefundBackWayOperation|SelfSend
     */
    public static function getBackWayClass($code)
    {
        $config = self::getBackWayConfig();

        foreach ($config as $key=>$class) {
            if (!class_exists($class) || $code != get_class_vars($class)['value']) {
                continue;
            }
            $operation = new $class();
            if (!$operation instanceof RefundBackWayOperation) {
                continue;
            }
            $backWay = $operation;
            break;
        }
        isset($backWay) || $backWay = new SelfSend();//默认返回自行寄回
        return $backWay;
    }

    public static function getBackWayClassData(RefundApply $refundApply)
    {
        return self::getBackWayClass($refundApply->refund_way_type)->setRefundApply($refundApply)->getEditData();
    }

    public static function getBackWayDetailData(RefundApply $refundApply)
    {
        return self::getBackWayClass($refundApply->refund_way_type)->setRefundApply($refundApply)->getOtherData();
    }
}