<?php
session_start();
  require '../dbconfig/config.php';

?>
<!DOCTYPE html>
<html>
<head>
<title>view_all_course</title>

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
              <h4>ALL COURSES</h4>
            </div>


          </div>
        </nav>
	

 <div class="container-fluid p-0" id="enrolledcourses">

        <input type="text" id="myinput" placeholder="Search..." class="form-control" />
     <div class="container">
       <p id='box'></p>
    <div class="row" id='unenrolledCourses'>
                
    </div>
    <h4>ENROLLED COURSES:</h4>
    <div class="row" id='enrolledCourses'>
                
    </div>
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

    <script type="text/javascript">
	function enroll_course(course_id){
		$.post('api/enroll_course.php', {
                enroll: course_id
            },function(data){
                $('#box').html(data);
                load_unenrolled_courses();
                load_enrolled_courses();
				        //location.reload();
            })
	};
  function load_unenrolled_courses(){
    $.post('api/load_unenrolled_courses.php', {
      rollno: '<?php echo $_SESSION['sroll_no'];?>'
    },function(data){
        $('#unenrolledCourses').html(data);
    })
  }

  function load_enrolled_courses(){
    $.post('api/load_enrolled_courses.php', {
      rollno: '<?php echo $_SESSION['sroll_no'];?>'
    },function(data){
        $('#enrolledCourses').html(data);
    })
  }

  function open_course(courseid){
    $.post('api/set_course.php', {
      course_id: courseid
    }, function(data){
      $('#enrolledCourses').html(data);
    })
  }

	
	$(document).ready(function() {
    load_unenrolled_courses();
    load_enrolled_courses();
    $('#myinput').keyup(function(){
        search_text($(this).val());
    });

    function search_text(value){
        $('.card ').each(function(){
            var found = 'false';
            $(this).each(function(){
                if($(this).text().toLowerCase().indexOf(value.toLowerCase()) >= 0)
                {
                    found = 'true';
                }
            });
            if(found == 'true'){
                $(this).show()
            }
            else {
                $(this).hide();
            }
        })
    }
});
	

	</script>
</body>
</html>
