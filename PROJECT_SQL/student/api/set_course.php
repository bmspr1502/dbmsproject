<?php
session_start();
if(isset($_POST['course_id'])){
$_SESSION['s_course'] = $_POST['course_id'];
echo '<script>window.location.href="course_details.php"</script>';
}else{
    echo "NOT VIEWABLE";
}