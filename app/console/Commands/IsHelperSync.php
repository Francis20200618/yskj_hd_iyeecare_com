<?php

namespace app\Console\Commands;



use app\common\models\Comment;
use app\common\models\MemberAddress;
use app\common\models\YzMemberAddress;
use Illuminate\Console\Command;
use Yunshop\YsSystem\models\YsHelpEditData;

class IsHelperSync extends Command
{
    protected $signature = 'fix:is-helper-sync';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '同步是否是助手评价';

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        \YunShop::app()->uniacid = \Setting::$uniqueAccountId = 1;
        $bar = $this->output->createProgressBar(YsHelpEditData::where('plugin_type','goods-comment')->where('status',1)->count());
        YsHelpEditData::where('plugin_type','goods-comment')->where('status',1)->chunkById(100, function(\Illuminate\Support\Collection $collection) use($bar) {
            $collection->each(function (YsHelpEditData $ysHelpEditData)  use($bar) {
                $comment = Comment::where('uid', $ysHelpEditData['member_id'])->where('type', 1)->where('order_id', $ysHelpEditData->content['order_id'])->where('order_goods_id',$ysHelpEditData->content['order_goods_id'])->first();
                if ($comment) {
                    $comment->is_helper = 1;
                    $comment->save();
                }
                $bar->advance();
            });
        });
        $bar->finish();
        echo '同步完成'."\n";
    }

}
