<?php
/**
 * Created by PhpStorm.
 * User: shenyang
 * Date: 2018/11/26
 * Time: 3:54 PM
 */

namespace app\common\modules\orderGoods\models;


use app\frontend\modules\orderGoods\discount\GiftEnoughReduce;
use app\frontend\modules\orderGoods\discount\GiftPlusReduce;
use app\frontend\modules\orderGoods\discount\GiftReduce;
use app\frontend\modules\orderGoods\price\option\NormalOrderGiftGoodsOptionPrice;
use app\frontend\modules\orderGoods\price\option\NormalOrderGiftGoodsPrice;
use Yunshop\Marketing\models\Marketing;

/**
 * Class PreOrderGoods
 * @package app\frontend\modules\orderGoods\models
 */
class PreOrderGiftGoods  extends PreOrderGoods
{
    protected $appends = ['pre_id', 'points', 'is_gift','gift_price', 'gift_type', 'goods_thumb', 'goods_title','marketings'];

    /**
     * 设置价格计算者
     */
    public function _getPriceCalculator()
    {
        if ($this->isOption()) {
            $priceCalculator = new NormalOrderGiftGoodsOptionPrice($this);

        } else {
            $priceCalculator = new NormalOrderGiftGoodsPrice($this);
        }
        return $priceCalculator;
    }

    public function getDiscounts()
    {
        //blank not discount
        $discounts = collect();
        $goods_discounts = [];
        //插入赠品折扣器
        if ($this->memberCart->marketingService->giftType() == Marketing::GIFT_TYPE_GOODS) {
            array_unshift($goods_discounts, [
                'weight' => 1999,
                'class' => function (\app\common\modules\orderGoods\models\PreOrderGoods $preOrderGoods) {
                    return new GiftReduce($preOrderGoods);
                },
            ]);
        } elseif ($this->memberCart->marketingService->giftType() == Marketing::GIFT_TYPE_PLUS_GOODS) {
            array_unshift($goods_discounts, [
                'weight' => 1999,
                'class' => function (\app\common\modules\orderGoods\models\PreOrderGoods $preOrderGoods) {
                    return new GiftPlusReduce($preOrderGoods);
                },
            ]);
        }
        foreach ($goods_discounts as $configItem) {
            $discount = call_user_func($configItem['class'], $this);
            $discount->setWeight($configItem['weight']);
            $discounts->push($discount);
        }
        return $discounts;
    }

//    public function touchPreAttributes(){
//        parent::touchPreAttributes();
//        $this->goods_thumb = $this->thumb;
//        $this->goods_title = $this->title;
//    }

    public function getGoodsThumbAttribute(){
        return $this->thumb;
    }
    public function getGoodsTitleAttribute(){
        return $this->title;
    }

}