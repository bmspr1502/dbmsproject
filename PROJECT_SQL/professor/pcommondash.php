<?php
session_start();
if(!isset($_SESSION['sroll_no']))
{
	header("location:index.php");
}
?>
<!DOCTYPE html>
<html>
<head>
     <!-- Required meta tags -->
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" >
    <link href="C:\xampp\htdocs\PROJECT_SQL\bootstrap\css\stddashstyle.css" rel="stylesheet" >
	<link href="fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">

</head>
<body>
<div id="topheader">
    <div class="container-fluid">
       <h2>CEG COURSE MANAGEMENT</h2> 
       
    </div>
</div>
<div class="container-fluid" id="sidebar" >
    <div class="row" >
        
        <h1>HELLO USER</h1>
        
            <ul>
                
                <a href="stddash.php"><li> DASHBOARD</li>
                </a>
                <a href="view_all_course.php">
                <li>VIEW All COURSES</li>
                </a>
                <a href="student_notifications.php">
                <li>SEND NOTIFICATIONS</li>
                </a>
				<a href="student_notifications.php">
                <li>UPLOAD STUDY MATERIALS</li>
                </a>
                <a href="student_update_details.php">
                <li>UPDATE DETAILS</li>
                </a>
				<a href="log_out.php">
                <li>LOG OUT</li>
                </a>
             

            </ul>
            
    
        </div>

    </div>
    