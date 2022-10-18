@extends('layouts.base')
@section('title', '充值记录')
@section('content')
    <link href="{{static_url('yunshop/css/member.css')}}" media="all" rel="stylesheet" type="text/css"/>
    <div class="rightlist">

        <div class="panel panel-info">
            <div class="panel-heading">筛选</div>
            <div class="panel-body">
                <form action="" method="get" class="form-horizontal" role="form" id="form1">
                    <input type="hidden" name="c" value="site" />
                    <input type="hidden" name="a" value="entry" />
                    <input type="hidden" name="m" value="yun_shop" />
                    <input type="hidden" name="do" value="5201" />
                    <input type="hidden" name="route" value="finance.balance-recharge-records.index" id="route" />

                    <div class="form-group col-xs-12 col-sm-2 col-md-2 col-lg-2 ">
                        <div class="">
                            <input type="text" placeholder="充值单号" class="form-control"  name="search[ordersn]" value="{{$search['ordersn']}}"/>
                        </div>
                    </div>
                    <div class="form-group col-xs-12 col-sm-2 col-md-2 col-lg-2">
                        <div class="">
                            <input type="text" class="form-control"  name="search[realname]" value="{{$search['realname']}}" placeholder="昵称／姓名／手机号"/>
                        </div>
                    </div>

                    <div class="form-group col-xs-12 col-sm-2 col-md-2 col-lg-2">
                        <div class="">
                            <select name='search[level_id]' class='form-control'>
                                <option value=''>会员等级</option>
                                @foreach($memberLevel as $key => $item)
                                    <option value='{{ $item['id'] }}' @if($search['level_id'] == $item['id']) selected @endif>{{ $item['level_name'] }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-xs-12 col-sm-2 col-md-2 col-lg-2">
                        <div class="">
                            <select name='search[group_id]' class='form-control'>
                                <option value=''>会员分组</option>
                                @foreach($memberGroup as $key => $item)
                                    <option value='{{ $item['id'] }}' @if($search['group_id'] == $item['id']) selected @endif>{{ $item['group_name'] }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-xs-12 col-sm-2 col-md-2 col-lg-2">
                        <div class="">
                            <select name='search[pay_type]' class='form-control'>
                                <option value=''>充值方式</option>
                                @foreach($payType as $key => $item)
                                    <option value='{{ $key+1 }}' @if($search['pay_type'] == $key+1) selected @endif>{{ $item }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-xs-12 col-sm-2 col-md-2 col-lg-2">
                        <div class="">
                            <select name='search[status]' class='form-control'>
                                <option value=''>充值状态</option>
                                <option value='1' @if($search['status']=='1') selected @endif>充值成功</option>
                                <option value='-1' @if($search['status']=='-1') selected @endif>充值失败</option>
                            </select>
                        </div>
                    </div>


                    <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-6">
                        <div class="time">
                            <select name='search[search_time]' class='form-control'>
                                <option value='0' @if($search['search_time']=='0') selected @endif>不搜索时间</option>
                                <option value='1' @if($search['search_time']=='1') selected @endif>搜索时间</option>
                            </select>
                        </div>
                        <div class="search-select">
                            {!! app\common\helpers\DateRange::tplFormFieldDateRange('search[time]', [
                            'starttime'=>date('Y-m-d H:i', strtotime($search['time']['start']) ?: strtotime('-1 month')),
                            'endtime'=>date('Y-m-d H:i',strtotime($search['time']['end']) ?: time()),
                            'start'=>0,
                            'end'=>0
                            ], true) !!}
                        </div>
                    </div>

                    <div class="form-group  col-xs-12 col-sm-7 col-lg-4">
                        <div class="">
                            <button type="button" name="export" value="1" id="export" class="btn btn-default excel back ">导出Excel</button>
                            <input type="hidden" name="token" value="{{$var['token']}}" />
                            <button class="btn btn-success "><i class="fa fa-search"></i>搜索</button>
                        </div>
                    </div>
                </form>
            </div>


        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <span>总数：{{ $recordList->total() }}</span>
                &nbsp&nbsp&nbsp&nbsp
                <span>金额合计：{{ $amount }}</span>
            </div>
            <div class="panel-body ">
                <table class="table table-hover">
                    <thead class="navbar-inner">
                        <tr>
                            <th style='width:15%; text-align: center;'>充值单号</th>
                            <th style='width:15%; text-align: center;'>会员ID</th>
                            <th style='width:10%; text-align: center;'>粉丝</th>
                            <th style='width:10%; text-align: center;'>会员信息<br/>手机号</th>
                            <th style='width:10%; text-align: center;' class='hidden-xs'>等级/分组</th>
                            <th style='width:12%; text-align: center;'>充值时间</th>
                            <th style='width:10%; text-align: center;'>充值方式</th>
                            <th style='width:10%; text-align: center;'>充值金额<br/>状态</th>
                            <th style='width:13%; text-align: center;'>备注信息</th>
                            <th style='width:10%; text-align: center;'>操作</th>
                        </tr>
                    </thead>
                @foreach($recordList as $list)
                    <tr style="text-align: center;">
                        <td>{{ $list->ordersn }}</td>
                        <td>{{ $list->member_id }}</td>
                        <td>
                            @if($list->member->avatar || $shopSet['headimg'])
                            <img src='{{ $list->member->avatar ? tomedia($list->member->avatar) : tomedia($shopSet['headimg'])}}' style='width:30px;height:30px;padding:1px;border:1px solid #ccc'/>
                            <br/>
                            @endif
                            {{ $list->member->nickname ? $list->member->nickname : '未更新' }}
                        </td>
                        <td>
                            {{ $list->member->realname }}
                            <br/>
                            {{ $list->member->mobile }}
                        </td>

                        <td class='hidden-xs'>
                            {{ $list->member->yzMember->level->level_name ?? $shopSet['level_name']}}
                            <br />
                            {{ $list->member->yzMember->group->group_name ?? ''}}
                        </td>

                        <td>{{ $list->created_at }}</td>
                        <td>
                            @if($list->type == 0)
                                <span class='label label-default'>{{ $list->type_name }}</span>
                            @elseif($list->type ==1)
                                <span class='label label-success'>{{ $list->type_name }}</span>
                            @elseif($list->type == 2)
                                <span class='label label-warning'>{{ $list->type_name }}</span>
                            @elseif($list->type == 9 || $list->type == 10)
                                <span class='label label-info'>{{ $list->type_name }}</span>
                            @else
                                <span class='label label-primary'>{{ $list->type_name }}</span>
                            @endif

                        </td>
                        <td>
                            {{ $list->money }}
                            <br/>
                            @if($list->status == 1)
                                <span class='label label-success'>充值成功</span>
                            @elseif($list->status == '-1')
                                <span class='label label-warning'>充值失败</span>
                            @else
                                <span class='label label-default'>申请中</span>
                            @endif

                        </td>
                        <td><a style="color: #0a0a0a" title="{{ $list->remark }}">{{ $list->remark }}</a></td>
                        <td>
                            <a class='btn btn-default' href="{{ yzWebUrl('member.member.detail', array('id' => $list->member_id)) }}" style="margin-bottom: 2px">用户信息</a>
                        </td>
                    </tr>
                @endforeach
                </table>
                {!! $page !!}
            </div>
        </div>
    </div>


    <script language='javascript'>
        $(function () {
            $('#export').click(function(){
                $('#route').val("finance.balance-recharge-records.export");
                $('#form1').submit();
                $('#route').val("finance.balance-recharge-records.index");
            });
        });
    </script>

@endsection
