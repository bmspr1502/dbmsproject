<?php
session_start();
require '..\dbconfig\config.php';

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
<title>student requests</title>

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
            <a href="admin_profile_details.php"><span class="fa fa-user"></span>PROFILE DETAILS</a>
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
            <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>
		</div>
        </nav>


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
<label>Title</label></br>
<input type="text" style="width:50%" name="title" required></input>
</div>
<div >
<label>Message</label></br>
<textarea rows="5" cols="90" style="width:700px" name="message" required ></textarea>
</div>
<div >
<label>Upload</label></br>
<input type="file" name="efile"></input>
</div>
<div class="form-group mt-5" >
<button type="submit" name="sendnot"class="btn btn-primary">Send Message</button>
</div>
</form>
</div>
</div></div>
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
<script src="../dash_style/main.js"></script>
</body>
</html>