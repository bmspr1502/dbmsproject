<?php
session_start();
include '../dbconfig/config.php';
if(!isset($_SESSION['pid']))
{
	header("location:../index.php");
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="../bootstrap/css/stddashstyle.css" rel="stylesheet" >
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
 

</head>
<body>
<div id="topheader">
    <div class="container-fluid">
       <h2>CEG COURSE MANAGEMENT</h2> 
       
    </div>
</div>
<div class="container-fluid" id="sidebar" >
    <div class="row" >
        
        <h1>HELLO PROFESSOR <?php  echo $_SESSION['pname']?></h1>
        
            <ul>
                
                <a href="profdash.php"><li> DASHBOARD</li>
                </a>
                <a href="course.php">
                <li>VIEW All COURSES</li>
                </a>
                <a href="course_details.php#navStudentDetails" onclick='show_course_details()'>
                <li>VIEW STUDENT DETAILS</li>
                </a>
				<a href="course_details.php#navCourseMaterials" onclick='show_course_materials()'>
                <li>UPLOAD STUDY MATERIALS</li>
                </a>
                <a href="course_details.php#navCourseNotifications" onclick='show_course_notifications()'>
                <li>SEND NOTIFICATIONS</li>
                </a>
                <a href="professor_update_details.php">
                <li>UPDATE DETAILS</li>
                </a>
				<a href="log_out.php">
                <li>LOG OUT</li>
                </a>
             

            </ul>
            
    
        </div>

    </div>
    