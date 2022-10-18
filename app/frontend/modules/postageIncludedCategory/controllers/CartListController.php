<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/11/24
 * Time: 12:26
 */
namespace app\frontend\modules\postageIncludedCategory\controllers;

use app\common\facades\Setting;
use app\frontend\modules\cart\controllers\ListController;


class CartListController extends ListController
{
    public function index()
    {
        $content = parent::index();
        $data = $content->getData();
        if ($data->result && Setting::get('enoughReduce.freeFreight.open')) {
            $enough = Setting::get('enoughReduce.freeFreight.enough') ?: 0;
            $data->data->postage_included_msg = '';
            if ($data->data->total_amount < $enough) {
                $difference = bcsub($enough, $data->data->total_amount, 2);
                $data->data->postage_included_msg = $difference;
            }
            $content->setData($data);

        } else {
            $data->result = 0;
            $data->msg = '请确认订单满额包邮是否开启.';
            $data->data = '';
            $content->setData($data);
        }

        return $content;
    }
}