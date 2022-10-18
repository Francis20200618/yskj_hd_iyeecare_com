<?php
/**
 * Created by PhpStorm.
 * Author: 芸众商城 www.yunzshop.com
 * Date: 2017/4/21
 * Time: 下午1:58
 */

namespace app\frontend\models;

use app\common\models\comment\CommentConfig;
use app\frontend\models\goods\Sale;
use app\frontend\modules\goods\models\Comment;

/**
 * Class OrderGoods
 * @package app\frontend\models
 * @property GoodsOption goodsOption
 * @property Goods belongsToGood
 */
class OrderGoods extends \app\common\models\OrderGoods
{

    public function scopeDetail($query)
    {
        return $query->select(['id', 'order_id', 'goods_option_title', 'goods_id', 'goods_price', 'total', 'price', 'title', 'thumb', 'comment_status']);
    }

    public function sale()
    {
        return $this->hasOne(Sale::class, 'goods_id', 'goods_id');
    }

    public function getButtonsAttribute()
    {
        if($this->order->uid != \YunShop::app()->getMemberId()){
            return [];
        }
        $result = [];
        $config = CommentConfig::getSetConfig();

        if ($this->order->status != 3) {
            return $result;
        }
        //开启评价
        if ($config->is_order_comment_entrance) {
            if ($this->comment_status == 0) {
                $result[] = [
                    'name' => '评价',
                    'api' => '',//goods.comment.create-comment-page
                    'value' => '0'
                ];
            } elseif ($this->comment_status == 1) {
                $result[] = [
                    'name' => '查看评价',
                    'api' => '',
                    'value' => '2'
                ];

                //开启追评
                if ($config->is_additional_comment) {
                    $result[] = [
                        'name' => '追评',
                        'api' => '',
                        'value' => '1'
                    ];
                }
            } else {
                $result[] = [
                    'name' => '查看评价',
                    'api' => '',
                    'value' => '2'
                ];
            }
        }

        return $result;
    }

    public static function getMyCommentList($status)
    {
        $list = self::select()->Where('comment_status', $status)->orderBy('id', 'desc')->get();
        return $list;
    }


}