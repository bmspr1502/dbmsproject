<?php
session_start();
require '../dbconfig/config.php';

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

<title>ADD NEW STUDENT</title>
</head>
<body>
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

        <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5">

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">

            <button type="button" id="sidebarCollapse" class="btn btn-primary">
              <i class="fa fa-bars"></i>
              <span class="sr-only">Toggle Menu</span>
            </button>
            <div class='mx-auto text-center'>
              <h4>CREATE A NEW STUDENT</h4>
            </div>
		</div>
        </nav>


<div class="container align-items-center" id="newcourse">

<form action="add_new_student.php" method="POST" >
<div class="form-group align-items-center">

<label class="control-label"><i class="fa fa-bookmark "></i> Roll-no</label>
<input type="text" placeholder="Enter Student rollno" class="form-control" name="sid" ></div>
<div class="form-group">
<label class="control-label"><i class="fa fa-address-card" ></i> Student Name</label>
<input type="text" placeholder="Enter Student Name" class="form-control" name="sname"></div>
<div class="form-group">
<label class="control-label"><i class="fa fa-lock"></i> Student Password </label>
<input type="text" placeholder="Enter Student password" class="form-control" name="spassword"></div>
<div class="form-group">
<label class="control-label"><i class="fa fa-birthday-cake"></i> Student DOB </label>
<input type="date" placeholder="Enter Student DOB" class="form-control" name="sdob"></div>
<div class="form-group">
<label class="control-label"><i class="fa fa-address-card"></i> Student Address </label>
<input type="text-area" placeholder="Enter Student Address" class="form-control" name="saddress"></div>
<div class="form-group">
<label class="control-label"><i class="fa fa-envelope"></i> Student Email  </label>
<input type="email" placeholder="Enter Student email" class="form-control" name="semail"></div>
<div class="form-group">
<label class="control-label"><i class="fa fa-phone"></i> Student Contact no </label>
<input type="number" placeholder="Enter Student Contactno" class="form-control" name="scontactno"></div>

<button class="btn btn-primary" id="sendbtn" type="submit" name="create">CREATE NEW STUDENT</button>
</form>
</div>
</div></div>
<?php
if(isset($_POST['create']))
{   
    
	$sid=$_POST['sid'];
	$sname=$_POST['sname'];
	$spassword=$_POST['spassword'];
	$sdob=$_POST['sdob'];
	$saddress=$_POST['saddress'];
	$semail=$_POST['semail'];
	$scontactno=$_POST['scontactno'];
	
	
	
	$query=$con->prepare("insert into student_details values (?,?,?,?,?,?,?)");
  $query->bind_param("sssssss",$sid,$sname,$spassword,$sdob,$saddress,$semail,$scontactno);
	
	if($query->execute()){
		echo "<script type='text/javascript'> alert('sucessfully added ');</script>";
	}
	else{
		echo "<script type='text/javascript'> alert('unsuccess');</script>";
		
	}
}



?>

<script src="../dash_style/main.js"></script>

</body>
</html>