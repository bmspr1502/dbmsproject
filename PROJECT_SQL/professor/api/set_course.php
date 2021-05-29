<?php
session_start();
if(isset($_POST['course_id'])){
$_SESSION['p_course'] = $_POST['course_id'];
$_SESSION['p_course_name'] = $_POST['course_name'];
echo '<script>window.location.href="course_details.php"</script>';
}else{
    header('location: profdash.php');
}