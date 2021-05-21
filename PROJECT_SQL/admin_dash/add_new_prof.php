<?php
require '../dbconfig/config.php';
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
<form action="add_new_prof.php" method="POST" >
<div class="form-group align-items-center">

<label class="control-label"><i class="fas fa-lock fa-1.5x"></i> Professor-ID</label>
<input type="text" placeholder="Enter Professor ID" class="form-control" name="profid" ></div>
<div class="form-group">
<label class="control-label"><i class="fa fa-address-card" ></i> Professor Name</label>
<input type="text" placeholder="Enter Professor Name" class="form-control" name="profname"></div>
<div class="form-group">
<label class="control-label"><i class="fa fa-birthday-cake"></i> Professor Password </label>
<input type="text" placeholder="Enter Professor Password" class="form-control" name="profpassword"></div>

<button class="btn btn-primary" id="sendbtn" type="submit" name="create">CREATE PROFESSOR</button>
</form></div>
<?php
if(isset($_POST['create']))
{   
    
	$profid=$_POST['profid'];
	$profname=$_POST['profname'];
	$profpassword=$_POST['profpassword'];
	$noofcourses=0;
	
	$query="insert into prof_details values ('$profid','$profname','$profpassword','$noofcourses')";
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