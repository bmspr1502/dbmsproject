<?php
session_start();
require "../dbconfig/config.php";

?>
<!DOCTYPE html>
  <html> 
<head>
<title>Update Details</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
            <a href="course_details.php"><span class="fa fa-book"></span>VIEW COURSE DETAILS</a>
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


          </div>
        </nav>


        <div class="container" >
<div class="row">
<h4><center>Notifications</center></h4>
<div class="container">

    <?php
    $qry = "SELECT * from admin_notifications WHERE  target='student' OR target='both'";
    

    
    $output = $con->query($qry);
    $color = array('success', 'primary', 'info', 'warning', 'danger', 'secondary', 'dark');
    $i = 0;
    while($row = $output->fetch_assoc()){
    ?>
    <div class="row">
    <div class="card text-white bg-<?php echo $color[($i+2)%7]?> mt-3" style="width:100%">
    <div class="card-header">
    <h6><?php echo $row['title']; ?></h6>
    </div>
        <div class="card-body">
            <p><?php echo $row['message'];?></p>
            <?php if($row['upload']!=NULL){
?>
            <a href="../admin_dash/<?php echo $row['upload'] ?>" target='_blank' class="float-right btn btn-primary">Click here to view</a>
            <?php 
            }
        $date = date_create($row['logs']);
        echo 'Uploaded On: ' . date_format($date, 'H:i - d F, Y') ;?>
        </div>
    </div>
</div>
    <?php
    
    $i++;
    }

    ?>
      
    </div>
  </div>
  </div>
  </div>
  </div>
  <script src="main.js"></script>
</body>
</html>

