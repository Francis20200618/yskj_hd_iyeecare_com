<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/2/18
 * Time: 9:41
 */

namespace app\backend\modules\finance\controllers;

use app\common\components\BaseController;
use app\common\facades\Setting;

class BalanceRechargeSetController extends BaseController
{
    public function index()
    {
        $data = [
            'set' => Setting::get('finance.balance_recharge_set') ? : $this->defaultSet()
        ];
        return view('finance.balance.recharge_set',$data)->render();
    }

    private function defaultSet()
    {
        return [
            'appoint_pay' => 0,
            'wechat' => 1,
            'wechat_limit' => '',
            'alipay' => 1,
            'pay_wechat_hj' => 1,
            'pay_alipay_hj' => 1,
            'pay_alipay_hj_limit' => '',
            'converge_quick_pay' => 1,
            'converge_quick_pay_limit' => '',
        ];
    }

    public function store()
    {
        $set = request()->set;
        $res = Setting::set('finance.balance_recharge_set',$set);
        if (!$res) {
            return $this->errorJson('保存失败');
        }
        return $this->successJson('保存成功');
    }
}