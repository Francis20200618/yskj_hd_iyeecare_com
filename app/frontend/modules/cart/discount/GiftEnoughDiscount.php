<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/4/29
 * Time: 13:58
 */

namespace app\frontend\modules\cart\discount;


use app\frontend\modules\cart\models\CartGoods;
use app\frontend\modules\cart\models\ShopCart;
use Yunshop\Marketing\service\MarketingEnoughReduceService;

class GiftEnoughDiscount extends BaseCartDiscount
{
    protected $code = 'giftEnoughReduce';
    protected $name = '满额减';

    /**
     * 获取金额
     * @return float|int
     * @throws \app\common\exceptions\AppException
     */
    protected function _getAmount()
    {
        $first_discount_marketing = MarketingEnoughReduceService::getFirstDiscountMarketing($this->getCartType());
        if(!$first_discount_marketing){
            return 0;
        }
        if (!$this->cartGoods->isChecked()) {
            return 0;
        }
        $rules = MarketingEnoughReduceService::getOccurredMarketingRule($this->getCartType());
        if (empty($rules)) {
            return 0;
        }
        $total_goods_price = $this->getTotalGoodsPrice();
        if (empty($total_goods_price)) {
            return 0;
        }
        $used_money = 0;
        $cart_group = MarketingEnoughReduceService::getCartList();
        $cart_num = $cart_group->sum(function (ShopCart $shopCart) use($first_discount_marketing){
            return $shopCart->carts->filter(function(CartGoods $preCartGoods) use($first_discount_marketing){
                $marketing = MarketingEnoughReduceService::getFirstOccurredDiscountMarketing($preCartGoods->goods);
                if ($marketing->id == $first_discount_marketing->id) {
                    return $preCartGoods->isChecked();
                }
                return false;
            })->count();
        });
        $nth = 0;
        foreach ($cart_group as $shopCart) {
            /**
             * @var ShopCart $shopCart
             */
            foreach($shopCart->carts as $key => $value){
                if (!$value->isChecked()) {
                    continue;
                }
                $marketing = MarketingEnoughReduceService::getFirstOccurredDiscountMarketing($value->goods);
                if ($marketing->id != $first_discount_marketing->id) {
                    continue;
                }
                $nth ++;
                if ($nth < $cart_num) {
                    $goods_scale = $value->getGoodsPrice() * $value->total / $total_goods_price;
                    $this_reduce_price = bcmul($goods_scale, $rules['discount'], 2);
                    $used_money += $this_reduce_price;
                }else{
                    $this_reduce_price = bcsub($rules['discount'], $used_money, 2);
                }
                if ($this->cartGoods->goods_id == $value->goods_id && $this->cartGoods->memberCart->option_id == $value->memberCart->option_id ) {
                    return $this_reduce_price;
                }
            }
        }
        //又可用当前商品属于不在活动中的商品拼
        return 0;
    }

    /**
     * 获得活动商品的总价格
     * @param $overseas
     * @return int
     */
    private function getTotalGoodsPrice(){
        $first_discount_marketing = MarketingEnoughReduceService::getFirstDiscountMarketing($this->getCartType());
        if(!$first_discount_marketing){
            return 0;
        }
        $cart_group = MarketingEnoughReduceService::getCartList();
        return $cart_group->sum(function (ShopCart $shopCart) use($first_discount_marketing){
            return $shopCart->carts->sum(function (CartGoods $preCartGoods) use($first_discount_marketing) {
                if ($preCartGoods->isChecked()) {
                    $marketing = MarketingEnoughReduceService::getFirstOccurredDiscountMarketing($preCartGoods->goods);
                    if ($marketing->id == $first_discount_marketing->id) {
                        return $preCartGoods->getPriceBefore($this->getCode());
                    }
                }
                return 0;
            });
        });
    }

    /**
     * @return int
     */
    private function getCartType()
    {
        if($this->cartGoods->shop->getCode() == 'jd-supply'){
            return MarketingEnoughReduceService::CART_TYPE_JD;
        }
        return $this->cartGoods->goods->overseas ? MarketingEnoughReduceService::CART_TYPE_OVERSEAS : MarketingEnoughReduceService::CART_TYPE_YS;
    }
}