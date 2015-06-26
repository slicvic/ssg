<?php namespace App\Models;

/**
 * Site
 *
 * @author Victor Lantigua <vmlantigua@gmail.com>
 */
class Site extends Base {

    protected $table = 'sites';

    public static $rules = [
        'company_id' => 'required',
        'name' => 'required',
        'display_name' => 'required'
    ];

    protected $fillable = [
        'company_id',
        'name',
        'display_name'
    ];

    /**
     * Gets the company.
     */
    public function company()
    {
        return $this->belongsTo('App\Models\Company');
    }
}
