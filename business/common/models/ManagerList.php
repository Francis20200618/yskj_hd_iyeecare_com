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
use app\common\models\Member;
use business\common\services\SettingService;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletes;

class ManagerList extends BaseModel
{
    use SoftDeletes;

    public $table = 'yz_business_manager_list';
    public $timestamps = true;
    protected $guarded = [];
    protected $appends = [];
    protected $casts = [];

    public function business($business_id = 0)
    {
        $business_id = $business_id ?: SettingService::getBusinessId();
        return self::uniacid()->where('business_id', $business_id);
    }

    public function hasOneMember()
    {
        return $this->hasOne(Member::class, 'uid', 'uid');
    }

    public function hasOneStaff()
    {
        return $this->hasOne(Staff::class, 'uid', 'uid');
    }

    public function hasOneBusiness()
    {
        return $this->hasOne(Business::class, 'id', 'business_id');
    }

}