<?php
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
        
            <ul  >
                <a href="stddash.php">
				<li>DASHBOARD</li>
                </a>
               <a href="view_all_course.php">
                <li> VIEW All COURSES</li></a>
                
                <a href="student_notifications.php">
                <li>NOTIFICATIONS</li>
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
    <div class="container-fluid p-0" id="con">
        <div class="content">
            <h3>Profile Details</h3>
            <img src="images/software-engineer-vector-6122111.jpg" style="width: 70px;">
            <p>Name:</p>
            <p>DOB:</p>
            <P>Address:</p>
        </div>
    
    <div class="container-fluid p-0" id="enrolledcourses">
       <h3> Enrolled courses</h3>
        <div class="container">
            <div class="row">
                <div class="col-md-3 course"  >
                    <h5><center>DBMS COURSE</center></h5>
                    <form >
                        <button id="btn">Viewcourse</button>
                    </form>
                                </div>
                                <div class="col-md-3 course"  >
                                    <h5><center>DSA COURSE</center></h5>
                                    <form >
                                        <button id="btn">Viewcourse</button>
                                    </form>
                                                </div>
                                                <div class="col-md-3 course"  >
                                                    <h5><center>OS COURSE</center></h5>
                                                    <form >
                                                        <button id="btn">Viewcourse</button>
                                                    </form>
                                                                </div>
                                

            </div>
            
        </div>

    </div>
    </div>
</div>
   <script src="bootstrap/js/jquery-3.3.1.slim.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>

