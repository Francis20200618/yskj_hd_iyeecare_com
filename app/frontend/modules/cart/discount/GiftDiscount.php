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

class GiftDiscount extends BaseCartGiftDiscount
{
    protected $code = 'gift';
    protected $name = '赠品折扣';


    /**
     * 获取金额
     * @return float|int
     * @throws \app\common\exceptions\AppException
     */
    protected function _getAmount()
    {
        return $this->getShopGoodsPrice();
    }

    /**
     * 店铺中同商品的价格总和
     * @return float
     */
    protected function getShopGoodsPrice()
    {
        return $this->cartGiftGoods->shop->giftCarts->where('goods_id', $this->cartGiftGoods->goods_id)->sum(function (CartGiftGoods $preCartGiftGoods) {
            return $preCartGiftGoods->getPriceBefore($this->getCode());
        });
    }
}