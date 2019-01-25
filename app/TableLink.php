<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TableLink extends Model
{
    protected $table = "oc_table_link";
    protected $primaryKey = "link_id";
    public $timestamps = false;
}
