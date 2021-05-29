<?php
include '../../dbconfig/config.php';

if(isset($_POST['dataid'])){
    $qry = 'DELETE FROM course_data WHERE dataid = '. $_POST['dataid'];

    if($con->query($qry)){
        echo "DELETED";
    }else{
        echo $con->error;
    }
}else{
    echo "NOT VIEWABLE";
}