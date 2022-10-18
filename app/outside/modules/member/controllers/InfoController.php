<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/1/7
 * Time: 18:28
 */

namespace app\outside\modules\member\controllers;


use app\common\models\Member;
use app\outside\controllers\OutsideController;

class InfoController extends OutsideController
{
    /**
     * @return \Illuminate\Http\JsonResponse
     */
    public function query()
    {
        $mobile = request()->input('phone');
        $certified = request()->input('certified','');


//        if (empty($mobile)) {
//            return $this->errorJson('搜索条件为空');
//        }

//        $member = Member::select('uid', 'nickname', 'realname', 'mobile', 'avatar')
//            ->where('realname', 'like', '%' . $search['member'] . '%')
//            ->orWhere('mobile', 'like', '%' . $search['member'] . '%')
//            ->orWhere('nickname', 'like', '%' . $search['member'] . '%');
        $member_list = Member::uniacid()->select(['uid', 'avatar', 'nickname', 'mc_members.realname', 'mobile', 'createtime',
            'credit1', 'credit2',])
            ->leftJoin('yz_member_del_log', 'mc_members.uid', '=', 'yz_member_del_log.member_id')
            ->leftJoin('yz_ys_system_member_certified', 'mc_members.uid','=','yz_ys_system_member_certified.member_id')
            ->join('yz_member', 'mc_members.uid', '=', 'yz_member.member_id')
            ->when($certified !== '',function($query)use($certified){
                if($certified == 0){
                    $query->whereNull('yz_ys_system_member_certified.member_id');
                }else{
                    $query->whereNotNull('yz_ys_system_member_certified.member_id');
                }
            })
            ->when($mobile,function($query)use($mobile){
                $query->where('mc_members.mobile', 'like', '%' . $mobile . '%');
            })
            ->with(['certified' => function($query){
                $query->select(['realname', 'idcard', 'member_id']);
            }])
            ->paginate(2);
        if ($member_list->isNotEmpty()) {
            $member_list->map(function ($member) {
                $member->createtime =  date('Y-m-d H:i:s', $member->createtime);
                return $member;
            });

        }

        return $this->successJson('list', $member_list);

    }
}