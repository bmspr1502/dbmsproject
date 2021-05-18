
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
                <a href="stddash.php">
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
    <div class="container-fluid p-0" id="con">
        <div class="content">
            <h3>Profile Details</h3>
            <img src="images/software-engineer-vector-6122111.jpg" style="width: 70px;">
            <p>Name:</p>
            <p>DOB:</p>
            <P>Address:</p>
        </div>
    
    <div class="container-fluid p-0" id="enrolledcourses">
       <h3>OVERALL DETAILS</h3>
        <div class="container mt-5">
            <div class="row">
                 <div class="col-md-3 "  >
                   <div class="card text-center">
                   <div class="card-header bg-success text-white">
                   <div class="row align-items-center">
                   <div class="col">
                   <i class="fa fa-list fa-3x"></i>
                    </div>
                    <div class="col">
					<?php 
					$sql="select * from student_details";
					$query_run=mysqli_query($con,$sql);
					
                   echo "<h3 class='display-3'>"; 
				   echo $query_run->num_rows; 
				   echo"</h3>"; 
				   ?>
                    <h6>Students</h6>
                    </div>
                    </div>
                   <div class="card-footer " style="width:fit-content;">
                    <a href="student_details.php" >View Details</a>
                    </div>
                   
                   
                   </div>
                   
                   </div>
                                </div>
								 <div class="col-md-3 "  >
                   <div class="card text-center">
                   <div class="card-header bg-primary text-white">
                   <div class="row align-items-center">
                   <div class="col">
                   <i class="fa fa-list fa-3x"></i>
                    </div>
                    <div class="col">
					<?php 
					$sql="select * from prof_details";
					$query_run=mysqli_query($con,$sql);
					
                   echo "<h3 class='display-3'>"; 
				   echo $query_run->num_rows; 
				   echo"</h3>"; 
				   ?>
                    
                    <h6>Professors</h6>
                    </div>
                    </div>
                   <div class="card-footer " style="width:fit-content;">
                    <a href="prof_details.php" >View Details</a>
                    </div>
                   
                   
                   </div>
                   
                   </div>
                                </div>
								 <div class="col-md-3 "  >
                   <div class="card text-center">
                   <div class="card-header bg-danger text-white">
                   <div class="row align-items-center">
                   <div class="col">
                   <i class="fa fa-list fa-3x"></i>
                    </div>
                    <div class="col">
					<?php 
					$sql="select * from admin_login";
					$query_run=mysqli_query($con,$sql);
					
                   echo "<h3 class='display-3'>"; 
				   echo $query_run->num_rows; 
				   echo"</h3>"; 
				   ?>
                    
                    <h6>Admin</h6>
                    </div>
                    </div>
                   <div class="card-footer " style="width:fit-content;">
                    <a href="#" >View Details</a>
                    </div>
                   
                   
                   </div>
                   
                   </div>
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

