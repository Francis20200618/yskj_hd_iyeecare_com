<?php
namespace app\frontend\modules\refund\services;

use app\common\exceptions\AppException;
use app\common\models\Order;
use app\common\models\refund\RefundApply;

/**
 * Created by PhpStorm.
 * Author: 芸众商城 www.yunzshop.com
 * Date: 2017/4/13
 * Time: 下午2:21
 */
class RefundService
{

    public static function getOptionalType(Order $order)
    {
        $refundTypes = [];

        if ($order->status >= \app\common\models\Order::WAIT_SEND) {
            $refundTypes[] = [
                'name'  => '退款(仅退款不退货)',
                'value' => RefundApply::REFUND_TYPE_REFUND_MONEY,
                'desc'  => '未收到货或者不用退货只退款',
                'icon'  =>  'icon-fontclass-daizhifu',
                'reasons' => [
                    'not_received' => [
                        '拍错/多拍/不想要',
                        '货物破损',
                        '快递送货问题',
                        '差价',
                        '其他原因'
                    ],
                    'received' => [
                        '货物破损',
                        '少件、漏发',
                        '差价',
                        '商品质量问题',
                        '其他原因',
                    ],
                ],
            ];
        }

        if ($order->status >= \app\common\models\Order::WAIT_RECEIVE) {

            $refundTypes[] = [
                'name' => '退款退货',
                'value' =>  RefundApply::REFUND_TYPE_RETURN_GOODS,
                'desc'  => '已收到货，需要退款退货',
                'icon'  =>  'icon-fontclass-daishouhuo',
                'reasons' => [
                    'not_received' => [],
                    'received' => [
                        '包装或商品破损、少商品',
                        '质量问题',
                        '配送问题',
                        '拍错/多拍/不想要',
                        '其他原因（可填）',
                    ]
                ],
            ];

            $refundTypes[] = [
                'name' => '换货',
                'value' => RefundApply::REFUND_TYPE_EXCHANGE_GOODS,
                'desc'  => '已收到货，需要更换',
                'icon'  =>  'icon-fontclass-daifahuo',
                'reasons' => [
                    'not_received' => [],
                    'received' => [],
                ],
            ];
        }

        return $refundTypes;
    }

    public static function getSendBackWay($order)
    {
        return RefundBackWayService::getBackWay($order);
    }

    public static function getSendBackWayData($refundApply)
    {
        return RefundBackWayService::getBackWayClassData($refundApply);
    }

    public static function getSendBackWayDetailData($refundApply)
    {
        return RefundBackWayService::getBackWayDetailData($refundApply);
    }

    public static function createOrderRN()
    {
        $refundSN = createNo('RN', true);
        while (1) {
            if (!RefundApply::where('refund_sn', $refundSN)->first()) {
                break;
            }
            $refundSN = createNo('RN', true);
        }
        return $refundSN;
    }

}
