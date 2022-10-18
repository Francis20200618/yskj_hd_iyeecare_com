<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/1/7
 * Time: 11:54
 */

namespace app\frontend\modules\wechat\controllers;


use app\common\components\BaseController;
use app\frontend\modules\wechat\services\MediaService;

class MediaController extends BaseController
{
    public function getTemporary()
    {
        $media = new MediaService();
        $media->mediaId = request()->media_id;
        $media->plugin = request()->plugin;
        $result = $media->getTemporaryFile();
        if ($result['code']) {
            return $this->errorJson($result['message']);
        }
        return $this->successJson('ok',$result['file']);
    }
}