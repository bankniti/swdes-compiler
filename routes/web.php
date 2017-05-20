<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$app->get('/', function () use ($app) {
    return $app->version();
});

$app->get('bank', function () {
    return 'hello';
});


/**
 * Routes for compiler
 */
$app->post('compile','CompileController@compile');
$app->post('checkTestCase','CompileController@checkTestCase');
$app->post('submit','CompileController@submitAnswer');