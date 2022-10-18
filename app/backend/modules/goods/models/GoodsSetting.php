<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/12/28
 * Time: 13:48
 */
namespace app\backend\modules\goods\models;

class GoodsSetting extends \app\common\models\GoodsSetting
{
    public static function saveSet($data)
    {
        return static::Create(self::getData($data));
    }

    public static function getData($data)
    {
        return [
            'uniacid' => \YunShop::app()->uniacid,
            'is_month_sales' => $data['is_month_sales'],
            'is_member_enter' => $data['is_member_enter'],
            'is_show_stock' => $data['is_show_stock'],
            'is_price_desc' => $data['is_price_desc'],
            'title' => empty($data['title']) ? '' : $data['title'],
            'explain' => empty($data['explain']) ? '' : $data['explain'],
            'detail_show'	=> $data['detail_show']
        ];
    }
}