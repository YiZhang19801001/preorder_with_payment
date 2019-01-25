<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use \App\ProductToCategory;

class Category extends Model
{
    //
    protected $table = "oc_category";
    protected $primaryKey = "category_id";

    /**
     * relationship with oc_product_to_category
     *
     * @return void
     */
    public function productToCategory()
    {
        return $this->hasMany('App\ProductToCategory');
    }

    /**
     * relation ship with oc_category_description
     *
     * @return void
     */
    public function categoryDescription()
    {
        return $this->hasOne('App\CategoryDescription', 'category_id', 'category_id');
    }
}
