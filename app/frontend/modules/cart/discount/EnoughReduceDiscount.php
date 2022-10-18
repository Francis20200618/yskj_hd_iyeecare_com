<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/4/29
 * Time: 14:07
 */

namespace app\frontend\modules\cart\discount;


use app\frontend\modules\cart\models\CartGoods;
use app\frontend\modules\cart\models\ShopCart;
use Yunshop\Marketing\models\Marketing;
use Yunshop\Marketing\service\MarketingEnoughReduceService;
use Yunshop\Marketing\service\ShopCartMarketing;

class EnoughReduceDiscount extends BaseCartDiscount
{
    protected $code = 'enoughReduce';
    protected $name = '全场满减优惠';

    /**
     * @return float|int
     * @throws \app\common\exceptions\AppException
     */
    protected function _getAmount()
    {
        if($this->cartGoods->goods()->plugin_id != 0) {
            return 0;
        }
        $occurredMarketingInfoInOrder = new ShopCartMarketing($this->cartGoods->shop->getMarketingService(), $this->cartGoods->shop->getOccurredMarketingRule());
        if (!$occurredMarketingInfoInOrder->stackable(Marketing::STACKABLE_ACT_ENOUGH_REDUCE)) {
            return 0;
        }
        if( !MarketingEnoughReduceService::inStackableAct(MarketingEnoughReduceService::getCartTypeByGoods($this->cartGoods->goods), Marketing::STACKABLE_ACT_ENOUGH_REDUCE )){
            return 0;
        }
        if ($this->totalGoodsPrice() == 0) {
            return 0;
        }
        return $this->aa();
        // (订单商品成交金额/订单中同种商品总成交金额 ) * 订单单品满减金额
//        return ($this->cartGoods->getPriceBefore($this->getCode()) / $this->getShopGoodsPrice()) * $this->enoughReduce();
    }

    /**
     * 全场满减金额分摊到商品 ，优化原来的分摊算法，使分担加起来等于总分摊金额
     * @return float|int|void
     */
    protected function aa(){
        $cart_group_manager = app()->make('cartGroupManager');
        $cart_group = $cart_group_manager->getGroup();
        $total_goods_price = $this->totalGoodsPrice();
        $amount_in_order = $this->enoughReduce();
        $used_money = 0;
        $cart_num = $cart_group->sum(function (ShopCart $shopCart) {
            return $shopCart->carts->filter(function(CartGoods $cartGoods){ return $cartGoods->isChecked();})->count();
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
                $nth ++;
                if($value->goods->plugin_id != 0) {
                    $this_amount = 0;
                }elseif ($nth < $cart_num) {
                    $this_amount = bcmul(($value->getPriceBefore($this->getCode())/$total_goods_price), $amount_in_order, 2);
                    $used_money += $this_amount;
                }else{
                    $this_amount = bcsub($amount_in_order, $used_money, 2);
                }
                if ($this->cartGoods->goods->id == $value->goods->id) {
                    return $this_amount;
                }
            }
        }
        return 0;
    }

    /**
     * @return int|mixed
     * @throws \app\common\exceptions\AppException
     */
    protected function enoughReduce()
    {
        $shopDiscountAmount =  $this->cartGoods->getShop()->getDiscountAmount($this->totalGoodsPrice());

        return $shopDiscountAmount;
        //return $this->cartGoods->shop->getDiscount()->getAmountByCode($this->code)->getAmount();
    }

    /**
     * 商品总金额
     * @return mixed
     * @throws \Illuminate\Contracts\Container\BindingResolutionException
     */
    private function totalGoodsPrice()
    {
        $cart_group_manager = app()->make('cartGroupManager');
        $cart_group = $cart_group_manager->getGroup();
        return $cart_group->sum(function (ShopCart $shopCart){
            return $shopCart->carts->sum(function (CartGoods $preCartGoods) {
                if ($preCartGoods->isChecked() && $preCartGoods->goods()->plugin_id == 0) {
                    return $preCartGoods->getPriceBefore($this->getCode());
                }
                return 0;
            });
        });
    }
}