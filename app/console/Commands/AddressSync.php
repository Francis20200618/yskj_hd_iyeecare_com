<?php

namespace app\Console\Commands;



use app\common\models\MemberAddress;
use app\common\models\YzMemberAddress;
use Illuminate\Console\Command;

class AddressSync extends Command
{
    protected $signature = 'fix:address-sync';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '邮寄地址同步，将带街道的地址到不带街道的地址';

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
        YzMemberAddress::query()->chunkById(100, function(\Illuminate\Support\Collection $collection) use($bar) {
            $collection->each(function (YzMemberAddress $yzMemberAddress)  use($bar) {
                $memberAddress = new MemberAddress();
                $memberAddress->uniacid = $yzMemberAddress->uniacid;
                $memberAddress->uid = $yzMemberAddress->uid;
                $memberAddress->username = $yzMemberAddress->username;
                $memberAddress->mobile = $yzMemberAddress->mobile;
                $memberAddress->province = $yzMemberAddress->province;
                $memberAddress->city = $yzMemberAddress->city;
                $memberAddress->district = $yzMemberAddress->district;
                $memberAddress->zipcode = $yzMemberAddress->zipcode;
                $memberAddress->address = $yzMemberAddress->street . $yzMemberAddress->address;
                $memberAddress->longitude = $yzMemberAddress->longitude;
                $memberAddress->latitude = $yzMemberAddress->latitude;
                $memberAddress->save();
                $bar++;
                $bar->advance();
            });
        });
        $bar->finish();
        echo '同步完成，共'.$i.'条'."\n";
    }

}
