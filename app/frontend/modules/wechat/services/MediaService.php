<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/1/7
 * Time: 11:55
 */

namespace app\frontend\modules\wechat\services;

use app\common\models\AccountWechats;
use app\platform\modules\system\models\SystemSetting;

class MediaService
{
    private $mediaId;
    private $plugin;
    private $uploadPath;
    private $remote;

    public function __set($name,$value)
    {
        $this->$name = $value;
    }

    private function easyWechat()
    {
        return \app\common\facades\EasyWeChat::officialAccount($this->wechatConfig());
    }

    /**
     * 获取公众号的 appID 和 appsecret
     * @return array
     */
    private function wechatConfig()
    {
        $account = AccountWechats::getAccountByUniacid(\YunShop::app()->uniacid);
        $options = [
            'app_id'  => $account->key,
            'secret'  => $account->secret,
        ];
        return $options;
    }

    /**
     * 获取临时素材并上传本地
     * @return array
     */
    public function getTemporaryFile()
    {
        try {
            if (!$this->mediaId) {
                throw new \Exception('媒体ID参数错误');
            }
            $filename = md5($this->mediaId) . '_' . \YunShop::app()->uniacid;

            $stream = $this->easyWechat()->media->get($this->mediaId);

            if (!$stream instanceof \EasyWeChat\Kernel\Http\StreamResponse) {
                throw new \Exception('资源错误');
            }

            $filename = $stream->saveAs($this->uploadPath(), $filename);
            $this->remoteUpload($filename);
            return ['code' => 0 ,'file' => $this->filePath($filename)];
        } catch (\GuzzleHttp\Exception\GuzzleException $e) {
            return ['code' => 1 ,'message' => $e->getMessage()];
        } catch (\Exception $e) {
            return ['code' => 1 ,'message' => $e->getMessage()];
        }
    }

    /**
     * 获取 JSSDK 上传的高清语音
     * @return array
     */
    public function getJsSdkMedia()
    {
        try {
            if (!$this->mediaId) {
                throw new \Exception('媒体ID参数错误');
            }
            $filename = md5($this->mediaId) . '_' . \YunShop::app()->uniacid.'.speex';

            $stream = $this->easyWechat()->media->getJssdkMedia($this->mediaId);
            if (!$stream instanceof \EasyWeChat\Kernel\Http\StreamResponse) {
                throw new \Exception('资源错误');
            }
            $filename = $stream->saveAs($this->uploadPath(), $filename);
            $this->remoteUpload($filename);
            return ['code' => 0 ,'file' => $this->filePath($filename)];
        } catch (\GuzzleHttp\Exception\GuzzleException $e) {
            return ['code' => 1 ,'message' => $e->getMessage()];
        } catch (\Exception $e) {
            return ['code' => 1 ,'message' => $e->getMessage()];
        }
    }

    private function uploadPath()
    {
        $this->plugin = $this->plugin?str_replace('-','_',$this->plugin):'shop';
        if (!isset($this->uploadPath)) {
            if ($this->getRemote()['type'] != 0) {
                if (config('app.framework') == 'platform') {
                    $this->uploadPath = base_path('static/upload/'.$this->plugin);
                } else  {
                    $this->uploadPath = dirname(dirname(base_path())).'/attachment/'.$this->plugin;
                }
            } else {
                $this->uploadPath = storage_path('app/public/'.$this->plugin);
            }
        }
        return $this->uploadPath;
    }

    private function filePath($filename)
    {
        $newPath = $this->uploadPath() . '/' . $filename;
        return [
            'file' => $newPath,
            'file_url' => yz_tomedia($newPath)
        ];
    }

    private function remoteUpload($filename)
    {
        $file_path  = $this->uploadPath() . '/' . $filename;
        if ($this->getRemote()['type'] != 0) {
            if (config('app.framework') == 'platform') {
                file_remote_upload($file_path, true, $this->getRemote());
            } else  {
                file_remote_upload_wq($file_path, true, $this->getRemote());
            }
        }
    }

    private function getRemote()
    {
        if (!isset($this->remote)) {
            if (config('app.framework') == 'platform') {
                $this->remote = SystemSetting::settingLoad('remote', 'system_remote');
            } else {
                //全局配置
                global $_W;

                //公众号独立配置信息 优先使用公众号独立配置
                $uni_setting = app('WqUniSetting')->get()->toArray();
                if (!empty($uni_setting['remote']) && iunserializer($uni_setting['remote'])['type'] != 0) {
                    $setting['remote'] = iunserializer($uni_setting['remote']);
                    $this->remote = $setting['remote'];
                } else {
                    $this->remote = $_W['setting']['remote'];
                }
            }
        }
        return $this->remote;
    }
}