<?php
session_start();
require "../dbconfig/config.php";
if(!isset($_SESSION['s_course'])){
    header('location: stddash.php');
}
?>
<!DOCTYPE html>
<html>
<head>
<title>Update Details</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../dash_style/style.css">
</head>
<body>
</head>
<body>
<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active">
				<h1><a href="../index.php" class="logo">CMS</a></h1>
        <ul class="list-unstyled components mb-5">
          <li class="active">
            <a href="stddash.php"><span class="fa fa-home"></span><?php echo $_SESSION['student_name'];?>'s DASHBOARD</a>
          </li>
		  <li>
            <a href="student_profile_details.php"><span class="fa fa-user"></span>PROFILE DETAILS</a>
          </li>
          <li>
            <a href="student_update_details.php"><span class="fa fa-user-plus"></span>SEND REQUEST </a>
          </li>
          <li>
            <a href="view_all_course.php"><span class="fa fa-sticky-note"></span>VIEW ALL COURSES</a>
          </li>
          <li>
            <a href="course_details.php"><span class="fa fa-book"></span>VIEW COURSE DETAILS</a>
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
            <div class='mx-auto text-center'>
              <h4>Course: <?php echo $_SESSION['s_course_name'];?></h4>
            </div>
            <a href='stddash.php' class='btn btn-success'>Go back to dashboard</a>

            </div>
            
        </nav>

<div class="container-fluid p-0" id="enrolledcourses">
    <div id='insideNav'>
    
        <ul class="nav nav-tabs nav-fill mt-3 mb-3">
        <li class="nav-item">
            <button class="nav-link" data-toggle='pill' id='navStudentDetails'  >Show Student Details</button>
        </li>
        <li class="nav-item">
            <button class="nav-link" data-toggle='pill' id='navCourseMaterials' >Course Materials</button>
        </li>
        <li class="nav-item">
            <button class="nav-link" data-toggle='pill' id='navCourseNotifications' >Course Notifications</button>
        </li>
        <li class="nav-item">
            <button class="nav-link" data-toggle='pill' id='navCourseDiscussion' >Course Discussion</button>
        </li>
        </ul>
    </div>
    <div class="container" id="box">
    </div>
    </div>
</div>
</div>


<!-- The Modal -->
<div class="modal" id="viewProfile">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title text-center" id='viewProfileHeading'>Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div id='viewProfileBox'>
        </div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

  <script src="../dash_style/main.js"></script>

<script>
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
        $.post('api/show_course_notification.php',{
            courseid: '<?php echo $_SESSION['s_course']?>'
        },function(data){
            make_all_inactive();
            $('#navCourseNotifications').addClass('active');
            $("#box").html(data);  
        });  
    }

    function show_course_discussion(){
        $.post('api/show_course_discussion.php',{
            courseid: '<?php echo $_SESSION['s_course']?>'
        },function(data){
            make_all_inactive();
            $('#navCourseDiscussion').addClass('active');
            $("#box").html(data);  
        })
       
    }

    function show_information_of_person(type, id){
        $('#viewProfileHeading').html(type+' : '+id);
        if(type=='student'){
            $.post('../professor/api/search_profile.php', {
                rollno: id
            }, function(data){
                $('#viewProfileBox').html(data);
            });
        }else{
            $.post('../professor/api/search_profile.php', {
                pid: id
            }, function(data){
                $('#viewProfileBox').html(data);
            });
        }
    }

    $(document).ready(function(){
        if (window.location.hash === '#navStudentDetails') {
            show_course_details();
        }else if (window.location.hash === '#navCourseMaterials') {
            show_course_materials();
        }else if (window.location.hash === '#navCourseNotifications') {
            show_course_notifications();
        }else if (window.location.hash === '#navCourseDiscussion') {
            show_course_discussion();
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

        $('#navCourseDiscussion').click(function(){
            show_course_discussion();
        });
    })
    
    function make_all_inactive(){
        $('#navStudentDetails').removeClass('active');
        $('#navCourseMaterials').removeClass('active');
        $('#navCourseNotifications').removeClass('active');
        $('#navCourseDiscussion').removeClass('active');
    }
</script>
</body>
</html>