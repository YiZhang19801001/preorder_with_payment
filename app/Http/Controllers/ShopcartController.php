<?php

namespace App\Http\Controllers;

use App\Product;
use App\ProductAddType;
use App\ProductDescription;
use App\ProductExt;
use Illuminate\Http\Request;

class ShopcartController extends Controller
{
    /**
     * translate preorder list into certain language when uer switch app language
     * @param Request {orderList:[]}
     * @return Response {orderList:[]}
     */
    public function translatePreorderList(Request $request)
    {
        // 1. dry the order list
        $dryList = $this->dryOrderList($request->orderList);
        // 2. add order list with new language
        $newList = $this->fillOrderList($dryList, $request->lang);
        // 3. return new order list to client side
        return response()->json(['orderList' => $newList]);
    }
    /**
     * transform order list into dry version (only barcode and id remain in the object)
     * @param Array order list
     * @return Array dry order list
     */
    private function dryOrderList($list)
    {
        $dryList = [];
        foreach ($list as $new_item) {

            $new_item_choices = [];
            foreach ($new_item['item']['choices'] as $choicesItem) {
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
            array_push($dryList, ['item' => array('product_id' => $new_item['item']['product_id'], 'choices' => $new_item_choices), 'quantity' => $new_item['quantity']]);
        }
        return $dryList;
    }

    /**
     * transform order list with fill up details in new lang
     * @param Array dry order list
     * @param int $lang 1 => cn 2 => en
     * @return Array new order list with details
     */
    private function fillOrderList($list, $lang)
    {
        $newList = array();

        foreach ($list as $ele) {
            $ele['item'] = $this->getProduct($ele['item']['product_id'], $ele['item']['choices'], $lang);
            array_push($newList, $ele);
        }

        return $newList;
    }

    /**
     * fill details for single product
     * @param int product_id
     * @param Array choices
     * @param int language code
     * @return Object product
     */
    private function getProduct($id, $choicesArr, $lang)
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
            $new_product["choices"] = $this->getChoicesHelper($id, $lang, $choicesArr);
            $new_product["options"] = [];
        }

        return $new_product;
    }

    /**
     * fill choice details for choices array
     * @param int id
     * @param int language code
     * @param Array choices
     * @return Array choices with details
     */

    private function getChoicesHelper($id, $lang, $choicesArr)
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
                if ($lang == "1" || $lang === null) {
                    $choices_item["name"] = $choice_to_type["name"];

                } else {
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

            if ($choicesArr !== null) {
                foreach ($choicesArr as $choiceItem) {
                    $choiceItem = json_decode(json_encode($choiceItem));
                    if ($choiceItem->type_id == $typeId_to_product->type && $choiceItem->pickedChoice !== null) {
                        foreach ($choiceItem->pickedChoice as $product_ext_id) {
                            $dbRow = ProductExt::where('product_ext_id', $product_ext_id)->first();
                            $pcWithDetails = array();
                            $pcWithDetails['product_ext_id'] = $product_ext_id;
                            if ($lang === "1" || $lang === null) {
                                $pcWithDetails['name'] = $dbRow['name'];
                            } else {
                                $pcWithDetails['name'] = $dbRow['name_2'];

                            }

                            $pcWithDetails['price'] = $dbRow['price'];
                            $pcWithDetails['barcode'] = $dbRow['barcode'];
                            $pcWithDetails["image"] = "default_taste.png";

                            array_push($pickChoicesInReturnItem, $pcWithDetails);
                        }
                    }
                }
            }

            /**map value */
            $new_choice["type_id"] = $typeId_to_product["type"];
            $new_choice["type"] = $choice["name"];
            $new_choice["choices"] = $choices;
            $new_choice["pickedChoice"] = $pickChoicesInReturnItem;

            array_push($choices_groupby_type, $new_choice);
        }

        return $choices_groupby_type;
    }

}
