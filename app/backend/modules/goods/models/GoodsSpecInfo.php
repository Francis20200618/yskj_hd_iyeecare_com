<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/12/14
 * Time: 10:12
 */

namespace app\backend\modules\goods\models;


class GoodsSpecInfo extends \app\common\models\goods\GoodsSpecInfo
{
    public static function relationSave($goodsId, $data, $operate = '')
    {
        $data = $data['spec_info'];
        if (!$goodsId) {
            return false;
        }
        static::where('goods_id',$goodsId)->delete();
        if (!$data || $operate == 'deleted') {
            return false;
        }
        $goods = \app\common\models\Goods::select('has_option')->where('id',$goodsId)->first();
        if (!$goods) {
            return true;
        }
        $insert = [];
        foreach ($data as $item) {
            $insert[] = [
                'uniacid' => \YunShop::app()->uniacid,
                'goods_id' => $goodsId,
                'goods_option_id' => $goods->has_option?($item['goods_option_id'] ? : 0):0,
                'info_img' => $item['info_img'] ? : '',
                'sort' => $item['sort'] ? : 0,
                'content' => json_encode($item['content']),
                'created_at' => time(),
                'updated_at' => time(),
            ];
        }
        if ($insert) {
            static::insert($insert);
        }
        return true;
    }
}