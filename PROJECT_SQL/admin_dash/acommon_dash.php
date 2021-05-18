<?php 
require 'C:\xampp\htdocs\PROJECT_SQL\dbconfig\config.php';
session_start();
if(!isset($_SESSION['aid']))
{
	header("location:/PROJECT_SQL/index.php");
}
?>

<!DOCTYPE html>
<html>
<head>
     <!-- Required meta tags -->
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <link href="/PROJECT_SQL/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
    <link href="/PROJECT_SQL/bootstrap/css/stddashstyle.css" rel="stylesheet" >
<link href="/PROJECT_SQL/fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
</head>
<body>
<div id="topheader">
    <div class="container-fluid">
	
	   
	
       <h2>CEG COURSE MANAGEMENT</h2> 
       
    </div>
</div>
<div class="container-fluid" id="sidebar" >
    <div class="row" >
        
        <h1>HELLO ADMIN</h1>
        
            <ul  >
                <a href="admindash.php">
				<li>DASHBOARD</li>
                </a>
               <a href="add_new_student.php">
                <li>ADD NEW STUDENT</li></a>
                
                <a href="add_new_prof.php">
                <li>ADD NEW PROFESSOR</li>
                </a>
				<a href="add_new_course.php">
                <li>ADD NEW COURSE</li></a>
				<a href="view_student_request.php">
				<li>VIEW STUDENTS REQUESTS</li></a>
                
                <a href="student_update_details.php">
                <li>SEND NOTIFICATIONS</li>
                </a>
				<a href="log_out.php">
                <li>LOG OUT</li>
                </a>
             

            </ul>
            
    
        </div>

    </div>
    