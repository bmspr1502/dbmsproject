<?php
require 'C:\xampp\htdocs\PROJECT_SQL\dbconfig\config.php';
require "acommon_dash.php"
?>
<!DOCTYPE html>
<html>
<head>
<title>student requests</title>
 <!-- Required meta tags -->
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
	<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" >
	<link href="../bootstrap/css/stddashstyle.css" rel="stylesheet" >
	<link href="../fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
</head>
<body>
<div class="container" >
<form  action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST" enctype="multipart/form-data">
<div class="form-group">
<label >Target people:</label>
<select id="targetpeople" name="targetpeople" required>
  <option value="student">student</option>
  <option value="professor">professor</option>
  <option value="both">both</option>
  
</select>
</div>
<div class="form-group">
<label>Title</label>
<input type="text"  name="title" required></input>
</div>
<div >

<label>Message</label>
<textarea rows="5" cols="90" style="width:700px" name="message" required ></textarea>
</div>
<div >

<label>Upload</label>
<input type="file" name="efile"></input>

</div>
<div class="form-group" >
<button type="submit" name="sendnot"class="btn btn-primary">Send Message</button>
</div>
</form>
<?php
if(isset($_POST['sendnot']))
{
	$targetpeople=$_POST['targetpeople'];
	$title       =$_POST['title'];
	$message     =$_POST['message'];
	$target_dir="Upload/";
	$target_file=$target_dir.basename($_FILES['efile']['name']);
	if(move_uploaded_file($_FILES['efile']['tmp_name'],$target_file)){
		$query="insert into admin_notifications values('','$targetpeople','$title','$message',now(),'$target_file')";
	$query_run=mysqli_query($con,$query);
	
	if($query_run){
		echo "<script type='text/javascript'> alert('data updated');</script>";
		
	}
	else{
		echo "<script type='text/javascript'> alert('unsuccessfull updation');</script>";
		
	}
		
	}
	else {
		echo "<script type='text/javascript'> alert('Error in book upload');</script>";
		
	}
	
	
	
	
}



?>
</body>
</html>