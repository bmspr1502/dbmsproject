<?php

require 'dbconfig/config.php';
require "scommondash.php";
?>
<!DOCTYPE html>
<html>
<head>
<title>Update Details</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" >
    <link href="bootstrap\css\stddashstyle.css" rel="stylesheet" >
	<link href="fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
</head>
<body>
</head>
<body>
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
</div>
</div></div></div>

</form>
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

</body>

</html>
