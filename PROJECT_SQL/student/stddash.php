
<?php 
require '../dbconfig/config.php';
session_start();

if(!isset($_SESSION['sroll_no']))
{
	header("location:../index.php");
}
?>

<!DOCTYPE html>
<html>
<head>

     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="style.css">
    


</head>
<body>

<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active">
				<h1><a href="#" class="logo">CMS</a></h1>
        <ul class="list-unstyled components mb-5">
          <li class="active">
            <a href="stddash.php"><span class="fa fa-home"></span>DASHBOARD</a>
          </li>
		  <li>
            <a href="student_profile_details.php"><span class="fa fa-user"></span>PROFILE DETAILS</a>
          </li>
          <li>
            <a href="student_update_details.php"><span class="fa fa-user-plus"></span>UPDATE PROFILE DETAILS</a>
          </li>
          <li>
            <a href="view_all_course.php"><span class="fa fa-sticky-note"></span>VIEW ALL COURSES</a>
          </li>
          <li>
            <a href="student_notification.php"><span class="fa fa-bell"></span>NOTIFICATION</a>
          </li>
          <li>
            <a href="log_out.php"><span class="fa fa-sign-out"></span>LOGOUT</a>
          </li>
        </ul>
    	</nav>

        <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5">

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">

            <button type="button" id="sidebarCollapse" class="btn btn-primary">
              <i class="fa fa-bars"></i>
              <span class="sr-only">Toggle Menu</span>
            </button>
            <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                
            </button>


          </div>
        </nav>

    <div class="container-fluid p-0" id="con">
        <div class="content">
            <h3>Profile Details</h3>
            <img src="images/software-engineer-vector-6122111.jpg" style="width:70px;"></br>
			
            <?php 
			 $sql="select name,DOB,Address from student_details where rollno={$_SESSION['sroll_no']}";

	         
	          $query_run=mysqli_query($con,$sql);
			  if($query_run->num_rows >0)
			  { 
                    while($row=$query_run->fetch_assoc())
                    {

                    echo    "Name  -{$row['name']}</br>";
                    echo    "DOB -{$row['DOB']}</br>";
                    echo    "Address-{$row['Address']}</br>";
                    }
                    
			
			  }
			?>
          		   
        </div>
		</div>
    
    <div class="container-fluid p-0" id="enrolledcourses">
       <h3> Enrolled courses</h3>
	    <div class="container" id="box">
        <div class="row">
	   <?php 
$sql="SELECT course_details.name from course_details 
  INNER JOIN student_courses ON student_courses.courseid=course_details.courseid 
  where student_courses.rollno='{$_SESSION['sroll_no']}'" ;
   $query_run=mysqli_query($con,$sql);
   $storeArray = Array();
   while ($row =$query_run->fetch_assoc()) {
    $storeArray[] =  $row['name'];  
}
$total=count($storeArray);
 $i=0;
 while($i < $total)
 { 
	echo '<div class="col-md-3">';
	echo   '<div class="card text-white bg-warning mb-3" style="max-width: 18rem;margin:20px;" id="cardcourse">';
	echo     '<div class="card-header">';
	echo      ' <center><i class="fa fa-book-reader fa-2x"></center></i>';  
    echo       ' <h3 class="card-title" style="text-align:center;">'; echo $storeArray[$i]; echo'</h3>
            </div>
  <div class="card-body">
  <center><a href="#">View Details</a></center>
    
   </div> 
  </div>
  </div>';
  $i++;
 }
 ?>   
</div>
</div>	   

    </div>
    </div>
</div>

<script src="main.js"></script>

</body>

</html>