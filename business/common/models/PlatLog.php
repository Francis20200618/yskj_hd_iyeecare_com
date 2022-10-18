<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/9/22
 * Time: 13:37
 */


namespace business\common\models;

use app\common\models\BaseModel;
use business\common\services\BusinessService;
use Illuminate\Database\Eloquent\Builder;

class PlatLog extends BaseModel
{
    public $table = 'yz_business_plat_log';
    public $timestamps = true;
    protected $guarded = [];
    protected $appends = [];
    protected $casts = [];


    public function getPlatLogId($uid = 0)
    {
        $res = self::getPlatLog($uid);
        return $res->final_plat_id ?: 0;
    }

    public function getPlatLog($uid = 0)
    {

        if ($uid = $uid ?: \YunShop::app()->getMemberId()) {

            $model = self::where('uid', $uid)->first();

            if ($model && $model->final_plat_id) {
                $res = BusinessService::checkBusinessRight($model->final_plat_id, $uid);
                if (!$res['identity']) {
                    $model->final_plat_id = 0;
                    $model->save();
                }
            }

            if (!$model) {
                $model = self::create([
                    'uniacid' => \YunShop::app()->uniacid,
                    'uid' => $uid,
                    'final_plat_id' => 0
                ]);
            }

        } else {
            $model = (Object)[];
        }

        return $model;
    }

}