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
use business\common\services\SettingService;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletes;

class Department extends BaseModel
{

    public $table = 'yz_business_department';
    public $timestamps = true;
    protected $guarded = [];
    protected $appends = [];
    protected $casts = [];

    use SoftDeletes;

    public function business($business_id = 0)
    {
        $business_id = $business_id ?: SettingService::getBusinessId();
        return self::uniacid()->where('business_id', $business_id);
    }

    /*
     * 获取当前部门的所有上级部门ID
     */
    public function getAllDepartmentParentId($department_id_arr, $department_list = [], $business_id = 0)
    {
        $business_id = $business_id ?: SettingService::getBusinessId();
        $department_list = $department_list ?: self::where('business_id', $business_id)->get();
        $this_parent_id_arr = $department_list->whereIn('id', $department_id_arr)->pluck('parent_id')->toArray();
        $parent_id_arr = $this_parent_id_arr = array_values(array_unique(array_filter($this_parent_id_arr)));

        if (!$parent_id_arr) {
            return [];
        }

        do {
            $this_parent_id_arr = $department_list->whereIn('id', $this_parent_id_arr)->pluck('parent_id')->toArray();
            $this_parent_id_arr = array_values(array_unique(array_filter($this_parent_id_arr)));
            $parent_id_arr = array_merge($parent_id_arr, $this_parent_id_arr);
        } while ($this_parent_id_arr);

        return array_values(array_unique(array_filter($parent_id_arr)));
    }


    /*
     * 获取当前部门的所有下级部门ID
     */
    public function getAllDepartmentSubId($department_id_arr, $department_list = [], $business_id = 0)
    {
        $business_id = $business_id ?: SettingService::getBusinessId();
        $department_list = $department_list ?: self::where('business_id', $business_id)->get();
        $this_sub_id_arr = $department_list->whereIn('parent_id', $department_id_arr)->pluck('id')->toArray();
        $sub_id_arr = $this_sub_id_arr = array_values(array_unique(array_filter($this_sub_id_arr)));

        if (!$sub_id_arr) {
            return [];
        }

        do {
            if ($this_sub_id_arr = $department_list->whereIn('parent_id', $this_sub_id_arr)->pluck('id')->toArray()) {
                $sub_id_arr = array_merge($sub_id_arr, $this_sub_id_arr);
            }
        } while ($this_sub_id_arr);

        return array_values(array_unique(array_filter($sub_id_arr)));
    }

    public function getWechatBusinessDepartment($business_id)
    {
        return self::where('business_id', $business_id)->where('wechat_department_id', '<>', 0)->get();
    }

    public function hasOneParentDepartment()
    {
        return $this->hasOne(self::class, 'id', 'parent_id');
    }

    public function hasManySubDepartment()
    {
        return $this->hasMany(self::class, 'parent_id', 'id');
    }
    
    public function hasMayDepartmentStaff()
    {
	    return $this->hasMany(DepartmentStaff::class, 'department_id', 'id');
    }

}