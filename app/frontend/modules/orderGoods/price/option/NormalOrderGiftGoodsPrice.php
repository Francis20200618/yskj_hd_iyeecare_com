<?php

namespace app\frontend\modules\orderGoods\price\option;


use app\common\exceptions\AppException;
use Yunshop\Marketing\models\Marketing;

/**
 * Created by PhpStorm.
 * User: shenyang
 * Date: 2017/5/19
 * Time: 下午6:04
 */
class NormalOrderGiftGoodsPrice extends NormalOrderGoodsPrice
{

    public function getGiftPrice(){
        // 1 如果是加价购，返回分摊价格
        // 2 如果是赠品， 返回0
        if($this->orderGoods->memberCart->marketingService->giftType() == Marketing::GIFT_TYPE_GOODS){
            return 0;
        }else if($this->orderGoods->memberCart->marketingService->giftType() == Marketing::GIFT_TYPE_PLUS_GOODS){

            return $this->orderGoods->getGiftPrice();
        }else{
            throw new AppException('加价购活动下单异常2');
        }
    }



}