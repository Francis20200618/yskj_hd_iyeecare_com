<?php
/**
 * Created by PhpStorm.
 * Author: 芸众商城 www.yunzshop.com
 * Date: 2017/2/28
 * Time: 下午1:44
 */

namespace app\frontend\modules\orderGoods\models;

use app\common\modules\orderGoods\models\PreOrderGiftGoods;
use app\common\modules\orderGoods\models\PreOrderGoods;
use app\common\modules\orderGoods\OrderGoodsCollection;

class PreOrderGoodsCollection extends OrderGoodsCollection
{
    /**
     * 过滤掉赠品
     * @return PreOrderGoodsCollection
     */
    public function exceptGift()
    {
        return $this->filter(function (PreOrderGoods $preOrderGoods) {
            return !$preOrderGoods instanceof PreOrderGiftGoods;
        });
    }

    /**
     * 只要赠品
     * @return PreOrderGoodsCollection
     */
    public function onlyGift()
    {
        return $this->filter(function (PreOrderGoods $preOrderGoods) {
            return $preOrderGoods instanceof PreOrderGiftGoods;
        });
    }
}