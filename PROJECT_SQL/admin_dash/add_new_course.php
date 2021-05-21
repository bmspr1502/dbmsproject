<?php
require '../dbconfig\config.php';
require "acommon_dash.php";
?>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
	<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" >
	<link href="../bootstrap/css/stddashstyle.css" rel="stylesheet" >
	<link href="../fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
<title>ADD NEW COURSE</title>
</head>
<body>
<div class="container align-items-center" id="newcourse">
<h4> CREATE A NEW COURSE </h4>
<form action="add_new_course.php" method="POST" >
<div class="form-group align-items-center">

<label class="control-label"><i class="fas fa-lock fa-1.5x"></i> Course-ID</label>
<input type="text" placeholder="Enter Course ID" class="form-control" name="courseid" ></div>
<div class="form-group">
<label class="control-label"><i class="fa fa-address-card" ></i> Course Name</label>
<input type="text" placeholder="Enter Course Name" class="form-control" name="coursename"></div>
<div class="form-group">
<label class="control-label"><i class="fa fa-birthday-cake"></i> Professor-ID </label>
<input type="text" placeholder="Enter Professor ID" class="form-control" name="professorid"></div>

<button class="btn btn-primary" id="sendbtn" type="submit" name="create">CREATE NEW COURSE</button>
</form></div>
<?php
if(isset($_POST['create']))
{   
    
	$courseid=$_POST['courseid'];
	$coursename=$_POST['coursename'];
	$professorid=$_POST['professorid'];
	$noofstudents=0;
	
	$query="insert into course_details values ('$courseid','$coursename','$professorid','$noofstudents')";
	$query_run=mysqli_query($con,$query);
	if($query_run){
		echo "<script type='text/javascript'> alert('sucessfully created');</script>";
	}
	else{
		echo "<script type='text/javascript'> alert('unsuccess');</script>";
		
	}
}



?>


</body>
</html>