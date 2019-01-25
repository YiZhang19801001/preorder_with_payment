<?php

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
 */

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

// get app configuration data
Route::get('init/{lang}', 'InitController@index');

//list the categories
Route::get('categories/{lang}', 'CategoryController@index');
Route::get('products/{lang}', 'ProductController@index');
// Todo: add order, MUST announce Server
//Route::post('order','OrderController@create');

Route::post('initcart', 'OrderController@getCart');
Route::post('orderitem', 'OrderController@post');
Route::post('opentable', 'OrderController@create');
Route::post('increase', 'OrderController@increase');
Route::post('decrease', 'OrderController@decrease');
Route::post('confirm', 'OrderController@confirmOrder');
Route::post('test', 'HomeController@testBroadcast');
Route::post('updateorderlist', 'OrderController@update');
Route::post('mysql', 'MySqlController@index');

Route::get('geturl', 'InitController@makeNewTableOrderUrl');

Route::get('test/{mode}', 'testController@changeConfigValue');
Route::post('language', 'testController@changeText');
Route::post('translate', 'ShopcartController@translatePreorderList');

Route::post('payment', 'PaymentNotifyController@receive');
Route::get('payment', 'PaymentNotifyController@get');
