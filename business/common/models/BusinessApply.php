<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/9/22
 * Time: 13:37
 */


namespace business\common\models;

use app\common\models\BaseModel;
use \app\backend\modules\member\models\Member;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletes;

class BusinessApply extends BaseModel
{

    public $table = 'yz_work_wechat_platform_crop_apply';
    public $timestamps = true;
    protected $guarded = [];
    protected $appends = [];
    protected $casts = [];


    const STATUS_WAIT = 0;//等待审核
    const STATUS_SUCCESS = -1;//审核通过
    const STATUS_FAIL = -1;//审核失败


    public function scopeSearch(Builder $query, $search)
    {
        $query->status($search['status']);
        $query->name($search['name']);
        $query->orderBy('id', 'DESC');
    }

    public function scopeName(Builder $query, $name)
    {
        if ($name || !is_null($name) || $name !== '') {
            $query->where('name', 'like', "%{$name}%");
        }
    }

    public function scopeStatus(Builder $query, $status)
    {
        if ($status || $status === 0 || $status === '0') {
            $query->where('status', $status);
        }
    }


    public function hasOneMember()
    {
        return $this->hasOne(Member::class, 'uid', 'uid');
    }

}