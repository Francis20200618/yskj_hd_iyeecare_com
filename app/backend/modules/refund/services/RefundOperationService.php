<?php

namespace app\backend\modules\refund\services;

use app\backend\modules\refund\services\operation\RefundBatchResend;
use app\backend\modules\refund\services\operation\RefundChangePrice;
use app\backend\modules\refund\services\operation\RefundClose;
use app\backend\modules\refund\services\operation\RefundComplete;
use app\backend\modules\refund\services\operation\RefundConsensus;
use app\backend\modules\refund\services\operation\RefundExchangeComplete;
use app\backend\modules\refund\services\operation\RefundPass;
use app\backend\modules\refund\services\operation\RefundReject;
use app\backend\modules\refund\services\operation\RefundResend;
use app\backend\modules\refund\services\operation\RefundSendBack;
use app\backend\modules\refund\services\operation\RefundCancel;
use Illuminate\Support\Facades\DB;
use app\backend\modules\refund\models\RefundApply;
use app\common\events\order\AfterOrderRefundedEvent;
use app\common\exceptions\AdminException;
use app\common\exceptions\AppException;
use app\common\events\order\AfterOrderRefundRejectEvent;
use app\common\events\order\AfterOrderRefundSuccessEvent;

/**
 * Created by PhpStorm.
 * Author: 芸众商城 www.yunzshop.com
 * Date: 2017/4/13
 * Time: 下午2:21
 */
class RefundOperationService
{
    public static function refundReject($params)
    {
        $refundApply = RefundReject::find($params['refund_id']);
        $result = DB::transaction(function () use ($refundApply) {
            return $refundApply->execute();
        });

        return $result;
    }

    /**
     * @param $params
     * @return bool
     * @throws AppException
     */
    public static function refundPass($params)
    {
        $refundApply = RefundPass::find($params['refund_id']);

        $result = DB::transaction(function () use ($refundApply) {
            return $refundApply->execute();
        });

        return $result;
    }

    /**
     * @param $params
     * @return bool
     * @throws AppException
     */
    public static function refundBatchResend($params)
    {
        $refundApply = RefundBatchResend::find($params['refund_id']);

        $result = DB::transaction(function () use ($refundApply) {
            return $refundApply->execute();
        });

        return $result;
    }

    /**
     * @param $params
     * @return bool
     * @throws AppException
     */
    public static function refundResend($params)
    {
        $refundApply = RefundResend::find($params['refund_id']);

        $result = DB::transaction(function () use ($refundApply) {
            return $refundApply->execute();
        });

        return $result;
    }

    /**
     * @param $params
     * @return mixed
     */
    public static function refundClose($params)
    {
        $refundApply = RefundClose::find($params['refund_id']);

        $result = DB::transaction(function () use ($refundApply) {
            return $refundApply->execute();
        });

        return $result;
    }

    /**
     * todo 前端接口 迁移到一起管理
     * @return mixed
     * @throws AppException
     */
    public static function refundSendBack($params)
    {
        $refundSend = RefundSendBack::find($params['refund_id']);

        return $refundSend->execute();
    }

    /**
     * todo 前端接口  迁移到一起管理
     * @return mixed
     * @throws AppException
     */
    public static function refundCancel($params)
    {
        $refundCancel = RefundCancel::find($params['refund_id']);

        return $refundCancel->execute();

    }

    /**
     *  todo 前端接口 迁移到一起管理
     * @return mixed
     * @throws AppException
     */
    public static function refundExchangeComplete($params)
    {
        $refundComplete = RefundExchangeComplete::find($params['refund_id']);

        return $refundComplete->execute();
    }


    public static function refundConsensus($params)
    {
        $refundApply = RefundConsensus::find($params['refund_id']);

        $result = DB::transaction(function () use ($refundApply) {
            return $refundApply->execute();
        });

        return $result;
    }

    public static function refundComplete($params)
    {
        $id = $params['refund_id']?:$params['id'];
        $refundApply = RefundComplete::find($id);

        if (!isset($refundApply)) {
            throw new AdminException('(ID:'.$id.')退款申请不存在');
        }

        $result = DB::transaction(function () use ($refundApply) {
            return $refundApply->execute();
        });

        return $result;
    }

    public static function refundChangePrice($params)
    {

        $refundApply = RefundChangePrice::find($params['refund_id']);

        $result = DB::transaction(function () use ($refundApply) {
            return $refundApply->execute();
        });

        return $result;

    }
}