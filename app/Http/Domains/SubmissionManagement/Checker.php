<?php
namespace App\Http\Domains\SubmissionManagement;

use App\Http\Domains\AnswerManagement\Answer;
use App\Student_answer;
use App\Question;
use App\Test_case;

class Checker {

    public static function compile($lang, $sourceCode, $input="")
    {
        $checker = new Checker();
        $milliseconds = round(microtime(true) * 1000);
        $milliseconds .= $checker->randomHash();
        $cmdInput = "";

        if ($lang == 'python') {
            $mainFileName = "./temp/main_".$milliseconds.".py";
            $inputFileName = "./temp/input_".$milliseconds.".txt";

            // create file
            $checker->createFile($mainFileName, $sourceCode);
            if ($input != "") {
                $checker->createFile($inputFileName, $input);
                $cmdInput = " <".$inputFileName;
            }

            // compiler
            $cmd = "python ".$mainFileName.$cmdInput." 2>&1";// echo $?;";
            $output = shell_exec($cmd);

            // delete file
            unlink($mainFileName);
            if ($input != "")
                unlink($inputFileName);

        }else{
            return "compiler not supported your language";
        }

        return $output;
    }

    public static function checkTestCase($lang, $sourceCode, $input="", $output="")
    {
        $checker = new Checker();
        $result = $checker->compile($lang, $sourceCode, $input);

        $result = trim(preg_replace('/\s+/', ' ', $result));

        return $result == $output ? TRUE : FALSE;
    }

    public static function submitAnswer($lang, $user_id, $question_id)
    {
        $msg = 'Completed';
        $checker = new Checker();

        $answer = Student_answer::where('user_id', $user_id)->where('question_id', $question_id)->first();
        $score = Question::where('id', $question_id)->first()->score;

        $sourceCode = $answer['script'];

        $test_case = Test_case::where('question_id', $question_id)->get();

        if ($test_case->isEmpty()){
            return array(
                'status' => FALSE,
                'message' => 'There are no test case available for this question',
                'last_updated' => date('Y-m-d H:i:s')
            );
        }

        foreach ($test_case as $tc){

            // Convert input/output to string
            $input = $checker->convertIO($tc['input']);
            $output = $checker->convertIO($tc['output']);

            // Check answer between source code and input/output
            $checkAnswer = $checker->checkTestCase($lang, $sourceCode, $input, $output);

            if ($checkAnswer == FALSE){
                $msg = 'Error at Test Case ID : '. $tc['id'];
                Answer::fncUpdateResult($user_id, $question_id, FALSE, 0, $msg);
                return array(
                    'status' => FALSE,
                    'message' => $msg,
                    'last_updated' => date('Y-m-d H:i:s')
                );
            }
        }

        Answer::fncUpdateResult($user_id, $question_id, TRUE, $score, $msg);
        return array(
            'status' => TRUE,
            'message' => $msg,
            'last_updated' => date('Y-m-d H:i:s')
        );
    }

    private function convertIO($json_string)
    {
        $string = '';
        $arr = json_decode($json_string, true);

        if (!isset($arr) || !is_array($arr)){
            return false;
        }

        foreach ($arr as $key => $value){
            $string .= $value['value'];
            if ($key != count($arr)-1){
                $string .= ' ';
            }
        }

        return $string;

    }

    private function createFile($fileName, $content)
    {
        $myfile = fopen($fileName, "w");
        fwrite($myfile, $content);
        fclose($myfile);
    }

    private function randomHash()
    {
        $seed = str_split('abcdefghijklmnopqrstuvwxyz'
            .'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
            .'0123456789'); // and any other characters
        shuffle($seed); // probably optional since array_is randomized; this may be redundant
        $rand = '';
        foreach (array_rand($seed, 5) as $k) $rand .= $seed[$k];

        return $rand;
    }

}
