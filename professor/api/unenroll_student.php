<?php
include '../../dbconfig/config.php';


if(isset($_POST['rollno'])){
    $rollno = $_POST['rollno'];
    $courseid = $_POST['courseid'];


    $qry=$con->prepare("DELETE FROM `student_courses` 
            WHERE rollno=?, courseid=?");
    $qry->bind_param('is', $rollno, $courseid);

    if($qry->execute()){
        echo "DELETED";
    }else{
        echo $con->error;
    }
}else{
    echo "NOT VIEWABLE";
}