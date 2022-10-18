<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/11/23
 * Time: 17:07
 */
namespace app\frontend\modules\postageIncludedCategory\models;

use app\common\models\MemberCart as BaseMemberCart;
use app\common\models\VarietyMemberCart;

class CategoryMemberCart extends BaseMemberCart
{
    // 会员购物车关联包邮分类关系
    public function varietiy()
    {
        return $this->hasMany(VarietyMemberCart::class, 'member_cart_id')
            ->where('member_cart_type', VarietyMemberCart::POSTAGE_INCLUDED)
            ->where('uniacid', \YunShop::app()->uniacid)->first();
    }
}