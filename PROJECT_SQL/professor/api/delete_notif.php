<?php
include '../../dbconfig/config.php';
if(isset($_POST['notifid'])){
    
    $qry = $con->prepare("DELETE FROM `course_notifications` 
                            WHERE id=?");
    $qry->bind_param("i", $_POST['notifid']);

    if($qry->execute()){
        if(isset($_POST['file'])){
            unlink('../../uploads/course_notif/'.$_POST['file']);
        }
        echo "Deleted";
    }else{
        echo $con->error;
    }
}else{
    echo "NOT VIEWABLE";
}