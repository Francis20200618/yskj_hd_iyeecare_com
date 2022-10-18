<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/10/28
 * Time: 18:01
 */

namespace app\frontend\modules\goods\services;

class TradeGoodsPointsServer
{
    const SEARCH_PAGE = 'search_page';  //商品搜索页/分类页
    const GOODS_PAGE = 'goods_page';    //商品详情页
    const SINGLE_PAGE = 'single_page';  //下单页
    const ORDER_PAGE = 'order_page';    //订单详情页

    protected $pointSet;
    protected $pointValueSet;
    protected $goodsModel;

    public function __construct()
    {
        $this->pointSet = \Setting::get('point.set');
    }

    /**
     * @description 得到积分设置
     * @param $goods
     */
    public function getPointSet($goods)
    {
        $this->goodsModel = $goods;
        //获取商城设置: 判断 积分、余额 是否有自定义名称
        $goodsDetail = app('GoodsDetail');
        $goodsDetail->setDetailInstance($this->goodsModel);
        $this->pointValueSet = [];
		$this->pointValueSet = $goodsDetail->make('GoodsDetailInstance')->getPointSet() ?: [];

    }

    /*
     * 设置单例商品模型
     */
    public function setSingletonGoodsModel($goodsModel)
    {
        app()->singleton(self::class, function () use ($goodsModel) {
            $this->getPointSet($goodsModel);
            return $this;
        });
    }

    /**
     * @description 查看积分设置是否开启
     * @param $on
     * @return bool
     */
    public function close($on)
    {
        return !$this->pointSet['goods_point'][$on];
    }

    /**
     * @description 得到最高优先级积分比例或者固定值
     * @param string $points
     * @return int|mixed|string
     */
    public function finalSetPoint($points = '')
    {
        if ((strlen($this->goodsModel->hasOneSale->point) === 0) || $this->goodsModel->hasOneSale->point != 0) {
            if ($this->goodsModel->hasOneSale->point) {
                $points = $this->goodsModel->hasOneSale->point;
            } elseif (!empty($this->pointValueSet['value']['set']['give_point']) && $this->pointValueSet['value']['set']['give_point'] != 0) {
                $points = $this->pointValueSet['value']['set']['give_point'] . '%';
            } else {
                $points = $this->pointSet['give_point'] ?: 0;
            }

            if ($points == 0) {
                $points = '';
            }
        }

        return $points;
    }

    /**
     * @description 计算后的积分
     * @param $points
     * @param $price
     * @param $cost_price
     * @return mixed|string
     */
    public function getPoint($points, $price, $cost_price)
    {
        // 区分类型: 如果是变量包含百分比.那么需要计算积分
        if (strstr($points, '%') && $this->pointSet['data_display_type']) {

            // 去除百分比符号
            $points = str_replace('%', '', $points);

            // give_type = 1 要计算利润再算积分
            if ($this->pointSet['give_type']) {
                $price = bcsub($price, $cost_price, 2);
            }

            // 百分比
            $percentage = bcdiv($points, 100, 2);

            // 积分
            $points = bcmul($price, $percentage, 2);

            $points = ($points <= 0) ? '' : $points;

        }

        return ($points <= 0) ? '' : $points;
    }

}