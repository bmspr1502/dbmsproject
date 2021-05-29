
<?php 
require  '../dbconfig/config.php';
session_start();
if(!isset($_SESSION['aid']))
{
	header("location:/PROJECT_SQL/index.php");
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="../dash_style/style.css">

</head>
<body>



		<div class="wrapper d-flex align-items-stretch">
			<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active">
				<h1><a href="#" class="logo">CMS</a></h1>
        <ul class="list-unstyled components mb-5">
          <li class="active">
            <a href="admindash.php"><span class="fa fa-home"></span>DASHBOARD</a>
          </li>
		 
          <li>
            <a href="add_new_student.php"><span class="fa fa-user-plus"></span>ADD NEW STUDENT</a>
          </li>
          <li>
            <a href="add_new_prof.php"><span class="fa fa-user-plus"></span>ADD NEW PROFESSOR</a>
          </li>
          <li>
            <a href="add_new_course.php"><span class="fa fa-upload"></span>ADD NEW COURSE</a>
          </li>
          <li>
            <a href="view_student_request.php"><span class="fa fa-newspaper-o"></span>VIEW STUDENTS REQUESTS</a>
          </li>
          <li>
            <a href="anotifications.php"><span class="fa fa-paper-plane"></span>SEND NOTIFICATIONS</a>
          </li>
          <li>
            <a href="log_out.php"><span class="fa fa-sign-out"></span>LOG OUT</a>
          </li>
        </ul>
    	</nav>
		<div id="content" class="p-4 p-md-5">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">

            <button type="button" id="sidebarCollapse" class="btn btn-primary">
              <i class="fa fa-bars"></i>
              <span class="sr-only">Toggle Menu</span>
            </button>
            <div class='mx-auto text-center'>
              <h4>ADMIN DASHBOARD</h4>
            </div>
            
		    	</div>
        </nav>


    
    <div class="container-fluid p-0" id="enrolledcourses">
       <h3><center>OVERALL DETAILS</center></h3>
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
              
                    <a class="btn btn-warning" href="student_details.php" >View Details</a>
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
                   
                   <a href="prof_details.php" class="btn btn-warning" >View Details</a>
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
					$sql="select * from course_details";
					$query_run=mysqli_query($con,$sql);
					
                   echo "<h3 class='display-3'>"; 
				   echo $query_run->num_rows; 
				   echo"</h3>"; 
				   ?>
                    
                    <h6>Courses</h6>
                    </div>
                    </div>
           
                    <a class="btn btn-warning" href="acourse_details.php" >View Details</a>
                    </div>
                   
                   
                   </div>
                   
                   </div>
                                

            </div>
            
        </div>

    </div>
    </div>
</div>
</div>

	<script src="../dash_style/main.js"></script>

</body>
</html>

