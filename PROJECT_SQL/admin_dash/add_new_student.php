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
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" >
    <link href="../bootstrap/css/stddashstyle.css" rel="stylesheet" >
	<link href="fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
<title>ADD NEW COURSE</title>
</head>
<body>
<div class="container align-items-center" id="newcourse">
<h4> CREATE A NEW COURSE </h4>
<form action="add_new_student.php" method="POST" >
<div class="form-group align-items-center">

<label class="control-label"><i class="fas fa-lock fa-1.5x"></i> Roll-no</label>
<input type="text" placeholder="Enter Course ID" class="form-control" name="sid" ></div>
<div class="form-group">
<label class="control-label"><i class="fa fa-address-card" ></i> student Name</label>
<input type="text" placeholder="Enter Course Name" class="form-control" name="sname"></div>
<div class="form-group">
<label class="control-label"><i class="fa fa-birthday-cake"></i> student password </label>
<input type="text" placeholder="Enter Professor ID" class="form-control" name="spassword"></div>

<button class="btn btn-primary" id="sendbtn" type="submit" name="create">CREATE NEW STUDENT</button>
</form>
</div>
<?php
if(isset($_POST['create']))
{   
    
	$sid=$_POST['sid'];
	$sname=$_POST['sname'];
	$spassword=$_POST['spassword'];
	$noofcourses=0;
	
	$query="insert into student_details values ('$sid','$sname','$spassword','$noofcourses')";
	$query_run=mysqli_query($con,$query);
	if($query_run){
		echo "<script type='text/javascript'> alert('sucessfully requested');</script>";
	}
	else{
		echo "<script type='text/javascript'> alert('unsuccess');</script>";
		
	}
}



?>


</body>
</html>