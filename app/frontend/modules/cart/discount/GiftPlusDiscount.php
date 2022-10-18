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


use app\frontend\modules\cart\models\CartGiftGoods;
use app\frontend\modules\cart\models\CartGoods;

class GiftPlusDiscount extends BaseCartGiftDiscount
{
    protected $code = 'giftPlus';
    protected $name = '加价购折扣';

    /**
     * 获取金额
     * @return float|int
     * @throws \app\common\exceptions\AppException
     */
    protected function _getAmount()
    {

//        $goods_price = $this->cartGiftGoods->shop->giftCarts->where('goods_id', $this->cartGiftGoods->goods_id)->sum(function (CartGoods $preCartGoods) {
//            return $preCartGoods->getGoodsPrice() * $preCartGoods->memberCart->total;
//        });
//        $goods_gift_price = $this->cartGiftGoods->shop->giftCarts->where('goods_id', $this->cartGiftGoods->goods_id)->sum(function (CartGoods $preCartGoods) {
//            return $preCartGoods->getGiftPrice();
//        });
//
//        return $goods_price - $goods_gift_price;
        $maketing = $this->cartGiftGoods->shop->getMarketing();
        $cartGiftGoodsCollection = $this->cartGiftGoods->shop->giftCarts;
        $rule = $maketing['cart_detail']['rule'];
        $gift_total_price = $cartGiftGoodsCollection->sum(function (CartGiftGoods $cartGiftGoods){
            return $cartGiftGoods->getGoodsPrice() * $cartGiftGoods->memberCart->total;
        });
        $used_price = 0;
        $total_gift = $cartGiftGoodsCollection->count();
        foreach($cartGiftGoodsCollection->values() as $key=>$cartGiftGoods){
            $goods_price = $cartGiftGoods->getGoodsPrice() * $cartGiftGoods->memberCart->total;
            if($key < $total_gift-1){
                $gift_price = bcmul($goods_price/$gift_total_price,  $rule['plus'], 2);
                $used_price += floatval($gift_price);
            }else{
                $gift_price = bcsub($rule['plus'], $used_price, 2);
            }
            if ($cartGiftGoods->goods->id == $this->cartGiftGoods->goods->id) {
                return bcsub($goods_price, $gift_price, 2);
            }
        }
        return 0;
    }
}