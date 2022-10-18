<?php
/**
 * Created by PhpStorm.
 * User: yunzhong
 * Date: 2018/11/19
 * Time: 10:12
 */

namespace app\backend\modules\member\models;


use app\common\models\MemberMiniAppModel;

class MemberParent extends \app\common\models\member\MemberParent
{
    public function scopeParent($query, $request)
    {
        $query->select(['member_id', 'parent_id', 'level'])
            ->where('member_id', $request->id)->with([
                'hasOneMember' => function ($q) {
                    $q->select(['uid', 'avatar', 'nickname', 'realname', 'mobile', 'createtime', 'credit1', 'credit2']);
                },
                'hasOneFans' => function ($q) {
                    $q->select(['uid', 'follow', 'openid']);
                },
                'hasOneMiniApp' => function ($query) {
                    return $query->select(['mini_app_id', 'member_id', 'openid'])->uniacid();
                },
                'hasOneUnique' => function ($query) {
                    return $query->select(['unique_id', 'member_id', 'unionid'])->uniacid();
                },
            ]);
        if (app('plugins')->isEnabled('team-dividend')) {
            $query->with(['hasOneTeamDividend' => function ($q) {
                $q->select(['uid', 'level'])
                    ->with(['hasOneLevel' => function ($q) {
                        $q->select(['id', 'level_name']);
                    }]);
            }]);
        }

        if ($request->member_id) {
            $query->where('parent_id', $request->member_id);
        }

        if ($request->member) {
            $query->whereHas('hasOneMember', function ($q) use ($request) {
                $q->searchLike($request->member);
            });
        }

        if ($request->followed != '') {
            if ($request->followed == 0 || $request->followed == 1) {
                $query->whereHas('hasOneFans', function ($q) use ($request) {
                    $q->where('follow', $request->followed);
                });
            }

            if ($request->followed == 2) {
                $query->doesntHave('hasOneFans');
            }
        }
        return $query;

    }

    public static function getAgentParentByMemberId($memberId)
    {
        $set = \Setting::get('shop.member');
        $member_set = \Setting::get('relation_base');
        $member = self::where('level', 1)->where('member_id', $memberId)->with([
            'hasOneMember' => function ($q) {
                $q->select(['uid', 'avatar', 'nickname', 'mobile']);
            }])->first();
        if (!empty($member)) {
            return $data = [
                'uid' => $member['hasOneMember']['uid'],
                'avatar' => $member['hasOneMember']['avatar'],
                'nickname' => $member['hasOneMember']['nickname'] ?: '未更新',
                'mobile' => $member['hasOneMember']['mobile'],
                'is_show' => $member_set['parent_is_referrer'] ?: 0,
            ];
        } else {
            return $data = [
                'uid' => '',
                'avatar' => replace_yunshop(yz_tomedia($set['headimg'])),
                'nickname' => '总店',
                'level' => '',
                'is_show' => $member_set['parent_is_referrer'] ?: 0,
            ];

        }

    }

    public function scopeChildren($query, $request)
    {
        $query->select(['yz_member_parent.member_id', 'yz_member_parent.parent_id'])->where('yz_member_parent.parent_id', $request->id)
            ->join('yz_member', function ($join) {
                $join->select(['member_id'])
                    ->on('yz_member_parent.member_id', '=', 'yz_member.member_id')
                    ->whereNull('yz_member.deleted_at');
            })
            ->with([
                'hasOneChildMember' => function ($q) {
                    $q->select(['uid', 'avatar', 'nickname', 'realname', 'mobile', 'createtime', 'credit1', 'credit2']);
                },
                'hasOneChildFans' => function ($q) {
                    $q->select(['uid', 'follow']);
                },
                'hasOneLower' => function ($q) {
                    $q->selectRaw('count(member_id) as first, parent_id')->where('level', 1)->groupBy('parent_id');
                },
                'hasOneFans' => function ($query) {
                    return $query->select(['uid', 'follow as followed', 'openid']);
                },
                'hasOneMiniApp' => function ($query) {
                    return $query->select(['mini_app_id', 'member_id', 'openid'])->uniacid();
                },
                'hasOneUnique' => function ($query) {
                    return $query->select(['unique_id', 'member_id', 'unionid'])->uniacid();
                },
            ]);

        if ($request->level) {
            $query->where('level', $request->level);
        }

        if ($request->isblack) {
            $query->where('yz_member.is_black', $request->isblack);
        }

        if ($request->aid) {
            $query->where('yz_member.member_id', $request->aid);
        }

        if ($request->keyword) {
            $query->whereHas('hasOneChildMember', function ($q) use ($request) {
                $q->searchLike($request->keyword);
            });
        }

        if ($request->followed) {
            if ($request->followed == 1) {
                $query->whereHas('hasOneChildFans', function ($q) use ($request) {
                    $q->where('follow', $request->followed);
                });
            } else {
                $query->doesntHave('hasOneChildFans');
            }
        }
        return $query;

    }


    public static function getParentByMemberId($request)
    {
        $query = self::where('member_id', $request->id)->with([
            'hasOneMember' => function ($q) {
                $q->select(['uid', 'avatar', 'nickname', 'realname', 'mobile', 'createtime', 'credit1', 'credit2']);
            },
            'hasOneFans'
        ]);

        if ($request->member_id) {
            $query->where('parent_id', $request->member_id);
        }

        if ($request->member) {
            $query->whereHas('hasOneMember', function ($q) use ($request) {
                $q->searchLike($request->member);
            });
        }

        if ($request->followed != '') {
            $query->whereHas('hasOneFans', function ($q) use ($request) {
                $q->where('follow', $request->followed);
            });
        }
        return $query;
    }


    public function hasOneMember()
    {
        return $this->hasOne('app\common\models\Member', 'uid', 'parent_id');
    }

    public function hasOneChild()
    {
        return $this->hasOne('app\common\models\Member', 'uid', 'member_id');
    }

    public function hasOneFans()
    {
        return $this->hasOne('app\common\models\McMappingFans', 'uid', 'parent_id');
    }

    public function hasOneTeamDividend()
    {
        return $this->hasOne('Yunshop\TeamDividend\models\TeamDividendAgencyModel', 'uid', 'parent_id');
    }


    public function hasOneChildMember()
    {
        return $this->hasOne('app\common\models\Member', 'uid', 'member_id');
    }

    public function hasOneChildFans()
    {
        return $this->hasOne('app\common\models\McMappingFans', 'uid', 'member_id');
    }

    public function hasOneLower()
    {
        return $this->hasOne(self::class, 'parent_id', 'member_id');
    }

    public function hasManyParent()
    {
        return $this->hasMany(self::class, 'member_id', 'parent_id');
    }

    public function hasOneYzMember()
    {
        return $this->hasOne('\app\common\models\MemberShopInfo', 'member_id', 'parent_id');
    }
    //小程序
    public function hasOneMiniApp()
    {
        return $this->hasOne(MemberMiniAppModel::class, 'member_id', 'member_id');
    }

    //开放平台
    public function hasOneUnique()
    {
        return $this->hasOne(MemberUnique::class, 'member_id', 'member_id');
    }
}