<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Domains\SubmissionManagement\Checker;
use App\Http\Domains\AnswerManagement\Answer;

class CompileController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * return void
     */
    public function __construct()
    {
        //
    }

    public function compile(Request $request)
    {
        /**
         *  Params
         *
         *  $lang String (require)
         *  $sourceCode String (require)
         *  $input String (optional)
         */
        $output = Checker::compile($request->input('lang'),
            $request->input('sourceCode'),
            $request->input('input'));

        return $this->respond(Response::HTTP_OK, $output);
    }

    public function checkTestCase(Request $request)
    {
        /**
         *  Params
         *
         *  $lang String (require)
         *  $sourceCode String (require)
         *  $input String (require)
         *  $output String (require)
         */

        $output = Checker::checkTestCase($request->input('lang'),
            $request->input('sourceCode'),
            $request->input('input'),
            $request->input('output'));

        return $this->respond(Response::HTTP_OK, $output);
    }

    public function submitAnswer(Request $request)
    {
        $output = Checker::submitAnswer($request->input('lang'),
            $request->input('user_id'),
            $request->input('question_id'));

        return $this->respond(Response::HTTP_OK, $output);
    }
}
