<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/11/24
 * Time: 17:30
 */

namespace app\common\services;


use Illuminate\Support\Facades\Redis;

class RequestTokenService
{
    /**
     * @param $key
     * @param int $time
     * @return string
     */
    public static function getRequestToken($key,$time = 120)
    {
        $key .= \YunShop::app()->uniacid;
        $token = Redis::get($key);
        if ($token) {
            return false;   //这个token还在，返回错误
        }
        $token = self::getRandomStr();
        Redis::setex($key , $time, $token);
        return $token;
    }

    public static function checkRequestToken($key,$token)
    {
        $key .= \YunShop::app()->uniacid;
        $hasToken = Redis::get($key);
        if (!$hasToken || $hasToken != $token) {
            return false;
        }
        return true;
    }

    public static function delRequestToken($key)
    {
        $key .= \YunShop::app()->uniacid;
        Redis::del($key);
    }

    /**
     * 获取$length长度的随机字符串
     * @param int $length
     * @return string
     */
    private static function getRandomStr($length = 32)
    {
        $str = '1234567890abcdefghijklmnopqrstuvwxyz';
        $result = '';
        for ($i=1;$i<=$length;$i++) {
            $result .= substr($str,rand(0,(strlen($str)-1)),1);
        }
        return $result.time();
    }
}