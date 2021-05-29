<?php
session_start();
include '../../dbconfig/config.php';

if(isset($_POST['dataid'])){
    $dataid = $_POST['dataid'];

    $qry = $con->prepare('SELECT * FROM course_data WHERE dataid = ?');
    $qry->bind_param('i', $dataid);
    $qry->execute();
    $result = $qry->get_result();
    if($output = $result->fetch_assoc()){
        echo json_encode($output);
    }else{
        echo "{'error': 'ERROR;}";
    }

}else{
    echo "{'error': 'NOT VIEWABLE'}";
}