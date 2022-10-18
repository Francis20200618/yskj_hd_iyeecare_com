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

use business\common\services\BusinessService;
use business\common\controllers\components\BaseController;
use business\common\models\Business as BusinessModel;
use business\common\services\SettingService;

class SettingController extends BaseController
{


    /*
     * 清除用户缓存
     */
    public function cleanMemberCache()
    {
        BusinessService::flush(0, \YunShop::app()->getMemberId());
        return $this->successJson('清除会员缓存成功');
    }

    /*
    * 清除企业缓存
    */
    public function cleanBusinessCache()
    {
        BusinessService::flush(SettingService::getBusinessId(), 0);
        return $this->successJson('清除企业缓存成功');
    }


    /*
     * 企业概况
     */
    public function getBusinessSurvey()
    {
        $business = BusinessModel::with(['hasOneMember' => function ($query) {
            $query->select('nickname', 'realname', 'avatar', 'mobile', 'uid');
        }])->find(SettingService::getBusinessId());
        return $this->successJson('成功', [
            'id' => $business->id,
            'name' => $business->name ?: '',
            'logo_img' => yz_tomedia($business->logo_img),
            'member' => $business->hasOneMember
        ]);
    }


    /*
     * 获取侧边栏
     */
    public function getBusinessTab()
    {
        $res = BusinessService::checkBusinessRight();
        return $this->successJson('成功', $res['page']);
    }


    /*
     * 企业微信设置
     */
    public function businessQyWxSetting()
    {
        $request = \request();
        $msg = '获取设置成功';
        if (isset($request->corpid)) {  //如果是编辑
            if (!SettingService::setQyWxSetting($request)) {
                return $this->errorJson('设置失败');
            }
            $msg = '编辑设置成功';
        }

        $setting = SettingService::getQyWxSetting();
        return $this->successJson($msg, $setting);

    }


    /*
    * 编辑企业
    */
    public function editBussiness()
    {

        $request = \request();

        $business_id = intval($request->id) ?: SettingService::getBusinessId();

        if (!$business = BusinessModel::uniacid()->find($business_id)) {
            return $this->errorJson('企业不存在');
        }

        if (!isset($request->logo_img) && !isset($request->name)) { //如果是请求页面数据
            return $this->successJson('获取成功', $business);
        }

        $member_right = BusinessService::checkBusinessRight($business->id);
        if ($member_right['identity'] < 2) {
            return $this->errorJson('无权修改企业名');
        }

        if (empty($request->logo_img) || empty($request->name)) {
            return $this->errorJson('请设置企业名与logo');
        }

        $business->logo_img = trim($request->logo_img);

        if (BusinessService::checkBusinessAuth($request->id)) {
            if (trim($request->name) != $business->name) {
                return $this->errorJson('已认证的企业不允许修改名称');
            }
        } else {
            $business->name = trim($request->name);
        }

        $business->save();
        return $this->successJson('修改成功');

    }

}
