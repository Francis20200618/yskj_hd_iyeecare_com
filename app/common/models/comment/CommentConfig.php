<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/1/10
 * Time: 17:14
 */
namespace app\common\models\comment;

use Illuminate\Database\Eloquent\SoftDeletes;
use app\common\models\BaseModel;

class CommentConfig extends BaseModel
{
    use SoftDeletes;
    public $table = 'yz_comment_config';

    public $timestamps = true;

    protected $guarded = [];

    /**
     * @param string $column
     * @return mixed
     */
    public static function getSetConfig($column = '')
    {
        if ($column) {
            return static::uniacid()->first()->$column;
        } else {
            return static::uniacid()->first();
        }
    }

    //评分纬度
    public static function isScoreLatitude(): bool
    {
        return self::getSetConfig('is_score_latitude') ?? false;
    }
}