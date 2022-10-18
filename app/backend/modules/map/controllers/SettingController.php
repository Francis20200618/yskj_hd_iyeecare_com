<?php
/****************************************************************
 * Author:  king -- LiBaoJia
 * Date:    2020/2/24 10:16 AM
 * Email:   livsyitian@163.com
 * QQ:      995265288
 * IDE:     PhpStorm
 * User:    芸众商城 www.yunzshop.com
 ****************************************************************/


namespace app\backend\modules\map\controllers;


use app\common\components\BaseController;
use app\common\facades\Setting;
use Illuminate\Support\Facades\DB;

class SettingController extends BaseController
{
    public function index()
    {
        if ($this->postData()) {
            return $this->store();
        }

        return view('map.setting', $this->viewData());
    }

    /**
     * 数据存储
     */
    private function store()
    {
        Setting::set("map.a_map", $this->postData());
        Setting::set('map.a_map.synchronize_store', 1);
        return $this->successJson('地图设置成功');
    }

    /**
     * 提交数据
     *
     * @return array
     */
    private function postData()
    {
        $request = request()->input('a_map', []);

        return $request;
    }

    /**
     * view 数据
     *
     * @return array
     */
    private function viewData()
    {
        $map = Setting::get('map.a_map');

        //兼容同步门店配送规则
        if (!$map['web'] && !$map['synchronize_store']) {
            Setting::set('map.a_map.synchronize_store', 1);
            $map['synchronize_store'] = 1;
        }
        return ['map' => $map];
    }

    public function synchronize()
    {
        if (!app('plugins')->isEnabled('store-delivery')) {
            return $this->errorJson('请先开启门店配送插件');
        }

        if (Setting::get('map.a_map.synchronize_store') == 1) {
            return $this->errorJson('同步失败，已经同步过数据或者修改过地图KEY');
        }

        $mapKey = Setting::get('map.a_map.web');
        if (!$mapKey) {
            return $this->errorJson('同步失败，地图KEY没有设置');
        }

        Setting::set('map.a_map.synchronize_store', 1);

        //更新门店地图key
        $uniacid = \Yunshop::app()->uniacid;
        $list = DB::table('yz_store_geo_fence')
            ->select('yz_store_geo_fence.*')
            ->leftJoin('yz_store', 'yz_store_geo_fence.store_id', '=', 'yz_store.id')
            ->where('yz_store.uniacid', $uniacid)
            ->get()->toArray();

        foreach ($list as $key => $value) {
            $webKey = Setting::get("store_cashier_{$value['store_id']}.a_map.web_key") ?? '';
            if (!$webKey) {
                Setting::set("store_cashier_{$value['store_id']}.a_map", ['web_key' => $mapKey]);
            }
        }
        return $this->successJson('地图KEY同步成功');
    }
}
