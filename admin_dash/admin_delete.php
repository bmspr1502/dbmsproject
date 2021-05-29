<?php
require '../dbconfig/config.php';
if(isset($_POST['delete']))
{
	
	$id=$_POST['delete_id'];
	$query="delete from prof_details WHERE profno='$id'";
	$query_run=mysqli_query($con,$query);
	
	if($query_run){
		echo "<script type='text/javascript'> alert('data deleted');</script>";
		header('location:prof_details.php');
	}
	else{
		echo "<script type='text/javascript'> alert('unsuccessfull deletion');</script>";
		
	}
	
}


?>
