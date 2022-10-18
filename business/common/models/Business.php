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

class Business extends BaseModel
{

    public $table = 'yz_work_wechat_platform_crop';
    public $timestamps = true;
    protected $guarded = [];
    protected $appends = [];
    protected $casts = [];


    const IDENTITY_DESC = [
        1 => '员工',
        2 => '管理员',
        3 => '创建人',
        4 => '法人',
        5 => '法人、创建人'
    ];

    const STATUS_NORMAL = 1;//状态正常
    const STATUS_BAN = -1;//状态停用

    public function hasOneMember()
    {
        return $this->hasOne(Member::class, 'uid', 'member_uid');
    }

}