<?php

namespace App\Providers;

use Validator;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        /**
        Validator::extend('checkSchoolName', function($attribute, $value, $parameters) {
            if (!$value) return false;
            $school = YbBaseApi('School', 'searchSchool', ['where' => ['name' => $value]]);
        });
        */
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
