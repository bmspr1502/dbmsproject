<?php
include '../../dbconfig/config.php';

if(isset($_POST['courseid'])){
    if(isset($_POST['file'])){
    $qry = $con->prepare('INSERT into course_notifications
                            (courseid, content, file) 
                            VALUES (?,?,?);');
    $qry->bind_param('sss', $_POST['courseid'], $_POST['content'], $_POST['file']);
    }else{
        $qry = $con->prepare('INSERT into course_notifications
                                (courseid, content) 
                                VALUES (?,?,?);');
        $qry->bind_param('sss', $_POST['courseid'], $_POST['content']);
    }

    if($qry->execute()){
        echo "Notification Sent";
    }else{
        echo $con->error;
    }
}else{
    echo "NOT VIEWABLE";
}