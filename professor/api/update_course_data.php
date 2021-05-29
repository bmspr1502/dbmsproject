<?php
include '../../dbconfig/config.php';

if(isset($_POST['courseid'])){
    $dataid = $_POST['dataid'];
    $type = $con->real_escape_string($_POST['type']);
    $link = stripslashes($_POST['link']);
    $title = $con->real_escape_string($_POST['title']);
    $description = stripslashes($_POST['description']);

    $qry = $con->prepare("UPDATE course_data 
                          SET type = ?, link = ?, title = ?, description = ?
                          WHERE dataid = ?");
    $qry->bind_param("ssssi", $type, $link, $title, $description, $dataid);

    if($qry->execute()){
        echo "SUCCESSFULLY UPDATED";
    }else{
        echo $con->error;
    }

}else{
    echo "NOT ACCESSIBLE";
}