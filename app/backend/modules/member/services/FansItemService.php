<?php

/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/1/5
 * Time: 9:34
 */

namespace app\backend\modules\member\services;

use app\common\facades\Setting;

class FansItemService
{
    public function setFansItem($list)
    {
        foreach ($list['data'] as $key => $item) {
            if (isset($item['has_one_unique'])) {
                $list['data'][$key]['fans_item'] = substr($item['has_one_unique']['unionid'], 0, 4) . '**' . substr($item['has_one_unique']['unionid'], -6);
            }
            if (isset($item['has_one_mini_app'])) {
                $list['data'][$key]['fans_item'] = substr($item['has_one_mini_app']['openid'], 0, 4) . '**' . substr($item['has_one_mini_app']['openid'], -6);
            }
            if (isset($item['has_one_fans'])) {
                $list['data'][$key]['fans_item'] = substr($item['has_one_fans']['openid'], 0, 4) . '**' . substr($item['has_one_fans']['openid'], -6);
            }
            if (!empty($item['mobile'])) {
                $list['data'][$key]['fans_item'] = $item['mobile'];
            }
            if (!empty($item['nickname'])) {
                $list['data'][$key]['fans_item'] = $item['nickname'];
            }
            if (empty($item['avatar']) && !empty(Setting::get('shop.member')['headimg_url'])) {
                $list['data'][$key]['avatar'] = yz_tomedia(Setting::get('shop.member')['headimg_url']);
            }
            if (empty($item['avatar']) && empty(Setting::get('shop.member')['headimg_url'])) {
                $list['data'][$key]['avatar'] = yz_tomedia(Setting::get('shop.shop')['logo']);
            }
        }
        return $list;
    }

    public function setAgentFansItem($list)
    {
        foreach ($list['data'] as $key => $item) {
            if (isset($item['has_one_unique'])) {
                $list['data'][$key]['has_one_child_member']['fans_item'] = substr($item['has_one_unique']['unionid'], 0, 4) . '**' . substr($item['has_one_unique']['unionid'], -6);
            }
            if (isset($item['has_one_mini_app'])) {
                $list['data'][$key]['has_one_child_member']['fans_item'] = substr($item['has_one_mini_app']['openid'], 0, 4) . '**' . substr($item['has_one_mini_app']['openid'], -6);
            }
            if (isset($item['has_one_fans'])) {
                $list['data'][$key]['has_one_child_member']['fans_item'] = substr($item['has_one_fans']['openid'], 0, 4) . '**' . substr($item['has_one_fans']['openid'], -6);
            }
            if (!empty($item['has_one_child_member']['mobile'])) {
                $list['data'][$key]['has_one_child_member']['fans_item'] = $item['has_one_child_member']['mobile'];
            }
            if (!empty($item['has_one_child_member']['nickname'])) {
                $list['data'][$key]['has_one_child_member']['fans_item'] = $item['has_one_child_member']['nickname'];
            }

            if (empty($item['has_one_child_member']['avatar']) && !empty(Setting::get('shop.member')['headimg_url'])) {
                $list['data'][$key]['avatar'] = yz_tomedia(Setting::get('shop.member')['headimg_url']);
            }
            if (empty($item['has_one_child_member']['avatar']) && empty(Setting::get('shop.member')['headimg_url'])) {
                $list['data'][$key]['avatar'] = yz_tomedia(Setting::get('shop.shop')['logo']);
            }
        }
        return $list;
    }

    public function setParentFansItem($list)
    {
        foreach ($list['data'] as $key => $item) {
            if (isset($item['has_one_unique'])) {
                $list['data'][$key]['has_one_member']['fans_item'] = substr($item['has_one_unique']['unionid'], 0, 4) . '**' . substr($item['has_one_unique']['unionid'], -6);
            }
            if (isset($item['has_one_mini_app'])) {
                $list['data'][$key]['has_one_member']['fans_item'] = substr($item['has_one_mini_app']['openid'], 0, 4) . '**' . substr($item['has_one_mini_app']['openid'], -6);
            }
            if (isset($item['has_one_fans'])) {
                $list['data'][$key]['has_one_member']['fans_item'] = substr($item['has_one_fans']['openid'], 0, 4) . '**' . substr($item['has_one_fans']['openid'], -6);
            }
            if (!empty($item['has_one_member']['mobile'])) {
                $list['data'][$key]['has_one_member']['fans_item'] = $item['has_one_member']['mobile'];
            }
            if (!empty($item['has_one_member']['nickname'])) {
                $list['data'][$key]['has_one_member']['fans_item'] = $item['has_one_member']['nickname'];
            }

            if (empty($item['has_one_member']['avatar']) && !empty(Setting::get('shop.member')['headimg_url'])) {
                $list['data'][$key]['avatar'] = yz_tomedia(Setting::get('shop.member')['headimg_url']);
            }
            if (empty($item['has_one_member']['avatar']) && empty(Setting::get('shop.member')['headimg_url'])) {
                $list['data'][$key]['avatar'] = yz_tomedia(Setting::get('shop.shop')['logo']);
            }
        }
        return $list;
    }

}