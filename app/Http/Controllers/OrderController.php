<?php

namespace App\Http\Controllers;

use App\Events\ConfirmOrder;
use App\Events\UpdateOrder;
use App\Order;
use App\OrderExt;
use App\OrderHistory;
use App\OrderOption;
use App\OrderProduct;
use App\OrderTableLinksub;
use App\OrderTotal;
use App\Product;
use App\ProductAddType;
use App\ProductDescription;
use App\TableLink;
use App\TempOrder;
use App\TempOrderItem;
use App\TempPickedChoice;
use App\TempPickedOption;
use DateTime;
use DateTimeZone;
use Illuminate\Http\Request;
use App\ProductExt;



class OrderController extends Controller
{
    public function __construct()
    {
    }

    /** Todo:
     * 1. save orderList to database table
     * 2. create broadcast
     * 3. get newest order list
     * */

    public function post(Request $request)
    {
        $mode = config('app.show_options');
        $new_item = $request->orderItem;
        $orderRow = TempOrder::where('id', $request->orderId)->first();
        //return $orderRow->order_list_string;
        $order_list_string = $orderRow->order_list_string;
        // if $order_list_string is null or empty add straight away
        if ($order_list_string === "[]") {
            $newOrderItem = ['item' => $request->orderItem, 'quantity' => 1];
            $orderRow->order_list_string = '[' . json_encode($newOrderItem) . ']';
        } else {
            $flag = false;
            $orderObject = json_decode($order_list_string);
            foreach ($orderObject as $orderItem) {
                // return response()->json($orderItem);
                if ($orderItem->item->product_id === $new_item["product_id"]) {
                    $flag = true;
                    if (count($orderItem->item->options) > 0) {
                        for ($i = 0; $i < count($orderItem->item->options) - 1; $i++) {
                            if ($orderItem->item->options[i]["pickedOption"] !== $new_item["options"][i]["pickedOption"]) {
                                $flag = false;
                                break;
                            }
                        }

                    }

                    if ($flag === false || count($orderItem->item->choices) < 1) {
                        break;
                    } else {
                        for ($i = 0; $i < count($orderItem->item->choices) - 1; $i++) {
                            if ($orderItem->item->choices[i]["pickedChoice"] !== $new_item["choices"][i]["pickedChoice"]) {
                                $flag = false;
                                break;
                            }
                        }

                    }
                }
                if ($flag) {
                    $orderItem->quantity++;
                    $orderRow->order_list_string = json_encode($orderObject);

                    break;
                }
            }
            if (!$flag) {
                array_push($orderObject, array('item' => $new_item, 'quantity' => 1));
                $orderRow->order_list_string = json_encode($orderObject);

            }
        }

        $orderRow->save();
        broadcast(new UpdateOrder($request->orderId, $request->orderItem, $request->userId));
        return response()->json(json_decode($orderRow->order_list_string));
    }

    /** fetch the up to date order list once */
    public function getCart(Request $request)
    {
        /**validate users */
        //check if this QRcode contain all infos with correct format
        if ($request->cdt == null || $request->v == null) {
            return response()->json(["message" => "this QR Code is invalid, please contact staff!"], 400);
        }



        //mapping value for further valided
        $cdt = $request->cdt;
        $v = $request->v;

        //check if this QRcode valid in DB
        $new_table_link = TableLink::where('validation', $v)->first();

        
        $tz = 'Australia/Sydney';

        //reformat income time
        $time = strtotime($cdt);
        $day = date('y-m-d', $time);

        //reformat today's date
        $today = new DateTime("now", new DateTimeZone($tz));
        $time_today = $today->format('y-m-d');

        //return array('cdt' => $day, 'db' => $day_in_db, 'today' => $time_today);
        //check matched or not
        if ($day < $time_today) {
            return response()->json(["message" => "this QR Code is expired, please contact staff!"], 400);

        } else if ($day == $time_today) {
            if($new_table_link===null || $new_table_link->status!=0)
            {

                return response()->json(["message" => "this QR Code is not found, please try it later or contact staff!"], 400);
            }
            else if($new_table_link!==null && $new_table_link->status==0)
            {
                //reformat time in DB
                $time_in_db = strtotime($new_table_link->link_generate_time);
                $day_in_db = date('y-m-d', $time_in_db);
                if($day_in_db!=$day){
                    return response()->json(["message" => "this QR Code is invalid, please contact staff!"], 400);

                }
            }
        } else {
            return response()->json(["message" => "this QR Code is invalid, please contact staff!"], 400);

        }
        /**end validation */

        $list = $this->fetchOrderListHelper($request->order_id,$request->table_id,$request->lang);
        return response()->json($list);
    }

    public function fetchOrderListHelper($order_id, $table_id, $lang)
    {

        $order = TempOrder::where('id', $order_id)->first();
        if ($order === null) {
            $order = new TempOrder;

            $order["id"] = $order_id;
            $order["table_number"] = $table_id;

            $order["order_list_string"] = json_encode(['pendingList' => [], 'historyList' => []]);
            $order->save();

            return array('pendingList' => [], 'historyList' => []);
        }
        else
        {
            $shortHistoryList = json_decode($order->order_list_string)->historyList;
            $shortPendingList = json_decode($order->order_list_string)->pendingList;

            return array('pendingList' => $this->extendsList($shortPendingList,$lang), 'historyList' => $this->extendsList($shortHistoryList,$lang));
        }
        
    }
    /**
     * add details for the dried orderlist
     * @param {array} $list ['product'=>int,'choices'=>array('type_id'=>int,'pickedChoice'=>array(int - product_ext_id)]
     */

    public function extendsList($list,$lang)
    {
        $newList = array();

        foreach ($list as $ele) {
            $ele->item = $this->getProduct($ele->item->product_id,$ele->item->choices,$lang);
            array_push($newList,$ele);
        }


        return $newList;
    }

    public function getProduct($id,$choicesArr,$lang)
    {
        // clear mode do not need details [1], full detail mode need everything. [9]*/
        $mode = config("app.show_options");

        //select target product in DB
        $target_product = ProductDescription::where('product_id', $id)->where('language_id', $lang)->first();
        if ($target_product === null) {
            $target_product = ProductDescription::where('product_id', $id)->first();
        }
        /** create price value*/
        //fetch price first
        $p = Product::where('product_id', $id)->first();
        $price = $p["price"];
        //cut after 2 digts decimal point, i.e 1.0000000 -> 1.00
        $posOfdecimal = strpos($price, ".");
        $length = $posOfdecimal + 3;
        $price = substr($price, 0, $length);
        /** end of create price value */

        //create product code value
        $upc = $p['upc'];

        //map values to product
        $new_product["product_id"] = $target_product->product_id;
        $new_product["name"] = $target_product->name;
        $new_product["price"] = $price;
        $new_product["upc"] = $upc;
        $new_product["description"] = $target_product->description;

        $image_path = '/table4/public/images/items/' . $p["image"];
        $new_product["image"] = "";
        if ($p["image"] === null || !file_exists($_SERVER['DOCUMENT_ROOT'] . $image_path)) {
            $new_product["image"] = 'default_product.jpg';
            // $new_product["image"] = '24.jpg';

        } else {

            $new_product["image"] = $p["image"];
        }

        //details only needed for show options mode
        if ($mode == 9) {
            $new_product["choices"] = $this->getChoicesHelper($id, $lang,$choicesArr);
            $new_product["options"] = [];
        }

        return $new_product;
    }

    public function getChoicesHelper($id, $lang,$choicesArr)
    {
        /**this is the returning result */
        $choices_groupby_type = array();

        /** find out all types for certain product */
        $typeIds_to_product = ProductExt::where('product_id', $id)->select('type')->distinct()->get(); //return array(obj)

        //Fix Lang:
        foreach ($typeIds_to_product as $typeId_to_product) {
            $choices = array();
            /**oc_product_add_type: [add_type_id:int] [name:string][type:bit][required:bit][checkbox:bit] */
            $choice = ProductAddType::where('add_type_id', $typeId_to_product->type)->first();
            /**oc_product_ext: [product_ext_id:int][product_id:int][type:int][name:string][price:float] */
            $choices_to_type = ProductExt::where('product_id', $id)->where('type', $choice["add_type_id"])->get();


            foreach ($choices_to_type as $choice_to_type) {
                $choices_item["product_ext_id"] = $choice_to_type["product_ext_id"];
                if ($lang == "1"||$lang===null) {
                    $choices_item["name"] = $choice_to_type["name"];

                } else{
                    $choices_item["name"] = $choice_to_type["name_2"];

                }
                $choices_item["price"] = $choice_to_type["price"];
                $choices_item["barcode"] = $choice_to_type["barcode"];
                $image_path = '/table4/public/images/items/' . $choice->image;
                $choices_item["image"] = "";
                if ($choice->image === null || !file_exists($_SERVER['DOCUMENT_ROOT'] . $image_path)) {
                    $choices_item["image"] = 'default_taste.png';
                    // $new_product["image"] = '24.jpg';

                } else {

                    $choices_item["image"] = $choice->image;
                }



                array_push($choices, $choices_item);
            }

            $pickChoicesInReturnItem = array();

            if($choicesArr!==null)
            {
                foreach ($choicesArr as $choiceItem) {
                    if($choiceItem->type_id==$typeId_to_product->type && $choiceItem->pickedChoice!==null)
                    {
                        foreach ($choiceItem->pickedChoice as $product_ext_id) {
                            $dbRow = ProductExt::where('product_ext_id',$product_ext_id)->first();
                            $pcWithDetails = array();
                            $pcWithDetails['product_ext_id'] = $product_ext_id;
                            if($lang==="1" || $lang===null)
                            {
                                $pcWithDetails['name'] = $dbRow['name'];
                            }
                            else
                            {
                                $pcWithDetails['name'] = $dbRow['name_2'];

                            }

                            $pcWithDetails['price'] = $dbRow['price'];
                            $pcWithDetails['barcode'] = $dbRow['barcode'];
                            $pcWithDetails["image"] = "default_taste.png";
                         
                            array_push($pickChoicesInReturnItem,$pcWithDetails);
                        }
                    }
                }
            }

            /**map value */
            $new_choice["type_id"] = $typeId_to_product["type"];
            $new_choice["type"] = $choice["name"];
            $new_choice["choices"] = $choices;
            $new_choice["pickedChoice"]=$pickChoicesInReturnItem;

            array_push($choices_groupby_type, $new_choice);
        }

        return $choices_groupby_type;
    }



    public function addDetailsForOrderListHelper($arr_order_items, $lang)
    {
        $order = [];
        /**if $arr_order_items is empty return empty array() */
        if (count($arr_order_items) < 1) {
            return $order;
        }

        //$lang = config('app.lang');
        $mode = config('app.show_options');
        /**if $arr_order_items is not empty, build the result array with details */
        /** order_item details need: [name][quantity][price] full detail mode only [ext][option]*/
        foreach ($arr_order_items as $order_item) {
            $new_orderList_ele = array();
            $targe_product = ProductDescription::where('product_id', $order_item["product_id"])->where('language_id', $lang)->first();
            /** if no chinese version row, return en version */
            if ($targe_product === null) {
                $targe_product = ProductDescription::where('product_id', $order_item["product_id"])->first();
            }
            $p = Product::where('product_id', $order_item["product_id"])->first();

            /**make price */
            //fetch price first
            $price = $p->price;
            $posOfdecimal = strpos($price, ".");
            //cut after 2 digts decimal point
            $length = $posOfdecimal + 3;
            $price = substr($price, 0, $length);
            /**END */

            //mapping values
            $new_orderList_ele["item"]["order_item_id"] = $order_item["id"];
            $new_orderList_ele["item"]["product_id"] = $order_item["product_id"];
            $new_orderList_ele["quantity"] = $order_item["quantity"];
            $new_orderList_ele["item"]["name"] = $targe_product["name"];
            $new_orderList_ele["item"]["price"] = $price;
            $new_orderList_ele["item"]["upc"] = $p->upc;
            $image_path = '/table4/public/images/items/' . $p->image;
            $new_orderList_ele["item"]["image"] = "";
            if ($p->image === null || !file_exists($_SERVER['DOCUMENT_ROOT'] . $image_path)) {
                $new_orderList_ele["item"]["image"] = 'default_product.jpg';

            } else {

                $new_orderList_ele["item"]["image"] = $p->image;
            }
            // $new_orderList_ele["item"]["image"] = $p->image === null ? 'default_product.jpg' : $p->image;
            /**append options & exts only needed when mode is show options */

            if ($mode) {
                //ToDo: add price for choice
                /**temp_pickedchoices
                 * [id:int(10)][order_item_id:int(11)][choice_type:varchar(255)][picked_Choice:varchar(255)]
                 */
                $pickedChoices = TempPickedChoice::where('order_item_id', $order_item["id"])->get();

                $productChoiceList = [];

                foreach ($pickedChoices as $pickChoice) {
                    $type = ProductAddType::where('name', $pickChoice["choice_type"])->first();

                    //$choices = Product_ext::where('type',$type->add_type_id)->get();

                    array_push($productChoiceList, array(
                        "type" => $type->name,
                        "pickedChoice" => $pickChoice["picked_Choice"],
                        "price" => $pickChoice["price"],
                        "product_ext_id" => $pickChoice["product_ext_id"]));
                }

                $new_orderList_ele["item"]["choices"] = $productChoiceList;

                /**grab all information for options */
                $pickedOptions = TempPickedOption::where('order_item_id', $order_item["id"])->get();

                $productOptionList = [];
                foreach ($pickedOptions as $pickOption) {
                    array_push($productOptionList, array(
                        "option_id" => $pickOption["option_id"],
                        "option_name" => $pickOption["option_name"],
                        "pickedOption" => $pickOption["pickedOption"],
                        "price" => $pickOption["price"],
                        "product_option_value_id" => $pickOption["product_option_value_id"],

                    ));
                }
                $new_orderList_ele["item"]["options"] = $productOptionList;
            }

            /**End */
            array_push($order, $new_orderList_ele);
        }
        return $order;
    }
    /**
     * create new order request will contain an object with info of an single order
     */
    public function create($order_id, $table_id)
    {
        //create new record in order table
        $order = new TempOrder;
        $order->table_number = $table_id;
        $order->id = $order_id;
        $order->save();

        //return
        return response()->json([
            "order" => $order,
        ], 200);

    }


    public function createOrderHelper($new_item, $orderId)
    {

        $mode = config('app.show_options');

        $new_order_item = new TempOrderItem;
        $new_order_item->quantity = 1;
        $new_order_item->product_id = $new_item["product_id"];
        $new_order_item->order_id = $orderId;
        $new_order_item->save();

        if (!$mode) {
            return; //if $mode is no show options, stop here!!
        }

        foreach ($new_item["choices"] as $choice) {
            $new_pickedChoice = new TempPickedChoice;

            $pickChoiceDecode = json_decode($choice["pickedChoice"]);

            $new_pickedChoice->product_ext_id = $pickChoiceDecode->product_ext_id;
            $new_pickedChoice->order_item_id = $new_order_item->id;
            $new_pickedChoice->choice_type = $choice["type"];
            $new_pickedChoice->picked_Choice = $pickChoiceDecode->name;
            $new_pickedChoice->price = $pickChoiceDecode->price;

            $new_pickedChoice->save();
        }

        foreach ($new_item["options"] as $option) {
            $new_pickedOption = new TempPickedOption;

            $new_pickedOption->order_item_id = $new_order_item->id;
            $new_pickedOption->product_option_value_id = $option["product_option_value_id"];
            $new_pickedOption->option_name = $option["option_name"];
            $new_pickedOption->pickedOption = $option["pickedOption"];
            $new_pickedOption->price = $option["price"];
            $new_pickedOption->product_id = $new_item["product_id"];
            $new_pickedOption->option_id = $option["option_id"]["option_id"];

            $new_pickedOption->save();
        }
    }

    public function confirmOrder(Request $request)
    {
        /**request is an array of  */
        //get new order
        $new_order = $this->createOcOrderHelper($request);
        $order_id = $new_order->id;

        $value = $new_order->total;
        //create record in oc_order_history
        $this->createOcOrderHistoryHelper($order_id);

        //create record in oc_order_total
        $this->createOrderTotalHelper($order_id, $value);

        //create record in oc_order_product
        $this->createOrderProductHelper($request->orderList, $order_id);

        
        //create record in oc_table_linksub
        $this->createOrderLinkSubHelper($new_order, $request->v);

        //update temp_order_item
        $returnHistoryList = $this->changeTempOrderItemsStatus($request->order_id, $request->orderList);
        broadcast(new UpdateOrder($request->order_id, null, $request->userId, 'update'));

        return response()->json(["historyList" => $this->extendsList($returnHistoryList,$request->lang)], 200);

    }

    public function changeTempOrderItemsStatus($id, $orderList)
    {

        $order = TempOrder::where('id', $id)->first();
        $orderArr = json_decode($order->order_list_string);
        $orderHistoryListArr = $orderArr->historyList;
        $dryOrderList = [];
        foreach ($orderList as $orderItem) {
            array_push($dryOrderList,json_decode(json_encode(['item'=>$this->dryOrderItem($orderItem['item']),'quantity'=>$orderItem['quantity']])));
        }
        $orderArr->historyList = array_merge($orderHistoryListArr, $dryOrderList);
        $orderArr->pendingList = [];
        $order->order_list_string = json_encode($orderArr);
        $order->save();

        return $orderArr->historyList;
    }

    public function createOrderLinkSubHelper($new_order, $v)
    {
        $new_order_linksub = new OrderTableLinksub;
        $new_order_linksub->sub_add_time = $new_order->date_added;
        $new_order_linksub->downloaded = 0;
        $new_order_linksub->order_id = $new_order->id;
        $new_order_linksub->sub_status = 1;

        $new_table_link = TableLink::where('validation', $v)->first();
        $new_order_linksub->link_id = $new_table_link->link_id;

        $new_order_linksub->save();
    }

    public function createOcOrderHelper($request)
    {
        $tz = 'Australia/Sydney';
        $timestamp = time();
        $dt = new DateTime("now", new DateTimeZone($tz)); //first argument "must" be a string
        $dt->setTimestamp($timestamp); //adjust the object to correct timestamp

        /**create order in oc_order */
        $new_order = new Order;
        $new_order->invoice_no = 0;
        $new_order->invoice_prefix = "INV-2013-00";
        $new_order->store_id = $request->store_id; //4
        $new_order->store_name = $request->store_name; //Monkey King Thai Restaurant
        $new_order->store_url = $request->store_url; //http://192.168.1.220/
        $new_order->customer_id = 0;
        $new_order->customer_group_id = 1;
        $new_order->firstname = " ";
        $new_order->lastname = " ";
        $new_order->email = "tableorder@order2.com";
        $new_order->telephone = " ";
        $new_order->fax = " ";
        $new_order->custom_field = " ";
        $new_order->payment_firstname = " ";
        $new_order->payment_lastname = " ";
        $new_order->payment_company = " ";
        $new_order->payment_address_1 = " ";
        $new_order->payment_address_2 = " ";
        $new_order->payment_city = " ";
        $new_order->payment_postcode = " ";
        $new_order->payment_country = " ";
        $new_order->payment_country_id = 0;
        $new_order->payment_state = " ";
        $new_order->payment_state_id = 0;
        $new_order->payment_suburb = " ";
        $new_order->payment_suburb_id = 0;
        $new_order->payment_address_format = " ";
        $new_order->payment_custom_field = " ";
        $new_order->payment_code = "cod";
        $new_order->payment_method = "DineIn";
        $new_order->shipping_firstname = " ";
        $new_order->shipping_lastname = " ";
        $new_order->shipping_email = "tableorder@order2.com";
        $new_order->shipping_telephone = " ";
        $new_order->shipping_company = " ";
        $new_order->shipping_address_1 = " ";
        $new_order->shipping_address_2 = " ";
        $new_order->shipping_city = " ";
        $new_order->shipping_postcode = " ";
        $new_order->shipping_country = " ";
        $new_order->shipping_country_id = 0;
        $new_order->shipping_state = " ";
        $new_order->shipping_state_id = 0;
        $new_order->shipping_suburb = " ";
        $new_order->shipping_suburb_id = 0;
        $new_order->shipping_address_format = " ";
        $new_order->shipping_custom_field = " ";
        $new_order->shipping_method = "DineIn";
        $new_order->shipping_orderTime = $dt->format('H:i');
        $new_order->shipping_orderDate = $dt->format("D, d M y");
        $new_order->shipping_orderWhen = "now";
        $new_order->shipping_code = " ";
        $new_order->comment = " ";
        $new_order->total = $request->total;
        $new_order->order_status_id = 1;
        $new_order->affiliate_id = 0;
        $new_order->commission = 0.0000;
        $new_order->marketing_id = 0;
        $new_order->tracking = " ";
        $new_order->language_id = 1;
        $new_order->currency_id = 4;
        $new_order->currency_code = "AUD";
        $new_order->currency_value = 1.000000;
        //Todo: fetch from request
        $new_order->ip = "192.168.1.220";
        $new_order->forwarded_ip = " ";
        //Todo: fetch from request
        $new_order->user_agent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36";
        //Todo: fetch from accept_language
        $new_order->accept_language = "en-GB,en-US;q=0.8,en;q=0.6";
        $new_order->date_added = $dt->format("y-m-d h:i:s");
        $new_order->date_modified = $dt->format("y-m-d h:i:s");

        //save to database
        $new_order->save();

        //return id
        return $new_order;
    }

    public function createOcOrderHistoryHelper($order_id)
    {
        $tz = 'Australia/Sydney';
        $timestamp = time();
        $dt = new DateTime("now", new DateTimeZone($tz)); //first argument "must" be a string
        $dt->setTimestamp($timestamp); //adjust the object to correct timestamp

        $new_order_history = new OrderHistory;
        $new_order_history->order_id = $order_id;
        $new_order_history->notify = 0;
        //Todo: read from new order??
        $new_order_history->order_status_id = 1;
        $new_order_history->comment = " ";
        $new_order_history->date_added = $dt->format("y-m-d h:i:s");

        $new_order_history->save();
    }

    public function createOrderTotalHelper($order_id, $value)
    {
        $new_order_total_1 = new OrderTotal;
        $new_order_total_1->order_id = $order_id;
        $new_order_total_1->code = "sub_total";
        $new_order_total_1->title = "Sub-Total";
        $new_order_total_1->value = $value;
        $new_order_total_1->sort_order = 1;
        $new_order_total_1->save();

        $new_order_total_2 = new OrderTotal;
        $new_order_total_2->order_id = $order_id;
        $new_order_total_2->code = "shipping";
        $new_order_total_2->title = "Dive-In";
        $new_order_total_2->value = $value;
        $new_order_total_2->sort_order = 3;
        $new_order_total_2->save();

        $new_order_total_3 = new OrderTotal;
        $new_order_total_3->order_id = $order_id;
        $new_order_total_3->code = "total";
        $new_order_total_3->title = "Total";
        $new_order_total_3->value = $value;
        $new_order_total_3->sort_order = 9;
        $new_order_total_3->save();
    }

    public function createOrderProductHelper($orderList, $order_id)
    {
        $arr_order_items = $orderList;

        foreach ($arr_order_items as $order_product) {
            $new_order_product = new OrderProduct;
            $new_order_product->order_id = $order_id;
            $new_order_product->product_id = $order_product["item"]["product_id"];
            $new_order_product->model = 1;
            $new_order_product->quantity = $order_product["quantity"];
            $new_order_product->name = $order_product["item"]["name"];
            $new_order_product->price = $order_product["item"]["price"];
            $new_order_product->total = $order_product["quantity"] * (float) $order_product["item"]["price"];
            $new_order_product->tax = 0;
            $new_order_product->reward = 0;

            $new_order_product->save();

            if (config('app.show_options')) {
                /**picked choices */
                foreach ($order_product["item"]["choices"] as $choice) {
                    
                    if($choice["pickedChoice"]!==null)
                    {
                    
                        foreach ($choice["pickedChoice"] as $pickedChoice) {
                            $new_order_ext = new OrderExt;
                            $new_order_ext->product_ext_id = $pickedChoice["product_ext_id"];
                            $new_order_ext->order_product_id = $new_order_product->id;
                            $new_order_ext->product_id = $order_product["item"]["product_id"];
                            $new_order_ext->save();
                        }
                       
                    }
                
                    // else
                    // {
                    //     $new_order_ext->product_ext_id = 9999;

                    //     $new_order_ext->order_product_id = $new_order_product->id;
                    //     $new_order_ext->product_id = $order_product["item"]["product_id"];

                    // }

                    
                }
                /**store picked options in DB*/
                // if(count($order_product["item"]["options"])>0){
                //     foreach ($order_product["item"]["options"] as $option) {
                //         die(json_encode($option));
                //         $new_order_option = new OrderOption;
                //         $new_order_option->order_id = $order_id;
                //         $new_order_option->order_product_id = $new_order_product->id;

                //         $new_order_option->product_option_id = $option["option_id"];

                //         $new_order_option->product_option_value_id = $option["product_option_value_id"];
                //         $new_order_option->name = $option["option_name"];
                //         $new_order_option->value = $option["pickedOption"];
                //         $new_order_option->type = "radio";

                //         $new_order_option->save();
                //     }

                // }
            }

        }
    }

  public function dryOrderItem($new_item)
    {

        $new_item_choices = [];
        foreach ($new_item['choices'] as $choicesItem) {
            $pickedChoicesArray = [];
            if ($choicesItem['pickedChoice'] !== null) {
                foreach ($choicesItem['pickedChoice'] as $pickedChoicesItem) {
                    array_push($pickedChoicesArray, $pickedChoicesItem['product_ext_id']);
                }
            }
            array_push($new_item_choices, array(
                'type_id' => $choicesItem['type_id'],
                'pickedChoice' => $pickedChoicesArray,
            ));
        }
        return array('product_id'=>$new_item['product_id'],'choices'=>$new_item_choices);
    }
    public function update(Request $request)
    {
        broadcast(new UpdateOrder($request->orderId, $request->orderItem, $request->userId, $request->action));
        $mode = config('app.show_options');
        $new_item = $this->dryOrderItem($request->orderItem);
        $orderRow = TempOrder::where('id', $request->orderId)->first();
        // if $order_list_string is null or empty add straight away
        if ($orderRow === null) {
            $orderRow = new TempOrder;
            $newOrderItem = ['item' => $new_item, 'quantity' => 1];
            $tempArr = array('pendingList' => [$newOrderItem], 'historyList' => []);
            $orderRow->order_list_string = json_encode($tempArr);
            $orderRow->id = $request->orderId;
            $orderRow->table_number = $request->tableId;
        } else {
            $flag = false;
            $order_list_string = $orderRow->order_list_string;
            $orderArr = json_decode($order_list_string);
            $orderObject = $orderArr->pendingList;
            foreach ($orderObject as $orderItem) {
                
                if ($orderItem->item->product_id === $new_item["product_id"]) {
                    $flag = true;
                    // if (count($orderItem->item->options) > 0) {
                    //     for ($i = 0; $i < count($orderItem->item->options) - 1; $i++) {
                    //         if ($orderItem->item->options[i]["pickedOption"] !== $new_item["options"][i]["pickedOption"]) {
                    //             $flag = false;
                    //             break;
                    //         }
                    //     }
                    // }
                    if ($flag === false || count($orderItem->item->choices) < 1) {
                        break;
                    } else {
                        for ($i = 0; $i < count($orderItem->item->choices); $i++) {
                            if ($orderItem->item->choices[$i]->pickedChoice != $new_item["choices"][$i]["pickedChoice"]) {
                                $flag = false;
                                break;
                            }
                        }
                    }
                }
                if ($flag) {
                    if ($request->action === 'add') {
                        $orderItem->quantity++;
                    } else if ($request->action === 'sub' && $orderItem->quantity > 1) {
                        $orderItem->quantity--;
                    } else if ($request->action === 'sub' && $orderItem->quantity <= 1) {
                        $index = array_search($orderItem, $orderObject);
                        array_splice($orderObject, $index, 1);
                    }
                    $orderArr->pendingList = $orderObject;
                    $orderRow->order_list_string = json_encode($orderArr);
                    break;
                }
            }
            if (!$flag && $request->action === 'add') {
                array_push($orderObject, array('item' => $new_item, 'quantity' => 1));
                $orderArr->pendingList = $orderObject;
                $orderRow->order_list_string = json_encode($orderArr);
            }
        }
        $orderRow->save();
    }

}
