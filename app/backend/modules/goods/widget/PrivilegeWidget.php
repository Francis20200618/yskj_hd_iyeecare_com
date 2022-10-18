<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/9/9
 * Time: 17:39
 */

namespace app\backend\modules\goods\widget;

use app\backend\modules\goods\models\Privilege;
use app\backend\modules\member\models\MemberLevel;
use app\backend\modules\member\models\MemberGroup;

/**
 * 权限(非插件)
 */
class PrivilegeWidget extends BaseGoodsWidget
{
    public $group = 'marketing';

    public $widget_key = 'privilege';

    public $code = 'auth';

    public function pluginFileName()
    {
        return 'goods';
    }


    public function getData()
    {
        $privilege = new Privilege();

        if ($this->goods->id && Privilege::getInfo($this->goods->id)) {
            $privilege = Privilege::getInfo($this->goods->id);
//            $privilege->show_levels = (!empty($privilege->show_levels) || ($privilege->show_levels === 0 || $privilege->show_levels === '0')) ? explode(',', $privilege->show_levels) : '';
//            $privilege->buy_levels = (!empty($privilege->buy_levels) || ($privilege->buy_levels === 0 || $privilege->buy_levels === '0')) ? explode(',', $privilege->buy_levels) : '';
//            $privilege->show_groups = (!empty($privilege->show_groups) || ($privilege->show_groups === 0 || $privilege->show_groups === '0')) ? explode(',', $privilege->show_groups) : '';
//            $privilege->buy_groups = (!empty($privilege->buy_groups) || ($privilege->buy_groups === 0 || $privilege->buy_groups === '0')) ? explode(',', $privilege->buy_groups) : '';
        }
        $levels = MemberLevel::getMemberLevelList();
        $groups = MemberGroup::getMemberGroupList();

        $data = [];

        $data['privilege'] = $privilege?$privilege->toArray():[];  //会员限购
//        dd($data);
        $data['levels'] = $levels; //会员等级
        array_unshift($data['levels'],['id'=>0,'level_name'=>'普通等级']);
        array_unshift($data['levels'],['id'=>'','level_name'=>'全部会员等级']);

        $data['groups'] = $groups; //会员组
        array_unshift($data['groups'],['id'=>0,'group_name'=>'无分组']);
        array_unshift($data['groups'],['id'=>'','group_name'=>'全部会员组']);

        return $data;
    }


    public function pagePath()
    {
        return $this->getPath('resources/views/goods/assets/js/components/');
    }
}