<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/9/9
 * Time: 17:49
 */

namespace app\backend\modules\goods\widget;


use app\backend\modules\goods\models\Discount;
use app\backend\modules\member\models\MemberLevel;
use app\backend\modules\member\models\MemberGroup;

//折扣
class DiscountWidget extends BaseGoodsWidget
{
    public $group = 'marketing';

    public $widget_key = 'discount';

    public $code = 'discount';

    public function pluginFileName()
    {
        return 'goods';
    }


    public function getData()
    {
        $level_discount_type = 1;
        $discount_method = 1;
        $discountValue = array();
        if ($this->goods->id) {
            $discounts =  Discount::getList($this->goods->id);

            if (!$discounts->isEmpty() ) {
                $discount_method = $discounts[0]->discount_method;
            }
            foreach ($discounts as $key => $discount) {
                $discountValue[$discount['level_id']]  =  $discount['discount_value'];
            }

        }

        $levels = MemberLevel::getMemberLevelList();
        $levels = array_merge($this->defaultLevel(),$levels);
//        $groups = MemberGroup::getMemberGroupList();

        $discount_levels = [];
        foreach ($levels as $level) {
            $discount_levels[] = [
                'level_id' => $level['id'],
                'level_name' => $level['level_name'],
                'discount_value' => isset($discountValue[$level['id']])?$discountValue[$level['id']]:'',
            ];
        }

        $result = [
            'level_discount_type' =>$level_discount_type,
            'discount_method' => $discount_method,
//            'discountValue' => $discountValue,
            'levels' => $discount_levels,
//            'discount' =>  isset($discounts)?$discounts->toArray():[],
//            'groups' => $groups
        ];

        return $result;
    }

    private function defaultLevel() {
        return [
            '0'=> [
                'id' => "0",
                'level_name' => \Setting::get('shop.member.level_name') ?: '普通会员'
            ],
        ];
    }

    public function pagePath()
    {
        return  $this->getPath('resources/views/goods/assets/js/components/');
    }
}