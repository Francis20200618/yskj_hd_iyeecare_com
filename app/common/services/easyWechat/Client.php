<?php
/****************************************************************
 * Author:  libaojia
 * Date:    2017/7/25 下午10:32
 * Email:   livsyitian@163.com
 * QQ:      995265288
 * User:    芸众商城 www.yunzshop.com
 ****************************************************************/

namespace app\common\services\easyWechat;

use EasyWeChat\Work\ExternalContact\Client as BaseClient;


class Client extends BaseClient
{


    public function getCorpTags(array $tagIds = [], array $groupIds = [])
    {
        $params = [
            'tag_id' => $tagIds,
            'group_id' => $groupIds
        ];

        return $this->httpPostJson('cgi-bin/externalcontact/get_corp_tag_list', $params);
    }

    public function getGroupChat(string $chatId)
    {
        $params = [
            'chat_id' => $chatId,
            'need_name' => 1,
        ];

        return $this->httpPostJson('cgi-bin/externalcontact/groupchat/get', $params);
    }

}
