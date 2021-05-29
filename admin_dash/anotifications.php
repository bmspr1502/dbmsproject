<?php
session_start();
require '..\dbconfig\config.php';

if(isset($_POST['sendnot']))
{
	$targetpeople =$_POST['targetpeople'];
	$title        =$con->real_escape_string($_POST['title']);
	$message      =$_POST['message'];

  if($_FILES['efile']['error']!=4){
    $target_dir   ="../uploads/admin_notif/";
    $filename     = basename($_FILES['efile']['name']);

    $target_file  =$target_dir.$filename;

    if(!move_uploaded_file($_FILES['efile']['tmp_name'],$target_file)) {
      echo "<script type='text/javascript'> alert('Error in book upload');</script>";
      
    }
  }

  $query="INSERT into admin_notifications 
            (target, title, message, upload)
            values(?,?,?,?)";
    $query_run = $con->prepare($query);
    if(!$query_run)
        echo $con->error;
    else{    
      $query_run->bind_param('ssss', $targetpeople, $title, $message, $filename);
    
      if($query_run->execute()){
        echo "<script type='text/javascript'> alert('data updated');</script>";	
      }
      else{
        echo "<script type='text/javascript'> alert('unsuccessfull updation ". $con->error ."');</script>";
      }
    }
	
	
	
	
}


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
<title>ADMIN NOTIFICATION</title>

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
                <h4>Send Notifications</h4>
      
		</div>
        </nav>


<div class="container" >
<form  action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST" enctype="multipart/form-data">
<div class="form-group">
  <label >Target people:</label>
  <select class='form-control' id="targetpeople" name="targetpeople" required>
    <option value="student">student</option>
    <option value="professor">professor</option>
    <option value="both">both</option>
  </select>
</div>
<div class="form-group">
  <label>Title</label></br>
  <input type="text" class='form-control' placeholder='Enter title' name="title" required></input>
</div>
<div class="form-group">
  <label>Message</label></br>
  <textarea rows="5" class='form-control' placeholder='Enter Message' name="message" required ></textarea>
</div>
<div class="form-group">
<label>Upload</label></br>
<input class='form-control' type="file" name="efile"></input>
</div>
<div class="form-group mt-5" >
<button type="submit" name="sendnot"class="btn btn-primary">Send Message</button>
</div>
</form>
</div>
</div></div>

<script src="../dash_style/main.js"></script>
</body>
</html>