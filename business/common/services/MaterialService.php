<?php

namespace business\common\services;

use app\common\exceptions\AppException;
use business\common\models\Material;
use EasyWeChat\Factory;

class MaterialService
{
    static $current;
    protected $agent_app;
    protected $nickname;
    protected $business_id;
    protected $filterName = false;

    private function __construct($business_id)
    {
        $business_id or $business_id = SettingService::getBusinessId();
        if (!$business_id) {
            throw new AppException('企业ID参数缺失！');
        }
        $this->business_id = $business_id;
    }

    /**
     * @param $business_id
     * @param $app
     * @return static
     * @throws AppException
     */
    public static function current($business_id = 0, $app = null)
    {
        if (static::$current) {
            return static::$current;
        }

        static::$current = new static($business_id);

        if ($app) {
            static::$current->setApp($app);
        } else {
            $config = SettingService::getQyWxSetting($business_id);

            static::$current->setApp(Factory::work([
                'corp_id' => $config['corpid'],
                'agent_id' => $config['agentid'],
                'secret' => $config['contact_secret'],
            ]));
        }

        return static::$current;
    }

    public function setApp($app)
    {
        $this->agent_app = $app;
    }

    // 设置文本昵称
    public function setNickname($nickname)
    {
        $this->nickname = $nickname;
    }

    public function filterName()
    {
        $this->filterName = true;
    }

    public function handleContent($content_list)
    {
        foreach ($content_list as &$v) {
            switch ($v['type']) {
                case 'text':
                    // PC后台编辑素材内容时换行有以下三种形式
                    $str = str_replace('<div><br></div>', "\n", html_entity_decode($v['news']));
                    $str = str_replace('<br>',"\n",$str);
                    $v['news'] = strip_tags(str_replace('<div>',"\n",$str));

                    if ($this->filterName){
                        $v['news'] = str_replace('客户昵称', '', $v['news']);
                    }

                    // 传入客户昵称或群聊昵称则替换
                    if ($this->nickname) {
                        $v['news'] = str_replace('客户昵称', $this->nickname, $v['news']);
                    }
                    break;
                case 'image':
                    $v['media_id'] = $this->getMediaId($v['type'], $v['link_img']);
                    break;
                case 'link':

                    break;
                case 'applet':
                    $v['media_id'] = $this->getMediaId('image', $v['link_img']);
                    if ($v['page']){
                        if ($start = strpos($v['page'],'?') !== false){
                            $v['page'] = substr_replace($v['page'],'.html?',$start,1);
                        }else{
                            $v['page'] .= '.html';
                        }
                    }
                    break;
                case 'video':
                    $v['media_id'] = $this->getMediaId($v['type'], $v['link_video']);
                    break;
                case 'file':
                    $v['media_id'] = $this->getMediaId($v['type'], $v['link_file']);
                    break;
            }
        }

        return $content_list;
    }

    public function getMediaId($type, $url)
    {
        $file_name = basename($url);
        $model = Material::builder($this->business_id)
            ->where([
                'type' => $type,
                'file_name' => $file_name
            ])
            ->first();

        if ($model and (time() - $model->updated_at < 60 * 60 * 24 * 3)) {
            return $model->media_id;
        }

        switch ($type) {
            case 'image':
                $res = $this->agent_app->media->uploadImage($url);
                break;
            case 'video':
                $res = $this->agent_app->media->uploadVideo($url);
                break;
            case 'file':
                $res = $this->agent_app->media->uploadFile($url);
                break;
        }

        if (!is_array($res)) {
            $res = json_decode($res, true);
        }

        if ($res['errcode'] === 0) {
            if (!$model) {
                $model = new Material();
            }
            $data = [
                'uniacid' => \YunShop::app()->uniacid,
                'business_id' => $this->business_id,
                'type' => $type,
                'file_name' => $file_name,
                'file_url' => $url,
                'media_id' => $res['media_id'],
                'updated_at' => time()
            ];
            $model->fill($data);
            if ($model->save()) {
                return $res['media_id'];
            } else {
                \Log::debug('media_id保存失败', ['uniacid' => $data['uniacid'], 'business_id' => $data['business_id'], 'type' => $type, 'file_name' => $file_name, 'media_id' => $res['media_id']]);
                throw new \Exception('media_id保存失败');
            }
        } else {
            \Log::debug('素材上传失败,' . $res['errmsg'], ['uniacid' => \YunShop::app()->uniacid, 'business_id' => $this->business_id, 'type' => $type, 'file_name' => $file_name]);
            throw new \Exception('media_id获取失败');
        }
    }
}