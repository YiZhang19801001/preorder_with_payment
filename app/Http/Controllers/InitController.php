<?php

namespace App\Http\Controllers;

use App\TableLink;
use DateTime;
use DateTimeZone;

class InitController extends Controller
{
    public function index($lang)
    {
        /**create config file */
        //$language_id = config("app.lang");

        $language_id = $lang != "null" ? $lang : config("app.default_language");

        /** mapping values for app_conf */

        switch ($language_id) {
            case 2:
                $app_conf = \Config::get('language_en');
                break;

            case 1:
                $app_conf = \Config::get('language_cn');
                break;

            default:
                $app_conf = \Config::get('language_en');
                break;
        }

        $app_conf["show_option"] = config("app.show_options");
        $app_conf["preorder"] = config("app.perorder");
        $app_conf["QrCodeImage"] = config("app.QrCodeImage");
        $app_conf["QrImageUrl"] = config("app.QrImageUrl");
        $app_conf["lang"] = $language_id;
        $app_conf["countLanguage"] = config("app.countLanguage");
        $app_conf['withPayment'] = config("app.withPayment");

        /**payments */

        $app_conf["version"] = config("app.version");
        $app_conf["mchNo"] = config("app.mchNo");
        $app_conf["storeNo"] = config("app.storeNo");
        $app_conf["payWay"] = config("app.payWay");
        $app_conf["currency"] = config("app.currency");
        $app_conf["notifyUrl"] = config("app.notifyUrl");
        $app_conf["returnUrl"] = config("app.returnUrl");
        $app_conf["item"] = config("app.item");
        $app_conf["params"] = config("app.params");

        /**return app_conf to client side */
        return response()->json([
            "app_conf" => $app_conf,
            "userId" => uniqid(),
        ], 200);
    }

    public function makeNewTableOrderUrl()
    {
        $tableId = "A02";
        $orderId = "2151";

        $v = "abc";

        //reformat today's date
        $tz = 'Australia/Sydney';

        $today = new DateTime("now", new DateTimeZone($tz));
        $time_today = $today->format('Ymd');

        $targetOrder = TableLink::where('validation', 'abc')->first();
        $targetOrder->link_generate_time = $time_today;
        $targetOrder->save();
        //sample url: http: //localhost:8181/table/public/table/A02/orderid/2147?cdt=20181221&v=abc

        return "http://kidsnparty.com.au/table4/public/table/{$tableId}/orderid/{$orderId}?cdt={$time_today}&v=abc";

    }
}
