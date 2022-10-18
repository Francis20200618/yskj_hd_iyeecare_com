<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/9/14
 * Time: 10:13
 */

namespace app\backend\modules\goods\widget;


class DescribeWidget  extends BaseGoodsWidget
{
    public $group = 'base';

    public $widget_key = 'goods';

    public $code = 'content';

    public function pluginFileName()
    {
        return 'goods';
    }

    public function getData()
    {
        //商品属性默认值

        if (is_null($this->goods)) {
            return $data['content'] = '';
        }

        if ($this->goods->content) {
            $data['content'] =  changeUmImgPath($this->goods->content);
        }

        return $data;
    }


    public function pagePath()
    {
        return  $this->getPath('resources/views/goods/assets/js/components/');
    }
}