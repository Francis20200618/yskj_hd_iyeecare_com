<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/9/22
 * Time: 13:37
 */


namespace business\common\services;

use app\common\facades\Setting;
use app\common\services\Session;
use business\common\models\Business;
use business\common\models\PlatLog;

class SettingService
{

    const BUSINESS_PLUGIN_KEY = 'business_plugin_application';

    const PLUGIN_LIST = [
        'group-develop-user' => ['key' => 'GroupDevelopUser', 'name' => '群拓客'],
        'wechat-chat-sidebar' => ['key' => 'WechatChatSidebar', 'name' => '聊天侧边栏'],
        'wechat-customers' => ['key' => 'WechatCustomers', 'name' => '客户管理'],
        'yun-chat' => ['key' => 'YunChat', 'name' => '在线客服'],
        'yun-chat-sub' => ['key' => 'YunChatSub', 'name' => '在线客服客服端'],
        'work-wechat-tag' => ['key' => 'WorkWechatTag', 'name' => '企业微信标签'],
        'customer-increase' => ['key' => 'CustomerIncrease', 'name' => '企业微信好友裂变'],
        'group-reward' => ['key' => 'GroupReward', 'name' => '群拓客活动奖励'],
        'sop-task' => ['key' => 'SopTask', 'name' => 'sop任务'],
        'speechcraft-library' => ['key' => 'SpeechcraftLibrary', 'name' => '话术库'],
        'discount-harvest-fans' => ['key' => 'DiscountHarvestFans', 'name' => '让利涨粉'],
		'shop-pos' => ['key' => 'ShopPos', 'name' => 'pos收银'],
		'customer-radar' => ['key' => 'CustomerRadar', 'name' => '拓客雷达'],
    ];


    public static function needExamine()
    {
        if (Setting::get('plugin.work-wechat-platform.create_business_examine')) {
            return true;
        }
        return false;
    }

    public static function bindBusinessId($business_id = null)
    {
        $bind_crop_id = app('plugins')->isEnabled('work-wechat-platform') ? Setting::get('plugin.work-wechat-platform')['bind_open_crop_id'] : 0;
        if ($business_id !== null) {
            return $bind_crop_id == $business_id && $business_id;
        }
        return $bind_crop_id;
    }

    /*
     * 将插件名从大驼峰转换成-分隔
     */
    public static function changePluginName($name)
    {
        //用正则将所有的大写字母替换成 `_字母`，如 `OrderDetail` 替换成 `_Order_Detail`
        $name = preg_replace('/[A-Z]/', '-\\0', $name); //_Order_Detail 说明：\\0为反向引用
        $name = strtolower($name);
        $name = ltrim($name, '-');
        return $name;
    }

    /*
     * 获取路由和页面菜单
     */
    public static function getMenu($business_id = 0)
    {
        return (new \business\admin\menu\BusinessMenu())->getMenu($business_id);
    }

    /*
     * 判断该企业被后台-企业平台管理插件授权的插件
     */
    public static function getEnablePlugins($business_id = 0)
    {
        if (!$business_id) $business_id = self::getBusinessId();
        $plat_setting = Business::uniacid()->find($business_id);
        return $plat_setting->auth_plugins ? unserialize($plat_setting->auth_plugins) : [];
    }

    /*
     * 判断是否开启了企业微信同步
     */
    public static function EnabledQyWx()
    {
        $setting = self::getQyWxSetting();
        return $setting['open_state'] ? true : false;
    }

    /*
     * 设置管理的企业ID
     */
    public static function setBusinessId($business_id)
    {
        Session::set('business_id', $business_id);
        $plat_log = PlatLog::getPlatLog();
        if ($plat_log->id) { //记录用户最后管理的企业
            $plat_log->final_plat_id = $business_id;
            $plat_log->save();
        }
    }

    /*
     * 获取当前管理的企业ID
     */
    public static function getBusinessId()
    {
        return Session::get('business_id') ?: 0;
    }


    /*
     * 获取企业微信设置
     */
    public static function getQyWxSetting($business_id = 0)
    {
        $business_id = $business_id ?: self::getBusinessId();
        $key = 'business.qy_wx_setting_' . $business_id;
        $setting = Setting::get($key) ?: [];
        $data = [
            'open_state' => $setting['open_state'] ? 1 : 0,
            'corpid' => $setting['corpid'] ?: '',
            'agentid' => $setting['agentid'] ?: '',
            'agent_secret' => $setting['agent_secret'] ?: '',
            'contact_secret' => $setting['contact_secret'] ?: '',
            'contact_token' => $setting['contact_token'] ?: '',
            'contact_aes_key' => $setting['contact_aes_key'] ?: '',
            'customer_secret' => $setting['customer_secret'] ?: '',
            'customer_token' => $setting['customer_token'] ?: '',
            'customer_aes_key' => $setting['customer_aes_key'] ?: '',
            'work_session_secret' => $setting['work_session_secret'] ?: '',
            'work_session_aes_key' => $setting['work_session_aes_key'] ?: '',
            'work_session_aes_key_version' => $setting['work_session_aes_key_version'] ?: '',
            'contact_notice_url' => request()->getSchemeAndHttpHost() . "/business/" . \YunShop::app()->uniacid . "/frontend/qyWxCallback?business_id=" . $business_id,
            'customer_notice_url' => \app\common\helpers\Url::absoluteApi('plugin.work-wechat.wevent.change-ext-contact.receive', ['type' => 5, 'crop_id' => $business_id]),
        ];
        return $data;
    }


    /*
     * 设置企业微信设置
     */
    public static function setQyWxSetting($request_data, $business_id = 0)
    {
        $business_id = $business_id ?: self::getBusinessId();
        $key = 'business.qy_wx_setting_' . $business_id;
        $data = [
            'open_state' => $request_data->open_state ? 1 : 0,
            'corpid' => trim($request_data->corpid) ?: '',
            'agentid' => trim($request_data->agentid) ?: '',
            'agent_secret' => trim($request_data->agent_secret) ?: '',
            'contact_secret' => trim($request_data->contact_secret) ?: '',
            'contact_token' => trim($request_data->contact_token) ?: '',
            'contact_aes_key' => trim($request_data->contact_aes_key) ?: '',
            'customer_secret' => trim($request_data->customer_secret) ?: '',
            'customer_token' => trim($request_data->customer_token) ?: '',
            'customer_aes_key' => trim($request_data->customer_aes_key) ?: '',
            'work_session_secret' => trim($request_data->work_session_secret) ?: '',
            'work_session_aes_key' => trim($request_data->work_session_aes_key) ?: '',
            'work_session_aes_key_version' => trim($request_data->work_session_aes_key_version) ?: '',
        ];
        return Setting::set($key, $data);
    }


}