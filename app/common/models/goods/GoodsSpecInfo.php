<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/12/10
 * Time: 14:04
 */

namespace app\common\models\goods;

use app\common\models\BaseModel;

/**
 * Class GoodsSpecInfo
 * @package app\common\models\goods
 * @property int uniacid
 * @property int goods_id
 * @property int goods_option_id
 * @property string info_img
 * @property int sort
 * @property array content
 */
class GoodsSpecInfo extends BaseModel
{
    protected $table = 'yz_goods_spec_info';

    public $timestamps = true;

    protected $guarded = [''];

    protected $appends= ['info_img_src'];

    public function getContentAttribute($value)
    {
        return json_decode($value,true);
    }

    public function setContentAttribute($value)
    {
        $this->attributes['content'] = json_encode($value);
    }

    public function getInfoImgSrcAttribute()
    {
        return yz_tomedia($this->info_img);
    }
}