<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderHistory extends Model
{
    protected $table = "oc_order_history";
    public $timestamps = false;
}
