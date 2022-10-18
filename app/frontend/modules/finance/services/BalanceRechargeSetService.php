<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/2/18
 * Time: 11:36
 */

namespace app\frontend\modules\finance\services;


use app\common\facades\Setting;
use app\common\services\PayFactory;

class BalanceRechargeSetService
{
    private $rechargeSet;

    public function __construct()
    {
        $this->rechargeSet = Setting::get('finance.balance_recharge_set') ? : [
            'appoint_pay' => 0  //默认关闭
        ];
    }

    public function getRechargeSet()
    {
        if (!$this->rechargeSet) {
            $this->rechargeSet = Setting::get('finance.balance_recharge_set');
        }
        return $this->rechargeSet;
    }

    /**
     * 指定支付开关
     * @return bool
     */
    public function getAppointPay()
    {
        return $this->getRechargeSet()['appoint_pay'] ? true : false;
    }

    /**
     * 获取可以使用的支付code
     * @return array
     */
    public function getCanUsePayment()
    {
        $code = [];
        if ($this->getRechargeSet()['wechat']) {
            $code = array_merge($code,['wechatPay']);
        }
        if ($this->getRechargeSet()['alipay']) {
            $code = array_merge($code,['alipay']);
        }
        if ($this->getRechargeSet()['pay_wechat_hj']) {
            $code = array_merge($code,['convergePayWechat']);
        }
        if ($this->getRechargeSet()['pay_alipay_hj']) {
            $code = array_merge($code,['convergePayAlipay']);
        }
        if ($this->getRechargeSet()['converge_quick_pay']) {
            $code = array_merge($code,['convergeQuickPay']);
        }
        return $code;
    }

    /**
     * 判断是否符合充值
     * @param $pay_type //支付方式
     * @param $recharge_money //充值金额
     * @return bool|string
     */
    public function verifyRecharge($pay_type,$recharge_money)
    {
        if (!$this->getAppointPay()) {
            return true;
        }
        $errStr = '不支持该支付方式进行充值';
        switch ($pay_type) {
            case  PayFactory::PAY_WEACHAT:
                if (!$this->getRechargeSet()['wechat']) {
                    return $errStr;
                }
                $max = $this->getRechargeSet()['wechat_limit'];
                if (!empty($max) && $recharge_money > $max) {
                    return '已超过微信单笔最大充值金额'.$max.'元';
                }
                break;
            case PayFactory::PAY_APP_ALIPAY:
                if (!$this->getRechargeSet()['alipay']) {
                    return $errStr;
                }
                break;
            case  PayFactory::PAY_WECHAT_HJ:
                if (!$this->getRechargeSet()['pay_wechat_hj']) {
                    return $errStr;
                }
                break;
            case  PayFactory::PAY_ALIPAY_HJ:
                if (!$this->getRechargeSet()['pay_alipay_hj']) {
                    return $errStr;
                }
                $max = $this->getRechargeSet()['pay_alipay_hj_limit'];
                if (!empty($max) && $recharge_money > $max) {
                    return '已超过汇聚支付宝单笔最大充值金额'.$max.'元';
                }
                break;
            case  PayFactory::CONVERGE_QUICK_PAY:
                if (!$this->getRechargeSet()['converge_quick_pay']) {
                    return $errStr;
                }
                $max = $this->getRechargeSet()['converge_quick_pay_limit'];
                if (!empty($max) && $recharge_money > $max) {
                    return '已超过汇聚快捷支付单笔最大充值金额'.$max.'元';
                }
                break;
            default:
                return $errStr;
        }
        return true;
    }

}