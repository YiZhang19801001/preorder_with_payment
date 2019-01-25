<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PaymentController extends Controller
{
    public function __construct()
    {
    /** PayPal api context **/
        $paypal_conf = \Config::get('paypal');
        $this->_api_context = new ApiContext(new OAuthTokenCredential(
            $paypal_conf['client_id'],
            $paypal_conf['secret'])
        );
        $this->_api_context->setConfig($paypal_conf['settings']);
    }

    public function payWithpaypal(Request $request)
    {
        /**terminology like Payer, Item is all from the PayPal SDK */

        /**$payer: A resource representing a Payer that funds a payment For PayPal account payments, set payment method to ‘paypal’. */
        $payer = new Payer();
        $payer->setPaymentMethod('paypal');

        /**Item information
         * (Optional) Lets you specify item wise information
        */
        $item_1 = new Item();
        $item_1->setName('Item 1') /** item name **/
                    ->setCurrency('USD')
                    ->setQuantity(1)
                    ->setPrice($request->get('amount')); /** unit price **/
        $item_list = new ItemList();
                $item_list->setItems(array($item_1));

        /**Amount
         * Lets you specify a payment amount. You can also specify additional details such as shipping, tax.
         */
        $amount = new Amount();
                $amount->setCurrency('USD')
                    ->setTotal($request->get('amount'));

        /**Transaction
         * A transaction defines the contract of a payment — what is the payment for and who is fulfilling it.
         */
        $transaction = new Transaction();
                $transaction->setAmount($amount)
                    ->setItemList($item_list)
                    ->setDescription('Your transaction description');

        /**Redirect URLs
         * Set the URLs that the buyer must be redirected to after payment approval/ cancellation.
         */
        $redirect_urls = new RedirectUrls();
                $redirect_urls->setReturnUrl(URL::route('status')) /** Specify return URL **/
                    ->setCancelUrl(URL::route('status'));

        /**Payment
         * A Payment Resource; create one using the above types and intent set to ‘sale’
         */
        $payment = new Payment();
                $payment->setIntent('Sale')
                    ->setPayer($payer)
                    ->setRedirectUrls($redirect_urls)
                    ->setTransactions(array($transaction));
                /** dd($payment->create($this->_api_context));exit; **/
                try {
                    /**Create Payment
                     * Create a payment by calling the ‘create’ method passing it a valid apiContext.
                     * (See bootstrap.php for more on ApiContext) The return object contains the state and the URL to which the buyer must be redirected to for payment approval
                    */
                        $payment->create($this->_api_context);
                    }
                catch (\PayPal\Exception\PPConnectionException $ex)
                {
                    if (\Config::get('app.debug')) {
                    \Session::put('error', 'Connection timeout');
                                    return Redirect::route('paywithpaypal');
                    } else {
                    \Session::put('error', 'Some error occur, sorry for inconvenient');
                                    return Redirect::route('paywithpaypal');
                    }
                }
        foreach ($payment->getLinks() as $link)
        {
            if ($link->getRel() == 'approval_url') {
            $redirect_url = $link->getHref();
                            break;
            }
        }
        /** add payment ID to session **/
                Session::put('paypal_payment_id', $payment->getId());
        if (isset($redirect_url)) {
        /** redirect to paypal **/
                    return Redirect::away($redirect_url);
        }
        \Session::put('error', 'Unknown error occurred');
                return Redirect::route('paywithpaypal');
    }
}
