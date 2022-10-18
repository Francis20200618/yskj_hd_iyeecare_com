<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/9/9
 * Time: 17:39
 */

namespace app\backend\modules\goods\widget;

use app\backend\modules\goods\models\Share;
use app\common\helpers\ImageHelper;

/**
 * 分享关注(非插件)
 */
class ShareWidget extends BaseGoodsWidget
{
    public $group = 'marketing';

    public $widget_key = 'share';

    public $code = 'share';

    public function pluginFileName()
    {
        return 'goods';
    }


    public function getData()
    {
        $share = new Share();
        if ($this->goods->id && Share::getInfo($this->goods->id)) {
            $share = Share::getInfo($this->goods->id);
        }

        $data = [];

        if ($share) {
            $data = $share->toArray();
            $data['share_thumb'] = yz_tomedia($data['share_thumb']);
        }
        
        return $data;
    }


    public function pagePath()
    {
        return $this->getPath('resources/views/goods/assets/js/components/');
    }
}