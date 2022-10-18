<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/7/16
 * Time: 14:50
 */

namespace app\frontend\modules\order\discount;

use app\common\modules\orderGoods\models\PreOrderGoods;

class MemberLevel extends BaseDiscount
{
    protected $code = 'memberLevel';
    protected $name = '会员等级优惠';


    /**
     * 订单中订单商品会员等级的总金额
     * @return float
     */
    protected function _getAmount()
    {
        //赠品没有会员价
        $result = $this->order->orderGoods->exceptGift()->sum(function (PreOrderGoods $preOrderGoods) {
            return $preOrderGoods->getVipDiscountAmount();

        });

        return $result;
    }

    /**
     * @return mixed
     */
    public function getName()
    {
        $name = $this->name;
        $this->order->orderGoods->exceptGift()->each(function (PreOrderGoods $preOrderGoods) use (&$name){

            // 如果是一卡通, 那边优惠的集合名称就是消费券优惠
            if ($preOrderGoods->getVipDiscountLog('code') == 'store_privilege') {
                $name = $preOrderGoods->getVipDiscountLog('name');
                return false;
            }

            return true;
        });

        return $name;
    }

    public function preSave()
    {
        return false;
    }

}