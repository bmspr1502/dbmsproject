<?php
session_start();
if(!isset($_SESSION['p_course'])){
    echo '<script>window.location.href="course.php"</script>';
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
    <link rel="stylesheet" href="style.css">
<title>view_all_course</title>

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
            <a href="course_details.php#navCourseNotifications" onclick='show_course_notifications()'><span class="fa fa-paper-plane"></span> SEND NOTIFICATION</a>
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
    <div id='insideNav'>
    
        <ul class="nav nav-pills nav-fill mt-3 mb-3">
        <li class="nav-item">
            <button class="nav-link" data-toggle='pill' id='navStudentDetails'  >Show Student Details</button>
        </li>
        <li class="nav-item">
            <button class="nav-link" data-toggle='pill' id='navCourseMaterials' >Course Materials</button>
        </li>
        <li class="nav-item">
            <button class="nav-link" data-toggle='pill' id='navCourseNotifications' >Course Notifications</button>
        </li>
        </ul>
    </div>
     <div class="container" id="box">
    </div>
</div>
    </div>
</div>

<script type='text/javascript'>
    function show_course_details(){
        $.post('api/show_course_details.php', function(data){
            make_all_inactive();
            $('#navStudentDetails').addClass('active');  
            $("#box").html(data);
        })
    }
    
    function show_course_materials(){
        $.post('api/show_course_materials.php', function(data){
            make_all_inactive();
            $('#navCourseMaterials').addClass('active');
            $("#box").html(data);
        })
    }

    function show_course_notifications(){
        make_all_inactive();
        $('#navCourseNotifications').addClass('active');
        $("#box").html('HIIIIII');  
    }

    $(document).ready(function(){
        if (window.location.hash === '#navStudentDetails') {
            show_course_details();
        }else if (window.location.hash === '#navCourseMaterials') {
            show_course_materials();
        }else if (window.location.hash === '#navCourseNotifications') {
            show_course_notifications();
        }else {
        show_course_details();
        }

        $('#navStudentDetails').click(function(){
            show_course_details();
        });

        $('#navCourseMaterials').click(function(){
            show_course_materials();
        });

        $('#navCourseNotifications').click(function(){
            show_course_notifications();
        });
    })
    
    function make_all_inactive(){
        $('#navStudentDetails').removeClass('active');
        $('#navCourseMaterials').removeClass('active');
        $('#navCourseNotifications').removeClass('active');
    }
</script>
<script src="main.js"></script>
</body>
</html>
