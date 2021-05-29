<?php
session_start();
if(isset($_POST['course_id'])){
$_SESSION['s_course'] = $_POST['course_id'];
$_SESSION['s_course_name'] = $_POST['coursename'];
echo '<script>window.location.href="course_details.php"</script>';
}else{
    echo "NOT VIEWABLE";
}