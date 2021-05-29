<?php
include '../../dbconfig/config.php';

if(isset($_POST['rollno'])){
    $roll = $_POST['rollno'];

    $qry = $con->prepare('SELECT rollno, name, DOB, address, email, contactno
                            FROM student_details WHERE rollno=?');
    $qry->bind_param('i', $roll);
    if($qry->execute()){
        $res = $qry->get_result();
        $row = $res->fetch_assoc();
        print_r($row);

        $courses = "SELECT * FROM `view_all_courses_student` WHERE rollno=$roll";
        if($crs= $con->query($courses)){
            $out = $crs->fetch_all(MYSQLI_ASSOC);
            print_r($out);
        }else{
            echo $con->error;
        }

    }else{
        echo $con->error;
    }
}else if(isset($_POST['pid'])){

    $pid = $_POST['pid'];

    $prof = "SELECT * from `all_courses` WHERE profno=$pid";
    if($res = $con->query($prof)){
        $professors = $res->fetch_all(MYSQLI_ASSOC);
        print_r($professors);
    }else{
        echo $con->error;
    }

}else{
    echo "NOT VIEWABLE";
}