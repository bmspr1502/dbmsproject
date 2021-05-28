<?php
include '../../dbconfig/config.php';

if(isset($_POST['answer'])){
   $qry = $con->prepare("INSERT INTO `course_forum_ans`
                        (qnid, answer, usertype, userid)
                        VALUES (?,?,?,?)");
    $qry->bind_param('sssi', $_POST['qnid'],$_POST['answer'],$_POST['usertype'],$_POST['userid']);

    if($qry->execute()){
        echo "Added";
    }else{
        echo $con->error;
    }

}else{
    echo "NOT VIEWABLE";
}