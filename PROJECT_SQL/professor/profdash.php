
<?php
session_start();

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
    <link rel="stylesheet" href="style.css">
	
<title>Professor dashboard</title>

</head>
<body>

<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active">
			
			 <h1><a href="#" class="logo">CMS</a></h1>
				<?php  echo $_SESSION['pname']?></h1>
         <ul class="list-unstyled components mb-5">
          <li class="active">
            <a href="profdash.php"><span class="fa fa-home"></span>DASHBOARD</a>
          </li>
		   <li>
            <a href="professor_profile_details.php"><span class="fa fa-user"></span>PROFILE DETAILS</a>
          </li>
		  <li>
            <a href="professor_update_details.php"><span class="fa fa-user-plus"></span>UPDATE PROFILE DETAILS</a>
          </li>
          <li>
            <a href="course_details.php#navStudentDetails" onclick='show_course_details()'><span class="fa fa-sticky-note"></span>VIEW ALL COURSES</a>
          </li>
		  <li>
            <a href="course_details.php#navCourseMaterials" onclick='show_course_materials()'><span class="fa fa-upload"></span>UPLOAD STUDY MATERIALS</a>
          </li>
		  <li>
            <a href="course_details.php#navCourseNotifications" onclick='show_course_notifications()'><span class="fa fa-paper-plane"></span>SEND NOTIFICATION</a>
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


            </div>
        </nav>




    <div class="container-fluid p-0" id="enrolledcourses">
       <h3> Enrolled courses</h3>
       <div class="container mt-5"></div>
            <div class="row">
                <div class="col-md-3 "  >
                   <div class="card text-center">
                   <div class="card-header bg-success text-white">
                   <div class="row align-items-center">
                   <div class="col">
                   <i class="fa fa-list fa-3x"></i>
                    </div>
                    <div class="col">
                    <h3 class="display-3">08</h3>
                    <h6>Tasks</h6>
                    </div>
                    </div>
                   <div class="card-footer " style="width:fit-content;">
                    <p>View Details</p>
                    </div>
                   
                   
                   </div>
                   
                   </div>
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
  <script src="main.js"></script>
 

</body>

</html>

