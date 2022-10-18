<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/9/22
 * Time: 13:37
 */

namespace business\middleware;


use app\common\traits\JsonTrait;
use business\common\services\BusinessService;
use business\common\services\SettingService;
use Closure;

class BusinessLogin
{
    use JsonTrait;

    public function handle($request, Closure $next)
    {
        $uid = \YunShop::app()->getMemberId();

        if (!$business_id = SettingService::getBusinessId()) {
            return $this->errorJson(BusinessService::BUSINESS_LIST_MSG, BusinessService::getBusinessListReturn());
        }

        if (!\business\common\models\Business::uniacid()->where('status', 1)->find($business_id)) {
            return $this->errorJson(BusinessService::BUSINESS_LIST_MSG, BusinessService::getBusinessListReturn());
        }

        $business_auth = BusinessService::checkBusinessRight($business_id, $uid);

        if ($business_auth['identity'] < 1) {
            return $this->errorJson(BusinessService::BUSINESS_LIST_MSG, BusinessService::getBusinessListReturn());
        }

        $all_right = $business_auth['identity'] > 1; //判断是否法人人、创始人、管理员
        if (!$this->checkRoute($business_auth['route'], $all_right)) {
            return $this->errorJson('Sorry,您没有操作权限');
        }

        return $next($request);
    }


    public function checkRoute($route_arr = [], $all_right = false)
    {
        $route = request()->path();
        $route = explode('/', $route);
        $true_route = '';

        $module = $route[2];

        if ($module == 'plugin') {
            $module = $route[3];
            foreach ($route as $k => $v) {
                if (in_array($k, [0, 1, 2])) continue;
                if ($v === null || $v === '' || $v === false) continue;
                $true_route .= '/' . $v;
            }
        } else {
            foreach ($route as $k => $v) {
                if (in_array($k, [0, 1, 2])) continue;
                if ($v === null || $v === '' || $v === false) continue;
                $true_route .= '/' . $v;
            }
        }

        if (substr($true_route, 0, 1) == '/') $true_route = substr($true_route, 1);;

        if (!$route_arr[$module]) {
            return false;
        }

        foreach ($route_arr[$module] as $v) {
            if ($v['route'] == $true_route && ($v['can'] || $all_right)) {
                return true;
            }
        }

        return false;

    }


}