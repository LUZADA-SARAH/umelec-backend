<?php

use Illuminate\Support\Facades\Route;

Route::get('/test', function () {
    return ['message' => 'Backend is connected!'];
});
