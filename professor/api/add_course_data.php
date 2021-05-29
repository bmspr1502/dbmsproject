<?php
include '../../dbconfig/config.php';

if(isset($_POST['courseid'])){
    $courseid = $con->real_escape_string($_POST['courseid']);
    $type = $con->real_escape_string($_POST['type']);
    $link = $_POST['link'];
    $title = $con->real_escape_string($_POST['title']);
    $description = $_POST['description'];

    $qry = $con->prepare("INSERT INTO course_data 
                        (courseid, type, link, title, description)
                        VALUES (?,?,?,?,?)");
    $qry->bind_param("sssss", $courseid, $type, $link, $title, $description);

    if($qry->execute()){
        echo "SUCCESSFULLY ENTERED";
    }else{
        echo $con->error;
    }

}else{
    echo "NOT ACCESSIBLE";
}