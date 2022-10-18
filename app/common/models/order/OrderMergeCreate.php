<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/12/22
 * Time: 13:48
 */

namespace app\common\models\order;

use app\common\models\BaseModel;

/**
 * Class OrderMergeCreate
 * @package app\common\models\order
 * @property array order_ids
 * @property int uniacid
 */
class OrderMergeCreate extends BaseModel
{
    public $table = 'yz_order_merge_create';
    public $timestamps = true;
    protected $guarded = [''];
    protected $appends = [];

    public function getOrderIdsAttribute($value)
    {
        return explode(',',$value);
    }

    public static function saveData($order_ids = '')
    {
        if (!$order_ids) {
            return false;
        }
        $data = [
            'uniacid' => \YunShop::app()->uniacid,
            'order_ids' => $order_ids
        ];
        $model = new self();
        $model->fill($data);
        return $model->save();
    }
}