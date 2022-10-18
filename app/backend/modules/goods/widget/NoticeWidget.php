<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/9/14
 * Time: 17:42
 */

namespace app\backend\modules\goods\widget;

use app\backend\modules\goods\models\Notice;
use app\common\models\Member;

//消息通知
class NoticeWidget  extends BaseGoodsWidget
{
    public $group = 'tool';

    public $widget_key = 'notice';

    public $code = 'notification';

    public function pluginFileName()
    {
        return 'goods';
    }

    public function getData()
    {

        $notices = Notice::getList($this->goods->id);
        if (!$notices->isEmpty()) {
            foreach ($notices as $notice) {
                $noticetype[] = $notice['type'];
                $uid = $notice['uid'];
            }
            $member = Member::select('uid', 'nickname', 'realname', 'mobile', 'avatar')
                ->where('uid', $uid)
                ->first();
        } else {
            $noticetype = [];
            $member = [];
        }
        return [
            'member'=> $member,
            'notice_type'=>$noticetype,
        ];
    }


    public function pagePath()
    {
        return $this->getPath('resources/views/goods/assets/js/components/');
    }
}