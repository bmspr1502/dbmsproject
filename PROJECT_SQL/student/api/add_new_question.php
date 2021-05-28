<?php
include '../../dbconfig/config.php';

if(isset($_POST['description'])){
   $qry = $con->prepare("INSERT INTO `course_forum_qn`
                        (courseid, description, usertype, posted_by)
                        VALUES (?,?,?,?)");
    $qry->bind_param('sssi', $_POST['courseid'],$_POST['description'],$_POST['usertype'],$_POST['userid']);

    if($qry->execute()){
        echo "Added";
    }else{
        echo $con->error;
    }

}else{
    echo "NOT VIEWABLE";
}
?>