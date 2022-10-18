<?php
namespace app\backend\modules\goods\models;
use Illuminate\Support\Facades\DB;

/**
 * Created by PhpStorm.
 * Author: 芸众商城 www.yunzshop.com
 * Date: 2017/2/27
 * Time: 下午5:10
 */

class Comment extends \app\common\models\Comment
{
    static protected $needLog = true;

    /**
     * @param $search
     * @param $comment_type
     * @return mixed
     */
    public static function getComments($search,$comment_type='')
    {
        $commentModdel = self::uniacid();
        if ($search['keyword']) {
            $commentModdel->whereHas('goods', function ($query) use ($search) {
                return $query->searchLike($search['keyword']);
            });
        }
        $commentModdel->with(['goods' => function ($query) {
            return $query->select(['id', 'title', 'thumb','plugin_id']);
        }]);
//        if (!$comment_type) {
//            $commentModdel->where('comment_id', '0');
//        }

        $commentModdel->when($search['type'],function($query) use ($search){
            $query->where('type',$search['type']);
        });

        $commentModdel->when(count(array_filter($search['audit_time_scope'])) == 2,function($query) use ($search){
            $query->where('audit_time','>=', $search['audit_time_scope'][0])->where('audit_time','<=', $search['audit_time_scope'][1]);
        });

        $commentModdel->when(count(array_filter($search['create_time_scope'])) == 2,function($query) use ($search){
            $query->where('created_at','>=', strtotime($search['create_time_scope'][0]))->where('created_at','<=', strtotime($search['create_time_scope'][1]));
        });

        $commentModdel->when($search['audit_operator'],function($query) use ($search){
            $query->where('audit_operator',$search['audit_operator']);
        });

        $commentModdel->when($search['content'], function($query) use ($search){
            $query->where('content', 'like', '%'.$search['content'].'%');
        });

        $commentModdel->when($search['uid'], function($query) use ($search){
            $query->where('uid', $search['uid']);
        });

        $commentModdel->when($search['is_helper'] === '0' || $search['is_helper'] === '1', function($query) use ($search){
            $query->where('is_helper', $search['is_helper']);
        });


        if ($search['fade'] == 1) {
            $commentModdel->where('uid', '>', '0');
        } elseif ($search['fade'] == 2) {
            $commentModdel->where('uid', '=', '0');
        }

        if ($search['hasdefaultgoodreputation'] == 1) {
            $commentModdel->where('has_default_good_reputation', '=', '1');
        } elseif ($search['hasdefaultgoodreputation'] == 2) {
            $commentModdel->where('has_default_good_reputation', '=', '0');
        }

        if ($search['additional_comment'] == 1) {
            $commentModdel->where('comment_id', '=', '0');
        } elseif($search['additional_comment'] == 2) {
            $commentModdel->where('comment_id', '>', '0');
        }
                
        $commentModdel->orderBy('created_at', 'desc');

        return $commentModdel;
    }

    /**
     * @param $id
     * @return mixed
     */
    public static function getComment($id)
    {
        return self::with(['hasManyReply'=>function ($query) {
            return $query->where('type', 2)
                ->orderBy('created_at', 'asc');
        }])
            ->with(['hasManyAppend' => function ($query) {
                return $query->where('type', 3)
                    ->orderBy('created_at', 'asc');
            }])
            ->where('id', $id);
    }


    /**
     * @param $comment
     * @return bool
     */
    public static function saveComment($comment)
    {
        return self::insert($comment);
    }

    /**
     * @param $comment_id
     * @return mixed
     */
    public static function getReplysByCommentId($comment_id)
    {
        return self::where('comment_id', $comment_id)
            ->orderBy('created_at', 'asc')
            ->get();
    }

    /**
     * @param $id
     * @return mixed
     */
    public static function daletedComment($id)
    {
        return self::where('id', $id)
            ->delete();
    }

    /**
     *
     * @return mixed
     */
    public function goods()
    {
        return $this->belongsTo(\app\common\models\Goods::class);
    }

    /**
     *  定义字段名
     * 可使
     * @return array
     */
    public function atributeNames()
    {
        return [
            'goods_id' => '评论商品',
            'content' => '评论内容',
        ];
    }

    /**
     * 字段规则
     * @return array
     */
    public function rules()
    {
        return [
            'goods_id' => 'required',
            'content' => 'required'
        ];
    }
}