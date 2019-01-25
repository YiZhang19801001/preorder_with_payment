<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class testController extends Controller
{
    public function changeConfigValue($mode)
    {
        $basePath = getcwd();
        $path = $basePath . "/css/app.css";
        if ($mode === 'light') {
            $pathCopyFrom = $basePath . "/css/app_light.css";

        } else if ($mode === 'dark') {

            $pathCopyFrom = $basePath . "/css/app_dark.css";
        }

        // file_put_contents(
        //     $path, str_replace(
        //         "'show_options' => " . var_export(\Config::get('custom.show_options'), true),
        //         "'show_options' => " . var_export($bool, true),
        //         file_get_contents($path)
        //     )
        // );

        file_put_contents($path, file_get_contents($pathCopyFrom));

        // $value = file_get_contents($path);

        /**return to client side */
        return response()->json(['message' => 'theme changed to ' . $mode . ' !'], 200);
    }
	
	public function changeText(Request $request)
    {
        $path_cn = "/home1/ozwearug/public_html/kidsnpartycom/table4/config/language_cn.php";
        $path_en = "/home1/ozwearug/public_html/kidsnpartycom/table4/config/language_en.php";
        //var_export($bool, true) how to read boolean as boolean
        file_put_contents(
            $path_cn, str_replace(
                "'preorder_title' => " . "'" . \Config::get('language_cn.preorder_title') . "'",
                "'preorder_title' => " . "'" . $request->preorder_title_cn . "'",
                file_get_contents($path_cn)
            )
        );
        file_put_contents(
            $path_en, str_replace(
                "'preorder_title' => " . "'" . \Config::get('language_en.preorder_title') . "'",
                "'preorder_title' => " . "'" . $request->preorder_title_en . "'",
                file_get_contents($path_en)
            )
        );

        $language_cn = \Config::get('language_cn.preorder_title');
        $language_en = \Config::get('language_en.preorder_title');
        return response()->json(['message' => "perorder title change to [cn:$language_cn,en:$language_en]"]);
    }
}
