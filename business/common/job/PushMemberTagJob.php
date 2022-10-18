<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/9/22
 * Time: 13:37
 */

namespace business\common\job;


use app\common\facades\Setting;
use business\common\services\customers\ShopTagRefreshService;
use business\common\services\DepartmentService;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;


class PushMemberTagJob implements ShouldQueue
{

    use InteractsWithQueue, Queueable, SerializesModels;
    protected $business_id;
    protected $uniacid;
    protected $uids;

    public function __construct($uniacid, $business_id, $uids)
    {
        $this->uniacid = $uniacid;
        $this->business_id = $business_id;
        $this->uids = $uids;
    }


    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        \YunShop::app()->uniacid = $this->uniacid;
        Setting::$uniqueAccountId = $this->uniacid;
        \Log::debug("用户标签推送队列开始_{$this->business_id}", $this->uids);
        (new ShopTagRefreshService($this->business_id))->connectShopTagMemberToWechat($this->uids);
        \Log::debug("用户标签推送队列结束_{$this->business_id}", $this->uids);

    }


}