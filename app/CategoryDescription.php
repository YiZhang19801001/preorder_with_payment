<?php

namespace App;

use App\Category;
use Illuminate\Database\Eloquent\Model;

class CategoryDescription extends Model
{
    //
    protected $table = "oc_category_description";
    public function category()
    {
        return $this->belongsTo('App\Category', 'category_id', 'category_id');
    }

}
