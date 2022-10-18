<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/1/13
 * Time: 16:45
 */

namespace app\frontend\modules\order\operations\member;

use app\common\models\comment\CommentConfig;
use app\frontend\modules\order\operations\OrderOperation;

class CommentGoods extends OrderOperation
{
    public function getApi()
    {
        return '';
    }

    public function getValue()
    {
        return static::GOODS_COMMENT;
    }

    public function getName()
    {
        return '评价';
    }

    public function enable()
    {
        $is_order_comment_entrance = CommentConfig::getSetConfig('is_order_comment_entrance');
        //未开启设置
        if (!$is_order_comment_entrance) {
            return false;
        }

        

        return true;
//        return $this->order->canRefund();
    }

}