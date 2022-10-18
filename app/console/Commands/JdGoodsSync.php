<?php

namespace app\Console\Commands;



use app\common\models\Goods;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Console\Command;
use Yunshop\JdSupply\models\JdGoods;
use Yunshop\JdSupply\services\YsService;
use Yunshop\Overseas\config\Overseas;
use Yunshop\YsSystem\models\YsGoods;

class JdGoodsSync extends Command
{
    use \Illuminate\Foundation\Bus\DispatchesJobs;

    protected $signature = 'jd:goods-sync {uniacid}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '供应链商品同步crm';


    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $uniacid = $this->argument('uniacid');
        \YunShop::app()->uniacid = \Setting::$uniqueAccountId = $uniacid;
        $i = 0;
        $bar = $this->output->createProgressBar(JdGoods::query()->count());
        $jdGoodsCollection = JdGoods::query()->select();
        $jdGoodsCollection->each(function(JdGoods $jdGoods)use(&$i,$bar){
            $goods = Goods::find($jdGoods->goods_id);
            YsService::commodityEdit($goods);
            \Log::debug('jdGoodsSync::',$i);
            $i++;
            $bar->advance();
            usleep(1000);
        });
//        $bar = $this->output->createProgressBar(JdGoods::query()->count());
//        JdGoods::query()->chunkById(10, function(Collection $jdGoodsCollection)use(&$i,$bar){
//            $jdGoodsCollection->each(function(JdGoods $jdGoods)use(&$i,$bar){
//                $goods = Goods::find($jdGoods->goods_id);
//                YsService::commodityEdit($goods);
//                \Log::debug('jdGoodsSync::',$i);
//                $i++;
//                $bar->advance();
//            });
//        });
        $bar->finish();
        echo '同步完成，共'.$i.'条'."\n";
    }

}
