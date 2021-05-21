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
    <?php require 'header.php'?>

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
                <a href="professor_notifications.php">
                <li>SEND NOTIFICATIONS</li>
                </a>
				<a href="professor_notifications.php">
                <li>UPLOAD STUDY MATERIALS</li>
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
    