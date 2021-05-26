<?php
    session_start();
	include '../dbconfig/config.php';
	if(isset($_POST['enroll'])){
	
	$sql="insert into student_courses(rollno,courseid) values(?,?)";
	$query_run=$con->prepare($sql);
	$query_run->bind_param("ss",$_SESSION['sroll_no'],$_POST['enroll']);
	if($query_run->execute()){
		echo "<script>alert('Enrolled')</script>";
	}
	else{
		echo "<script>alert('Not Enrolled')</script>";
	}
	}
	?>