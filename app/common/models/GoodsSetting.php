<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/12/28
 * Time: 13:48
 */

namespace app\common\models;

use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class GoodsSpec
 * @package app\common\models
 * @property int uniacid
 * @property int goods_id
 */
class GoodsSetting extends \app\common\models\BaseModel
{
    use SoftDeletes;

    public $timestamps = true;

    public $table = 'yz_goods_setting';
    
    public $guarded = [];

    public static function getSet($column = '')
    {
        if ($column) {
            return static::uniacid()->first()->$column;
        } else {
            return static::uniacid()->first();
        }
    }
}