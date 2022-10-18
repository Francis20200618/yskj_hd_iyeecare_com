<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/4/14
 * Time: 15:50
 */

namespace app\frontend\modules\cart\manager;


use app\frontend\modules\cart\models\CartGiftGoods;
use Illuminate\Support\Collection;

class CartGiftGoodsCollection extends Collection
{
    /**
     * 每个购物车商品注入店铺模型
     * @param $shop
     */
    public function setShop($shop) {

        foreach ($this as $goods) {
            $goods->setShop($shop);
        }
    }

    public function cartValidate()
    {
        $this->map(function (CartGiftGoods $goods) {
            return $goods->goodsValidate();
        });
    }

    /**
     * 获取商品总价
     * @return int
     */
    public function getPrice()
    {
        return $this->sum(function (CartGiftGoods $goods) {
            return $goods->getPrice();
        });
    }

    public function setCartDisable($isDisable)
    {
        $this->map(function (CartGiftGoods $goods) use ($isDisable) {
            return $goods->setDisable($isDisable);
        });
    }

    public function getEstimatedPrice()
    {
        return $this->sum(function (CartGiftGoods $goods) {
            return $goods->getEstimatedPrice();
        });
    }

    public function isCheckedCartGoods()
    {
        return $this->contains(function (CartGiftGoods $goods) {
            return $goods->isChecked();
        });
    }

    public function getCartGoodsDiscounts()
    {
        // 将所有订单商品的优惠
         return $this->reduce(function (Collection $result, CartGiftGoods $goods) {
            return $result->merge($goods->getCartGoodsDiscounts());
        },collect());
    }

    public function getCartGoodsExtraCharges()
    {
        return $this->reduce(function (Collection $result, CartGiftGoods $goods) {
            return $result->merge($goods->getCartGoodsExtraCharges());
        },collect());
    }

    public function getCartGoodsDeductions()
    {
        return $this->reduce(function (Collection $result, CartGiftGoods $goods) {
            return $result->merge($goods->getCartGoodsDeductions());
        },collect());
    }
}