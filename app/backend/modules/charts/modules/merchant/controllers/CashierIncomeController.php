<?php
/**
 * Created by PhpStorm.
 * User: yunzhong
 * Date: 2018/10/15
 * Time: 14:31
 */

namespace app\backend\modules\charts\modules\merchant\controllers;


use app\common\components\BaseController;
use app\common\services\ExportService;
use Illuminate\Support\Facades\DB;
use Yunshop\StoreCashier\common\models\Store;

class CashierIncomeController extends BaseController
{

    /**
     * @return string
     * @throws \Throwable
     */
    public function index()
    {
        $prefix = app('db')->getTablePrefix();
        $searchTime = [];
        $search = \YunShop::request()->search;
        if ($search['is_time'] && $search['time']) {
            $searchTime[] = strtotime($search['time']['start']);
            $searchTime[] = strtotime($search['time']['end']);
        }
        $uniacid = \YunShop::app()->uniacid;
        $list = [];
        if ($searchTime) {
            $orderAndUnwithdraw = DB::table('yz_store as s')
                ->leftJoin('yz_plugin_cashier_order as so',function ($join) use ($searchTime) {
                    $join->on('s.cashier_id', 'so.cashier_id')->where('so.created_at','>=' ,$searchTime[0])->where('so.created_at','<=',$searchTime[1]);
                })
                ->leftJoin('yz_order as o', function ($join) {
                    $join->on('so.order_id', 'o.id')->where('o.status', 3)->where('o.plugin_id',31);
                })
                ->where('s.uniacid', $uniacid)
                ->selectRaw($prefix.'s.cashier_id,max(store_name) as name, max(thumb) as thumb_url, sum(price) as price')
                ->groupBy('s.cashier_id')
                ->get();

            $withdraws = DB::table('yz_store as s')
                ->leftJoin('yz_member_income as sw', function ($join) use ($searchTime) {
                    $join->on('s.uid','sw.member_id')->where('sw.created_at','>=' ,$searchTime[0])->where('sw.created_at','<=',$searchTime[1]);
                })
                ->where('s.uniacid', $uniacid)
                ->where('sw.incometable_type','Yunshop\StoreCashier\common\models\CashierOrder')
                ->selectRaw($prefix.'s.cashier_id,sum(if('.$prefix.'sw.status=0,'.$prefix.'sw.amount,0)) as un_withdraw, sum(if('.$prefix.'sw.status=1 and '.$prefix.'sw.pay_status!=2,'.$prefix.'sw.amount,0)) as withdrawing, sum(if('.$prefix.'sw.pay_status=2,'.$prefix.'sw.amount,0)) as withdraw')
                ->groupBy('s.id')
                ->get();
        } else {
            $orderAndUnwithdraw = DB::table('yz_store as s')
                ->leftJoin('yz_plugin_cashier_order as so', 's.cashier_id', 'so.cashier_id')
                ->leftJoin('yz_order as o', function ($join) {
                    $join->on('so.order_id', 'o.id')->where('o.status', 3)->where('o.plugin_id',31);
                })
                ->where('s.uniacid', $uniacid)
                ->selectRaw($prefix.'s.cashier_id,max(store_name) as name, max(thumb) as thumb_url, sum(price) as price')
                ->groupBy('s.cashier_id')
                ->get();

            $withdraws = DB::table('yz_store as s')
                ->leftJoin('yz_member_income as sw', 's.uid', 'sw.member_id')
                ->where('s.uniacid', $uniacid)
                ->where('sw.incometable_type','Yunshop\StoreCashier\common\models\CashierOrder')
                ->selectRaw($prefix.'s.cashier_id,sum(if('.$prefix.'sw.status=0,'.$prefix.'sw.amount,0)) as un_withdraw, sum(if('.$prefix.'sw.status=1 and '.$prefix.'sw.pay_status!=2,'.$prefix.'sw.amount,0)) as withdrawing, sum(if('.$prefix.'sw.pay_status=2,'.$prefix.'sw.amount,0)) as withdraw')
                ->groupBy('s.id')
                ->get();

        }
        foreach($orderAndUnwithdraw as $key=>$vo){
            foreach ($withdraws as $w) {
                if ($vo['cashier_id'] == $w['cashier_id']) {
                    $vo = array_merge($vo, $w);
                }
            }
            $list[] = $vo;
        }
        array_multisort(array_column($list,'price'),SORT_DESC,$list);
        $totalAmount = collect($list);
        $unWithdrawTotal = $totalAmount->sum('un_withdraw');
        $priceTotal = $totalAmount->sum('price');
        $withdrawingTotal = $totalAmount->sum('withdrawing');
        $withdrawTotal = $totalAmount->sum('withdraw');

        return view('charts.merchant.cashier',[
            'cashierTotal' => count($list),
            'unWithdrawTotal' => $unWithdrawTotal,
            'priceTotal' => $priceTotal,
            'withdrawingTotal' => $withdrawingTotal,
            'withdrawTotal' => $withdrawTotal,
            'list' => $list,
            'search' => $search,
        ])->render();
    }

    public function export()
    {
        $prefix = app('db')->getTablePrefix();
        $searchTime = [];
        $search = \YunShop::request()->search;
        if ($search['is_time'] && $search['time']) {
            $searchTime[] = strtotime($search['time']['start']);
            $searchTime[] = strtotime($search['time']['end']);
        }
        $uniacid = \YunShop::app()->uniacid;
        $list = [];
        if ($searchTime) {
            $orderAndUnwithdraw = DB::table('yz_store as s')
                ->leftJoin('yz_plugin_cashier_order as so',function ($join) use ($searchTime) {
                    $join->on('s.cashier_id', 'so.cashier_id')->where('so.created_at','>=' ,$searchTime[0])->where('so.created_at','<=',$searchTime[1]);
                })
                ->leftJoin('yz_order as o', function ($join) {
                    $join->on('so.order_id', 'o.id')->where('o.status', 3);
                })
                ->where('s.uniacid', $uniacid)
                ->selectRaw($prefix.'s.cashier_id,max(store_name) as name, max(thumb) as thumb_url, sum(price) as price')
                ->groupBy('s.cashier_id')
                ->get();

            $withdraws = DB::table('yz_store as s')
                ->leftJoin('yz_member_income as sw', function ($join) use ($searchTime) {
                    $join->on('s.uid','sw.member_id')->where('sw.created_at','>=' ,$searchTime[0])->where('sw.created_at','<=',$searchTime[1]);
                })
                ->where('s.uniacid', $uniacid)
                ->where('sw.incometable_type','Yunshop\StoreCashier\common\models\CashierOrder')
                ->selectRaw($prefix.'s.cashier_id,sum(if('.$prefix.'sw.status=0,'.$prefix.'sw.amount,0)) as un_withdraw, sum(if('.$prefix.'sw.status=1 and '.$prefix.'sw.pay_status!=2,'.$prefix.'sw.amount,0)) as withdrawing, sum(if('.$prefix.'sw.pay_status=2,'.$prefix.'sw.amount,0)) as withdraw')
                ->groupBy('s.id')
                ->get();
        } else {
            $orderAndUnwithdraw = DB::table('yz_store as s')
                ->leftJoin('yz_plugin_cashier_order as so', 's.cashier_id', 'so.cashier_id')
                ->leftJoin('yz_order as o', function ($join) {
                    $join->on('so.order_id', 'o.id')->where('o.status', 3);
                })
                ->where('s.uniacid', $uniacid)
                ->selectRaw($prefix.'s.cashier_id,max(store_name) as name, max(thumb) as thumb_url, sum(price) as price')
                ->groupBy('s.cashier_id')
                ->get();

            $withdraws = DB::table('yz_store as s')
                ->leftJoin('yz_member_income as sw', 's.uid', 'sw.member_id')
                ->where('s.uniacid', $uniacid)
                ->where('sw.incometable_type','Yunshop\StoreCashier\common\models\CashierOrder')
                ->selectRaw($prefix.'s.cashier_id,sum(if('.$prefix.'sw.status=0,'.$prefix.'sw.amount,0)) as un_withdraw, sum(if('.$prefix.'sw.status=1 and '.$prefix.'sw.pay_status!=2,'.$prefix.'sw.amount,0)) as withdrawing, sum(if('.$prefix.'sw.pay_status=2,'.$prefix.'sw.amount,0)) as withdraw')
                ->groupBy('s.id')
                ->get();
        }
        foreach($orderAndUnwithdraw as $key=>$vo){
            foreach ($withdraws as $w) {
                if ($vo['cashier_id'] == $w['cashier_id']) {
                    $vo = array_merge($vo, $w);
                }
            }
            $list[] = $vo;
        }
        array_multisort(array_column($list,'price'),SORT_DESC,$list);

        $builder = Store::uniacid();
        $export_page = request()->export_page ? request()->export_page : 1;
        $export_model = new ExportService($builder, $export_page);
        $file_name = date('Ymdhis', time()) . '收银台收益列表导出';
        $export_data[0] = ['排行','收银台','交易完成总额','未提现收入','提现中收入','已提现收入'];
        foreach ($list as $key => $item) {
            $export_data[$key+1] = [
                $key + 1,
                $item['name'],
                $item['price'] ?: '0.00',
                $item['un_withdraw'] ?: '0.00',
                $item['withdrawing'] ?: '0.00',
                $item['withdraw'] ?: '0.00',
            ];
        }
        $export_model->export($file_name, $export_data, 'charts.merchant.cashier-income.index');
    }
}