<?php namespace App\Models;

/**
 * PackageType
 *
 * @author Victor Lantigua <vmlantigua@gmail.com>
 */
class PackageType extends BaseSiteSpecific {

    protected $table = 'package_types';

    public static $rules = [
        'site_id' => 'required',
        'name' => 'required'
    ];

    protected $fillable = [
        'site_id',
        'name',
        'deleted'
    ];
}
