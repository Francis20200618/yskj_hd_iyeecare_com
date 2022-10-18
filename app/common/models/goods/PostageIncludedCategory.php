<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/11/22
 * Time: 09:09
 */

namespace app\common\models\goods;

use app\common\models\BaseModel;
use app\common\models\Goods;

/**
 * @method records() as scopeRecords;
 */
class PostageIncludedCategory extends BaseModel
{
    protected $table = 'yz_postage_included_category';
    protected $fillable = ['uniacid', 'sort', 'name', 'is_display'];


    /**
     * @param $query
     * @return mixed
     */
    public function scopeRecords($query)
    {
        $query->uniacid()->select('id', 'sort', 'name', 'is_display');

        if (request()->get('name')) {
            $query->where('name', 'like', '%' . request()->get('name') . '%');
        }

        if (request()->get('is_display') || request()->get('is_display') === 0) {
            $query->where('is_display', request()->get('is_display'));
        }

        $query->orderBy('sort', 'desc');
        return $query;
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function hasManyGoods()
    {
        return $this->belongsToMany(Goods::class, 'yz_postage_included_category_goods', 'postage_included_category_id', 'goods_id');
    }

    public function getGoodsAttribute()
    {
        $goods = $this->hasManyGoods()->paginate();
        foreach ($goods->items() as $model) {
            $model->thumb = yz_tomedia($model->thumb);
        }
        return $goods;
    }

    public function goodsSort($sort)
    {
        $goodsBuild = $this->hasManyGoods()->where('status', 1);

        switch ($sort) {
            case 'price':
                return $goodsBuild->orderBy('price')->paginate();
            case 'discount':
                return $goodsBuild->selectRaw('*, `market_price` - `price` as discount')->orderBy('discount', 'desc')->paginate();
            default:
                return $goodsBuild->orderBy('display_order', 'desc')->paginate();
        }

    }
}