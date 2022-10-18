<?php

namespace app\Console\Commands;



use app\common\models\MemberAddress;
use app\common\models\YzMemberAddress;
use Illuminate\Console\Command;
use Yunshop\Overseas\models\YsMemberCertified;

class Cert extends Command
{
    protected $signature = 'fix:cert';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '更新认证信息中的小写字母成大写';

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
        $i = 0;
        $bar = $this->output->createProgressBar(YzMemberAddress::query()->count());
        YsMemberCertified::query()->chunkById(100, function(\Illuminate\Support\Collection $collection) use($bar) {
            $collection->each(function (YsMemberCertified $yzMemberAddress)  use($bar) {
                $yzMemberAddress->idcard = strtoupper($yzMemberAddress->idcard);
                $yzMemberAddress->save();
                $bar++;
                $bar->advance();
            });
        });
        $bar->finish();
        echo '更新完成，共'.$i.'条'."\n";
    }

}
