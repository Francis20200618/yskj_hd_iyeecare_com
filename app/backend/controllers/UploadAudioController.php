<?php
/**
 * Created by PhpStorm.
 * User: weifeng
 * Date: 2019-07-19
 * Time: 13:57
 */

namespace app\backend\controllers;

use app\common\components\BaseController;
use app\common\services\upload\UploadService;

class UploadAudioController extends BaseController
{
    public function uploadAudio()
    {
        $attach = request()->attach;
        $ingress = request()->ingress;
        $file = request()->file('file');
        $local_upload = request()->local_upload == 1 ? true : false;
        $upload_type = request()->upload_type;

        if (!$file) {
            return $this->errorJson('请传入正确参数.');
        }
        if (!$file->isValid()) {
            return $this->errorJson('上传失败.');
        }
        if ($local_upload) {
            $url_arr = (new UploadService())->upload($file, $upload_type, '', '',false);
        } else {
            $url_arr = (new UploadService())->upload($file, $upload_type);
        }
        return $this->successJson('上传成功', [
            'audio' => $url_arr['relative_path'],
            'audio_url' => $url_arr['absolute_path'],
            'attach' => $attach,
        ]);
    }
}