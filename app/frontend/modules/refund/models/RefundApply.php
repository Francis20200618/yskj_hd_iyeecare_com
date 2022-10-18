<?php

namespace app\frontend\modules\refund\models;

use app\frontend\models\Order;

/**
 * Created by PhpStorm.
 * Author: 芸众商城 www.yunzshop.com
 * Date: 2017/4/12
 * Time: 下午9:53
 */
class RefundApply extends \app\common\models\refund\RefundApply
{

    protected $appends = [
        'refund_type_name', 'status_name', 'is_refunded', 'is_refunding', 'is_refund_fail', 'plugin_id',
        'receive_status_name', 'refund_way_type_name','button_models',
    ];

    /**
     * 前端获取退款按钮 todo 转移到前端的model
     * @return array
     */
    public function getButtonModelsAttribute()
    {
        $result = [];
        if ($this->status == self::WAIT_CHECK) {
            $result[] = [
                'name' => '修改申请',
                'api' => 'refund.edit.index',
                'value' => 1
            ];
            $result[] = [
                'name' => '取消申请',
                'api' => 'refund.operation.cancel',
                'value' => 4
            ];
        }
        if ($this->status == self::WAIT_RETURN_GOODS) {

            if (!($this->order->plugin_id == 40)) {
                $result[] = [
                    'name' => '填写快递',
                    'api' => 'refund.operation.send',
                    'value' => 2
                ];
            }
        }
        if ($this->status == self::WAIT_RECEIVE_RESEND_GOODS) {
            $result[] = [
                'name' => '确认收货',
                'api' => 'refund.operation.complete',
                'value' => 3
            ];
        }

        if ($this->refund_type == self::REFUND_TYPE_EXCHANGE_GOODS && $this->hasManyResendExpress->isNotEmpty()) {
            $result[] = [
                'name' => '查看物流',
                'api' => 'refund.express.resend-list',
                'value' => 6
            ];
        }

        return $result;
    }

    public function scopeDetail($query)
    {
        return $query->with(['order','returnExpress','hasManyResendExpress','refundOrderGoods'=>function($query){
            $query->with(['marketingOrderGoods','orderGoods' => function($query){
                $query->select(['id','order_id','discount_price','deduction_amount','goods_id','title','thumb','goods_option_title','goods_price','payment_amount'])
                ->with(['orderGoodsDiscounts'=>function($query){
                    $query->select(['id','order_goods_id','name','amount']);
                },'orderGoodsDeductions'=>function($query){
                    $query->select(['id','order_goods_id','used_amount','name']);
                }]);
            }]);
        }]);
    }


    protected static function boot()
    {
        parent::boot();
        self::addGlobalScope(function ($query) {
            return $query->where('uid', \YunShop::app()->getMemberId());
        });
    }

    public function scopeDefaults($query)
    {
        return $query->with(['order'])->orderBy('id', 'desc');
    }

}