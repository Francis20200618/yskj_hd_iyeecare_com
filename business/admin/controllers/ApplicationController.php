<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/9/22
 * Time: 13:37
 */

namespace business\admin\controllers;

use business\common\controllers\components\BaseController;
use business\common\services\BusinessService;
use business\common\services\SettingService;

class ApplicationController extends BaseController
{

    public $type = [
        ['name' => '办公管理', 'key' => 'businessApplicationWork'],
        ['name' => '销售管理', 'key' => 'businessApplicationSales'],
        ['name' => '工具软件', 'key' => 'businessApplicationTool'],
    ];

    public function getApplicationList()
    {

        $plugin_function = \app\common\modules\shop\ShopConfig::current()->get(SettingService::BUSINESS_PLUGIN_KEY) ?: [];
        $type_key = array_column($this->type, 'key');
        $return_data = [];
        $auth = BusinessService::checkBusinessRight();
        foreach ($plugin_function as $v) {
            $class = $v['class'];
            $function = $v['function'];
            if (!method_exists($class, $function)) continue;
            $res = $class::$function();
            if (!$res || !in_array($res['type'], $type_key)) continue;
            if (!$this_page_route = $auth['page_route'][$res['plugin']]) continue;
            foreach ($this_page_route as $vv) {
                if ($vv['route'] == $res['route']) {
                    if ($vv['can'] || $auth['identity'] > 1) {
                        $res['icon'] = file_exists(base_path('static/yunshop/plugins/list-icon/img/' . $res['icon'] . '.png')) ? static_url("yunshop/plugins/list-icon/img/{$res['icon']}.png") : static_url("yunshop/plugins/list-icon/img/default2.png");
                        $res['icon'] = request()->getSchemeAndHttpHost() . $res['icon'];
                        $return_data[$res['type']][] = $res;
                    }
                    break;
                }
            }
        }
        return $this->successJson('成功', ['plugin_list' => $return_data, 'type' => $this->type]);
    }

}
