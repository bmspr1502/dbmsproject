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
		<link rel="stylesheet" href="style.css">

</head>
<body>
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active">
				<h1><a href="../index.php" class="logo">CMS</a></h1>
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
	

 <div class="container-fluid p-0" id="enrolledcourses">
        <h3 style="margin:20px">All Courses:</h3>
     <div class="container" id="box">
    <div class="row">
                
    <?php 

$sql="SELECT * FROM `view_all_courses_student` WHERE rollno !='{$_SESSION['sroll_no']}' OR rollno IS NULL GROUP BY courseid";
 $query_run=mysqli_query($con,$sql);
 
 
    


$i=0;
$n=4;
$colorArray =Array('warning','info','success','danger');
while ($row =$query_run->fetch_assoc()) 
{ ?> 
 <div class="col-md-3">
   <div class='card text-white bg-<?php echo $colorArray[$i%4]; ?> mb-3' style='max-width: 18rem;margin:20px;' id='cardcourse'>
    <div class="card-header">
       <center><i class="fa fa-book-reader fa-2x"></center></i>           
         <h3 class="card-title" style="text-align:center;"><?php echo $row['course_name']; ?></h3>
          </div>

<center><input type="button" class="btn btn-primary" id="enroll" name="enroll" onclick="view_course_details('<?php echo $row['courseid'];?>' )" value="Enroll"/></center>
 
 </div>
</div>
<?php
$i++;
}
?>                           
</div></div>
          </div>
          
      </div>

  </div>
<p id="box"></p>                           
</div>
</div>
</div>
</div>
	</div>

 <script src="jquery.min.js"></script>
    <script src="popper.js"></script>
    <script src="bootstrap.min.js"></script>
    <script src="main.js"></script>

    <script type="text/javascript">
	function view_course_details(course_id){
		$.post('enroll_course.php', {
                enroll: course_id
            },function(data){
                $('#box').html(data);
				location.reload();
            })
	};
	
	
	

	</script>
</body>
</html>
