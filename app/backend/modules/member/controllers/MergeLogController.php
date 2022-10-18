<?php
/**
 * Created by PhpStorm.
 * User: weifeng
 * Date: 2021-03-04
 * Time: 14:54
 *
 *    .--,       .--,
 *   ( (  \.---./  ) )
 *    '.__/o   o\__.'
 *       {=  ^  =}
 *        >  -  <
 *       /       \
 *      //       \\
 *     //|   .   |\\
 *     "'\       /'"_.-~^`'-.
 *        \  _  /--'         `
 *      ___)( )(___
 *     (((__) (__)))     梦之所想,心之所向.
 */

namespace app\backend\modules\member\controllers;


use app\common\components\BaseController;
use app\common\helpers\PaginationHelper;
use app\common\models\member\MemberChangeLog;
use app\common\models\member\MemberMergeLog;
use app\common\models\SynchronizedBinder;

class MergeLogController extends BaseController
{
    public function index()
    {
        return view('member.mergeLog.auth-merge', [])->render();
    }

    public function authMerge()
    {
        $search = request()->search;
        $list = MemberChangeLog::searchLog($search)->orderBy('created_at', 'desc')->paginate()->toArray();
        return $this->successJson('ok', [
            'search' => $search,
            'list' => $list,
        ]);
    }

    public function bindTel()
    {
        $search = request()->search;
        $list = SynchronizedBinder::searchLog($search)->orderBy('created_at', 'desc')->paginate()->toArray();

        return $this->successJson('ok', [
            'search' => $search,
            'list' => $list,
        ]);
    }

    public function clickMerge()
    {
        $search = request()->search;
        $list = MemberMergeLog::searchLog($search)->orderBy('created_at', 'desc')->paginate()->toArray();

        return $this->successJson('ok', [
            'search' => $search,
            'list' => $list,
        ]);
    }
}