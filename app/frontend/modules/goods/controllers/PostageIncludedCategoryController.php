<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/11/22
 * Time: 11:37
 */

namespace app\frontend\modules\goods\controllers;

use app\common\components\ApiController;
use app\common\models\Goods;
use app\common\models\goods\PostageIncludedCategory;

class PostageIncludedCategoryController extends ApiController
{
    public function index()
    {
        request()->offsetSet('is_display', 1);
        $categories = PostageIncludedCategory::records()->get();
        
        return $this->successJson('ok', $categories);

    }

    public function goods()
    {
        $sort_array = ['id', 'price', 'discount'];
        $sort = request()->input('sort');

        if (!in_array($sort, $sort_array)) {
            $sort = 'id';
        }

        $goods = PostageIncludedCategory::find(request()->input('category_id'))->goodsSort($sort);

        foreach ($goods->items() as $goodsModel) {
            $goodsModel->thumb = yz_tomedia($goodsModel->thumb);
        }

        return $this->successJson('ok', $goods);
    }
}