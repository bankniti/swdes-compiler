<?php
namespace App\Http\Domains\AnswerManagement;

use App\Student_answer;

class Answer {

    public static function fncUpdateResult($user_id, $question_id, $result, $score, $message){
        $objStudentAnswer = Student_answer::where('user_id', $user_id)
            ->where('question_id', $question_id)
            ->update(['result' => $result, 'score' => $score, 'message' => $message]
            );
        //$objStudentAnswer->save();

        return $objStudentAnswer ? $objStudentAnswer : 'Failed to update `student_answer`';
    }

}
