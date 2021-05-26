<?php
session_start();
require '../dbconfig/config.php';

?>
<!DOCTYPE html>
<html>
<head>
<title>Update Details</title>
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
<h3>Update Details:</h3>
        <div class="container">
            <div class="row">
              <div class="col-md-6">  
<form class="update_form" action="student_update_details.php" method="POST">
<div class="form-group">
<label class="control-label"><i class="fas fa-lock fa-1.5x"></i> Change Password</label>
<input type="text" placeholder="Type your new password" class="form-control" name="newpassword"></div>
<div class="form-group">
<label class="control-label"><i class="fa fa-address-card" ></i> Change your name </label>
<input type="text" placeholder="Type your updated name" class="form-control" name="newname" ></div>
<div class="form-group">
<label class="control-label"><i class="fa fa-birthday-cake"></i> Change Date of Birth</label>
<input type="date"  class="form-control" name="newdob" ></div>
<div class="form-group">
<label class="control-label"  ><i class="fa fa-address-card"  ></i> Change Addresss</label>
<textarea rows="4" cols="70" name="address" class="form-control" style="margin-left:10px"></textarea>
<button  name="request" class="btn btn-success" id="sendbtn" type="submit">SEND REQUEST TO ADMIN</button></div>
</form>
</div>
</div></div></div>

<?php
if(isset($_POST['request']))
{   
    
	$newpassword=$_POST['newpassword'];
	$newname=$_POST['newname'];
	$newdob=$_POST['newdob'];
	$newaddress=$_POST['address'];
	
	$query="insert into student_update values ('{$_SESSION['sroll_no']}','$newpassword','$newname','$newdob','$newaddress')";
	$query_run=mysqli_query($con,$query);
	if($query_run){
		echo "<script type='text/javascript'> alert('sucessfully requested');</script>";
	}
	else{
		echo "<script type='text/javascript'> alert('unsuccess');</script>";
		
	}
}



?>
</div>
</div>
 <script src="jquery.min.js"></script>
    <script src="popper.js"></script>
    <script src="bootstrap.min.js"></script>
    <script src="main.js"></script>

</body>

</html>
