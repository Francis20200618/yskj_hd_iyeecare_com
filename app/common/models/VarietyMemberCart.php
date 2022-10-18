<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/11/23
 * Time: 16:59
 */
namespace app\common\models;
use Illuminate\Database\Eloquent\Model;

/**
 * @description 会员购物车关联表(多态性)
 */
class VarietyMemberCart extends Model
{
    protected $table = 'yz_variety_member_cart';
    protected $guarded = [];

    const POSTAGE_INCLUDED = 'PostageIncludedCategory';  // 包邮分类


    /**
     * @description 获得拥有此购物车的模型
     * @return \Illuminate\Database\Eloquent\Relations\MorphTo
     */
    public function memberCartType()
    {
        return $this->morphTo();
    }

}
