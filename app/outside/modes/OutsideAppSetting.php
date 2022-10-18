<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/1/6
 * Time: 17:01
 */

namespace app\outside\modes;


use app\common\models\BaseModel;
use app\outside\services\OutsideAppService;

class OutsideAppSetting extends BaseModel
{
    protected $table = 'yz_outside_app_setting';

    protected $guarded = [];

    static protected $needLog = true;

    public $attributes = [];


    protected $casts = [
        'value' => 'json',
    ];

    public static function current()
    {
        return self::uniacid()->first();
    }


    public static function uniqueApp()
    {
        $appId = OutsideAppService::createAppId();
        while (1) {
            if (!self::where('app_id', $appId)->first()) {
                break;
            }
            $appId = OutsideAppService::createAppId();
        }

        return $appId;
    }

    public static function uniqueSecret($appId = '')
    {
        $app_secret = OutsideAppService::createSecret($appId);
        while (1) {
            if (!self::where('app_secret', $app_secret)->first()) {
                break;
            }
            $app_secret = OutsideAppService::createSecret($appId);
        }

        return $app_secret;
    }


}