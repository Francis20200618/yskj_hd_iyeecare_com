<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/9/22
 * Time: 13:37
 */

const BASE_ROUTE = 'business';

Route::group(['middleware' => ['business:', 'businessLogin:']], function () {  //插件路由
    $base_route = BASE_ROUTE . '/{uniacid}/plugin/';

    /*芸客服路由*/
    Route::group(['prefix' => $base_route . 'YunChat/'], function () {
        $yun_chat_path = '\Yunshop\YunChat\manage\\';
        Route::any('groupGetList', $yun_chat_path . 'GroupController@getList');//客服组列表
        Route::any('groupSave', $yun_chat_path . 'GroupController@save');//添加编辑客服组
        Route::any('groupDelete', $yun_chat_path . 'GroupController@delete');//删除客服组
        Route::any('groupQuery', $yun_chat_path . 'GroupController@query');//检索客服组

        Route::any('employeeGetList', $yun_chat_path . 'EmployeeController@getList');//客服列表
        Route::any('employeeGetSummary', $yun_chat_path . 'EmployeeController@getSummary');//客服列表统计信息
        Route::any('employeeCreate', $yun_chat_path . 'EmployeeController@create');//添加客服
        Route::any('employeeUpdate', $yun_chat_path . 'EmployeeController@update');//编辑客服
        Route::any('employeeGetDetail', $yun_chat_path . 'EmployeeController@getDetail');//客服详情
        Route::any('employeeChangeStatus', $yun_chat_path . 'EmployeeController@changeStatus');//修改客服状态
        Route::any('employeeDelete', $yun_chat_path . 'EmployeeController@delete');//删除客服
        Route::any('employeeSetAgent', $yun_chat_path . 'EmployeeController@setAgent');//分配客服坐席
        Route::any('employeeRemoveAgent', $yun_chat_path . 'EmployeeController@removeAgent');//释放客服坐席

        Route::any('chatGetHistoryList', $yun_chat_path . 'ChatController@getHistoryList');//会话列表
        Route::any('chatGetChatList', $yun_chat_path . 'ChatController@getChatList');//会话消息列表
        Route::any('chatDeleteChat', $yun_chat_path . 'ChatController@deleteChat');//会话消息删除

        Route::any('commonReplyGetList', $yun_chat_path . 'CommonReplyController@getList');//快捷回复列表
        Route::any('commonReplyGetDetail', $yun_chat_path . 'CommonReplyController@getDetail');//快捷回复详情
        Route::any('commonReplySave', $yun_chat_path . 'CommonReplyController@save');//添加编辑快捷回复
        Route::any('commonReplyDelete', $yun_chat_path . 'CommonReplyController@delete');//删除快捷回复

        Route::any('setBasic', $yun_chat_path . 'SetController@basic');//获取设置信息
        Route::any('setBasicPost', $yun_chat_path . 'SetController@basicPost');//保存芸客服设置信息

        Route::any('wordsReplyGetList', $yun_chat_path . 'WordsReplyController@getList');//关键词回复列表
        Route::any('wordsReplyGetDetail', $yun_chat_path . 'WordsReplyController@getDetail');//获取关键词回复详情
        Route::any('wordsReplySave', $yun_chat_path . 'WordsReplyController@save');//添加编辑关键词回复
        Route::any('wordsReplyDelete', $yun_chat_path . 'WordsReplyController@delete');//删除关键词回复
        Route::any('wordsReplyQueryKeyWords', $yun_chat_path . 'WordsReplyController@queryKeyWords');//检索快捷回复关键词

        Route::any('toolbarGetList', $yun_chat_path . 'ToolBarController@getList');//聊天工具栏列表
        Route::any('toolbarSave', $yun_chat_path . 'ToolBarController@save');//聊天工具栏添加编辑
        Route::any('toolbarGetDetail', $yun_chat_path . 'ToolBarController@getDetail');//获取工具栏详情
        Route::any('toolbarChangeStatus', $yun_chat_path . 'ToolBarController@changeStatus');//修改聊天工具栏状态
        Route::any('toolbarDelete', $yun_chat_path . 'ToolBarController@delete');//删除聊天工具栏
    });
    /*芸客服路由*/


    /*企业客户路由*/
    Route::group(['prefix' => $base_route . 'WechatCustomers/'], function () {
        $wechat_cunstomers_path = '\Yunshop\WechatCustomers\manage\\';
        Route::any('getList', $wechat_cunstomers_path . 'customer\IndexController@getList');//列表
        Route::any('synchBaseData', $wechat_cunstomers_path . 'customer\IndexController@synchBaseData');//同步企业微信
        Route::any('synchMemberBaseData', $wechat_cunstomers_path . 'customer\IndexController@synchMemberBaseData');//同步会员
        Route::any('getDetails', $wechat_cunstomers_path . 'customer\IndexController@getDetails');//同步会员
        Route::any('receive', '\Yunshop\WorkWechat\wevent\ChangeExtContactController@receive');//同步会员
    });
    /*企业客户路由*/


    /*群拓客路由*/
    Route::group(['prefix' => $base_route . 'GroupDevelopUser/'], function () {
        $this_path = '\Yunshop\GroupDevelopUser\manage\\';
        Route::post('getSetting', $this_path . 'SettingController@getSetting');//获取设置
        Route::post('setSetting', $this_path . 'SettingController@setSetting');//编辑设置
        Route::post('getGroupSetting', $this_path . 'SettingController@getGroupSetting');//获取群设置
        Route::post('setGroupSetting', $this_path . 'SettingController@setGroupSetting');//编辑群设置
        Route::any('getList', $this_path . 'GroupChatController@getList');//列表
        Route::any('synch', $this_path . 'GroupChatController@synch');//同步
        Route::any('listExport', $this_path . 'GroupChatController@listExport');//导出
        Route::any('getGroupMembers', $this_path . 'GroupChatController@getGroupMembers');//获取群会员
        Route::any('saveQrcodeImg', $this_path . 'GroupChatController@saveQrcodeImg');//上传二维码
        Route::any('getNewPost', $this_path . 'PosterController@getPoster');//生成海报
        Route::any('posterList', $this_path . 'PosterController@posterList');//海报列表
        Route::any('deletePost', $this_path . 'PosterController@deletePoster');//删除海报
        Route::any('deleteAllPoster', $this_path . 'PosterController@deleteAllPoster');//删除所有满足搜索条件的海报
        Route::any('refreshPost', $this_path . 'PosterController@refreshPoster');//重新生成海报
        Route::any('bindUser', $this_path . 'GroupChatController@bindUser');//生成海报
        Route::any('getGroupEmployees', $this_path . 'GroupChatController@getGroupEmployees');//生成海报
        Route::any('groupMemberListExport', $this_path . 'GroupChatController@groupMemberListExport');//生成海报
        Route::any('groupEmployeeListExport', $this_path . 'GroupChatController@groupEmployeeListExport');//生成海报

        // 群标签
        Route::post('saveGroupChatTag',$this_path . 'GroupChatController@saveGroupChatTag');// 群聊绑定标签
        Route::post('getGroupList',$this_path . 'GroupChatTagController@getGroupList');// 获取标签组列表
        Route::post('getTagList',$this_path . 'GroupChatTagController@getTagList');// 获取标签列表
        Route::post('getAllTag',$this_path . 'GroupChatTagController@getAllTag');// 获取所有标签
        Route::post('getAllGroupTag',$this_path . 'GroupChatTagController@getAllGroupTag');// 获取整合信息
        Route::post('getGroupDetail',$this_path . 'GroupChatTagController@getGroupDetail');// 获取标签组详情
        Route::post('getTagDetail',$this_path . 'GroupChatTagController@getTagDetail');// 获取标签详情
        Route::post('saveTag',$this_path . 'GroupChatTagController@saveTag');// 保存标签
        Route::post('saveGroup',$this_path . 'GroupChatTagController@saveGroup');// 保存标签组
        Route::post('delGroup',$this_path . 'GroupChatTagController@delGroup');// 删除标签组
        Route::post('delTag',$this_path . 'GroupChatTagController@delTag');// 删除标签
    });
    /*群拓客路由*/

    /*群拓客奖励路由*/
    Route::group(['prefix' => $base_route . 'GroupReward/'], function () {
        $this_path = '\Yunshop\GroupReward\manage\\';
        Route::post('getActivityList', $this_path . 'GroupRewardController@getActivityList');// 活动管理数据接口
        Route::post('getRewardDetail', $this_path . 'GroupRewardController@getRewardDetail');// 活动群聊数据接口
        Route::post('getActivityDetail', $this_path . 'GroupRewardController@getActivityDetail');// 活动详细信息接口
        Route::post('setGroupActivity', $this_path . 'GroupRewardController@setGroupActivity');// 保存活动
        Route::post('setActivityStatus', $this_path . 'GroupRewardController@setActivityStatus');// 结束活动
        Route::post('searchGroup', $this_path . 'GroupRewardController@searchGroup');// 搜索活动
        Route::post('searchCoupon', $this_path . 'GroupRewardController@searchCoupon');// 搜索优惠券
        Route::any('rewardExport', $this_path . 'GroupRewardController@export');// 导出
    });
    /*群拓客奖励路由*/

    /*侧边栏路由*/
    Route::group(['prefix' => $base_route . 'WechatChatSidebar/'], function () {
        $this_path = '\Yunshop\WechatChatSidebar\manage\\';
        Route::any('getDepartmentMember', '\business\admin\controllers\DepartmentMemberController@getDepartmentMember'); //选择部门和成员
        Route::any('getData', $this_path . 'ListController@getData');//列表
        Route::any('getLinkPower', $this_path . 'ListController@getLinkPower');//获取链接权限角色
        Route::any('editPower', $this_path . 'ListController@editPower');//修改链接权限
    });
    /*侧边栏路由*/

    /*会话存档路由*/
    Route::group(['prefix' => $base_route . 'WorkSession/'], function () {
        $work_session_path = '\Yunshop\WorkSession\manage\\';
        Route::get('basicInfo', $work_session_path . 'SetController@basicInfo');//员工列表
        Route::get('basicSave', $work_session_path . 'SetController@basicSave');//员工列表
        Route::get('getList', $work_session_path . 'MessageController@getList');//员工列表
        Route::get('switchStaff', $work_session_path . 'MessageController@switchStaff');//切换员工、消息类型，搜索群聊或者私聊
        Route::post('getChatMsg', $work_session_path . 'MessageController@getChatMsg');//获取群聊消息列表
        Route::post('getPrivateChatMsg', $work_session_path . 'MessageController@getPrivateChatMsg');//获取私聊消息列表
    });
    /*会话存档路由*/

    /*欢迎语路由*/
    Route::group(['prefix' => $base_route . 'WelcomeWords/'], function () {
        $this_path = '\Yunshop\WelcomeWords\manage\\';
        Route::any('getDepartmentMember', '\business\admin\controllers\DepartmentMemberController@getDepartmentMember'); //选择部门和成员
        Route::any('getList', $this_path . 'ListController@listData');//欢迎语列表
        Route::any('detail', $this_path . 'ListController@detail');//欢迎语详情
        Route::any('save', $this_path . 'ListController@save');//欢迎语保存
        Route::any('search', $this_path . 'ListController@search');//部门成员搜索
        Route::any('delete', $this_path . 'ListController@delete');//欢迎语删除
    });
    /*欢迎语路由*/


    /*企业客户标签路由*/
    Route::group(['prefix' => $base_route . 'WorkWechatTag/'], function () {
        $this_path = '\Yunshop\WorkWechatTag\business\\';

        Route::any('getTagSetting', $this_path . 'SettingController@getSetting');//获取标签设置
        Route::any('setTagSetting', $this_path . 'SettingController@setSetting');//编辑标签设置

        Route::any('tagList', $this_path . 'TagController@tagList');//标签列表
        Route::any('tagDetail', $this_path . 'TagController@tagDetail');//标签详情
        Route::any('addTag', $this_path . 'TagController@addTag');//添加标签
        Route::any('editTag', $this_path . 'TagController@editTag');//编辑标签
        Route::any('deleteTag', $this_path . 'TagController@deleteTag');//删除标签

        Route::any('tagGroupList', $this_path . 'TagGroupController@tagGroupList');//标签组列表
        Route::any('tagGroupDetail', $this_path . 'TagGroupController@tagGroupDetail');//标签组详情
        Route::any('addTagGroup', $this_path . 'TagGroupController@addTagGroup');//添加标签组
        Route::any('editTagGroup', $this_path . 'TagGroupController@editTagGroup');//编辑标签组
        Route::any('deleteTagGroup', $this_path . 'TagGroupController@deleteTagGroup');//删除标签组
        Route::any('groupChooseList', $this_path . 'TagGroupController@groupChooseList');//标签组选择栏

        Route::any('refreshShopTag', $this_path . 'RefreshController@refreshShopTag');//同步商城标签
        Route::any('refreshWechatTag', $this_path . 'RefreshController@refreshWechatTag');//同步企业微信客户标签

    });
    /*企业客户标签路由*/

    /*企业客户好友裂变路由*/
    Route::group(['prefix' => $base_route . 'CustomerIncrease/'], function () {
        $this_path = '\Yunshop\CustomerIncrease\business\\';

        Route::any('activityList', $this_path . 'ActivityController@activityList');//活动列表
        Route::any('activityDetail', $this_path . 'ActivityController@activityDetail');//活动详情
        Route::any('activityAdd', $this_path . 'ActivityController@activityAdd');//创建活动
        Route::any('activityEdit', $this_path . 'ActivityController@activityEdit');//编辑活动
        Route::any('activityClose', $this_path . 'ActivityController@activityClose');//结束活动
        Route::any('activityCount', $this_path . 'ActivityController@activityCount');//活动助力统计
        Route::any('activityCode', $this_path . 'ActivityController@activityCode');//活动推广码
        Route::any('searchTag', $this_path . 'ActivityController@searchTag');//查询企业微信标签
        Route::any('searchCoupon', $this_path . 'ActivityController@searchCoupon');//查询优惠券

        Route::any('memberList', $this_path . 'CountController@memberList');//参与记录列表
        Route::any('activityAnalysis', $this_path . 'CountController@activityAnalysis');//统计概况

        Route::any('posterList', $this_path . 'PosterController@posterList');//海报生成记录列表
        Route::any('posterDelete', $this_path . 'PosterController@posterDelete');//删除海报
        Route::any('posterRefresh', $this_path . 'PosterController@posterRefresh');//重新生成海报
        Route::any('deleteManyPoster', $this_path . 'PosterController@deleteManyPoster');//批量删除海报

        Route::any('rewardList', $this_path . 'RewardController@rewardList');//奖励记录列表
        Route::any('rewardByPeople', $this_path . 'RewardController@rewardByPeople');//手动发放奖励

        Route::any('searchStaff', '\business\admin\controllers\StaffController@searchStaff');//查询企业微信关联员工

    });
    /*企业客户好友裂变路由*/

    /*sop任务*/
    Route::group(['prefix' => $base_route . 'SopTask/'], function () {
        $this_path = '\Yunshop\SopTask\business\controller\\';

        Route::post('getTaskList', $this_path . 'TaskListController@getTaskList');// 任务列表
        Route::post('getLogList', $this_path . 'TaskListController@getLogList');// 推送列表
        Route::post('getTaskDetail', $this_path . 'TaskListController@getTaskDetail');// 任务详情
        Route::post('saveTask', $this_path . 'TaskListController@saveTask');// 保存任务
        Route::post('setTaskStatus', $this_path . 'TaskListController@setTaskStatus');// 修改任务状态
        Route::post('delTask', $this_path . 'TaskListController@delTask');// 删除任务
        Route::post('getTagList', $this_path . 'TaskListController@getTagList');// 获取企业标签
        Route::get('getSet', $this_path . 'TaskListController@getSet');// 获取基础配置
        Route::any('taskExport', $this_path . 'TaskListController@taskExport');// 导出任务
        Route::any('logExport', $this_path . 'TaskListController@logExport');// 导出推送日志
        Route::post('checkGroupChat', $this_path . 'GroupChatController@checkGroupChat');// 查看群数量

        Route::post('searchStaff', '\business\admin\controllers\StaffController@searchStaff');// 查询企业微信关联员工
        Route::post('searchGroupLeader', $this_path . 'GroupChatController@searchGroupLeader');// 获取群主列表
        Route::post('searchGroupChat',$this_path . 'GroupChatController@searchGroupChat');// 查询群聊
        Route::post('getAllTag','\Yunshop\GroupDevelopUser\manage\GroupChatTagController@getAllTag');// 获取所有标签
    });
    /*sop任务*/

    /*话术库路由*/
    Route::group(['prefix' => $base_route . 'SpeechcraftLibrary/'], function () {
        $this_path = '\Yunshop\SpeechcraftLibrary\business\controller\\';

        Route::post('getDepartmentMember', '\business\admin\controllers\DepartmentMemberController@getDepartmentMember'); //选择部门和成员

        Route::post('getGroupList', $this_path . 'MaterialGroupController@getGroupList');// 获取分组列表
        Route::post('getGroupInfo', $this_path . 'MaterialGroupController@getGroupInfo');// 获取分组信息
        Route::post('saveGroup', $this_path . 'MaterialGroupController@saveGroup');// 保存分组信息
        Route::post('delGroup', $this_path . 'MaterialGroupController@delGroup');// 删除分组

        Route::post('getMaterialList', $this_path . 'MaterialController@getMaterialList');// 获取素材列表
        Route::post('getMaterialInfo', $this_path . 'MaterialController@getMaterialInfo');// 获取素材信息
        Route::post('saveMaterial', $this_path . 'MaterialController@saveMaterial');// 保存素材
        Route::post('delMaterial', $this_path . 'MaterialController@delMaterial');// 删除素材
        Route::post('editMaterialStatus', $this_path . 'MaterialController@editMaterialStatus');// 修改素材状态

        Route::post('getSet', $this_path . 'SetController@index');// 获取基础设置
        Route::post('editSet', $this_path . 'SetController@editSet');// 修改基础设置
    });
    /*话术库路由*/

    /*让利涨粉*/
    Route::group(['prefix' => $base_route . 'DiscountHarvestFans/'], function () {
        $this_path = '\Yunshop\DiscountHarvestFans\business\controller\\';

        Route::post('getSet', $this_path . 'SetController@getSet');// 获取设置
        Route::post('saveSet', $this_path . 'SetController@saveSet');// 保存设置
        Route::post('getStaffList', $this_path . 'StaffController@getStaffList');// 获取员工列表
        Route::post('getTagList', $this_path . 'TagController@getTagList');// 获取标签列表
    });
    /*让利涨粉*/
	
	/*pos收银*/
    Route::group(['prefix' => $base_route . 'ShopPos/'], function () {
        $this_path = '\Yunshop\ShopPos\business\\';
        Route::post('getSetting', $this_path . 'SettingController@index');//获取设置
        Route::post('editSetting', $this_path . 'SettingController@edit');//编辑设置
        Route::post('searchMember', '\business\admin\controllers\StaffController@businessGetMemberByMobile');//查询会员
    });
    /*pos收银*/

	/*拓客雷达*/
    Route::group(['prefix' => $base_route . 'CustomerRadar/'], function () {
        $this_path = '\Yunshop\CustomerRadar\business\controller\\';

        Route::post('getSet', $this_path . 'SetController@getSet');// 获取设置
        Route::post('saveSet', $this_path . 'SetController@saveSet');// 保存设置
        Route::post('getMemberList', $this_path . 'SetController@getMemberList');// 会员列表
        Route::post('getDepartmentMember', '\business\admin\controllers\DepartmentMemberController@getDepartmentMember');// 选择部门和成员
    });
    /*拓客雷达*/});


Route::group(['namespace' => 'admin\controllers'], function () {


    Route::group(['prefix' => BASE_ROUTE . '/{uniacid}/admin/', 'middleware' => ['business:']], function () {
        Route::any('manageBusiness', 'BusinessController@manageBusiness'); //管理企业
        Route::any('businessList', 'BusinessController@businessList'); //企业管理列表
        Route::any('addBussiness', 'BusinessController@addBussiness'); //创建企业
        Route::any('getBusinessCommonData', 'BusinessController@getBusinessCommonData'); //获取公共参数

        Route::any('managerList', 'ManagerController@managerList'); //管理员列表
        Route::any('changeBusinessOwner', 'ManagerController@changeBusinessOwner'); //企业转让
        Route::any('addManager', 'ManagerController@addManager'); //添加管理员
        Route::any('deleteManager', 'ManagerController@deleteManager'); //删除管理员

        Route::any('cleanMemberCache', 'SettingController@cleanMemberCache'); //清除会员缓存

    });


    Route::group(['prefix' => BASE_ROUTE . '/{uniacid}/admin/', 'middleware' => ['business:', 'businessLogin:']], function () {
        Route::any('getBusinessSurvey', 'SettingController@getBusinessSurvey'); //企业概况
        Route::any('cleanBusinessCache', 'SettingController@cleanBusinessCache'); //清除企业缓存
        Route::any('businessQyWxSetting', 'SettingController@businessQyWxSetting'); //企业微信设置
        Route::any('editBussiness', 'SettingController@editBussiness'); //编辑企业

        Route::any('getDepatmemtList', 'DepartmentController@getDepatmemtList'); //获取部门列表
        Route::any('createDepartment', 'DepartmentController@createDepartment'); //创建部门
        Route::any('updateDepartment', 'DepartmentController@updateDepartment'); //编辑部门
        Route::any('deleteDepartment', 'DepartmentController@deleteDepartment'); //删除部门
        Route::any('refreshDepartmentList', 'DepartmentController@refreshDepartmentList'); //从企业微信同步部门列表到本地
        Route::any('pushDepartment', 'DepartmentController@pushDepartment'); //推送部门列表到企业微信

        Route::any('getStaffList', 'StaffController@getStaffList'); //根据部门id获取员工列表
        Route::any('refreshStaffList', 'StaffController@refreshStaffList'); //从企业微信同步员工列表
//        Route::any($base_route . 'pushStaff', 'StaffController@pushStaff'); //推送员工到企业微信
        Route::any('setDepartmentLeader', 'StaffController@setDepartmentLeader'); //设置部门领导
        Route::any('createStaff', 'StaffController@createStaff'); //创建员工
        Route::any('updateStaff', 'StaffController@updateStaff'); //编辑员工
        Route::any('deleteStaff', 'StaffController@deleteStaff'); //禁用员工
        Route::any('businessGetMemberByMobile', 'StaffController@businessGetMemberByMobile'); //根据手机号精确查找会员
        Route::any('searchStaff', 'StaffController@searchStaff'); //查找企业员工

        Route::any('getAuthList', 'AuthController@getAuthList'); //获取权限列表
        Route::any('setAuth', 'AuthController@setAuth'); //设置权限

        Route::any('getApplicationList', 'ApplicationController@getApplicationList'); //应用中心

        Route::any('uploadPic', 'UploadController@uploadPic');

    });
});


Route::group(['namespace' => 'frontend\controllers'], function () {
    Route::any('business/{uniacid}/frontend/qyWxCallback', 'WxCallbackController@qyWxCallback'); //企业微信通知
    Route::any('/{uniacid}/frontend/qyWxCallback', 'WxCallbackController@qyWxCallback'); //企业微信通知
});

//芸签短链
Route::group(['prefix' => 'sign/'], function () {
    Route::any('s', '\Yunshop\YunSign\frontend\ShortUrlController@index');
});

