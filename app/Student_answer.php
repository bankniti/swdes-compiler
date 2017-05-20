<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class Student_answer extends Model {

    protected $table = "student_answer"; // ชื่อตาราง

    protected $primaryKey = "id"; // Primary Key

    protected $fillable = ["question_id", "user_id", "script", "score", "result", "message", "updated_at"];

    protected $dates = [];

    public static $rules = [
        // Validation rules
    ];

    public function metas()
    {
        //return $this->hasMany("App\UserMeta", "user_id", "user_id"); // ตารางที่เราจะเชื่อมด้วย แบบ one-to-many
    }
}
