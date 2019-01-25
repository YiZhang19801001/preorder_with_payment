<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderExt extends Model
{
    protected $table = "oc_order_ext";
    protected $primaryKey = "order_ext_id";
    public $timestamps = false;
}
