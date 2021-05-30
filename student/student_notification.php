<?php
session_start();
require "../dbconfig/config.php";

?>
<!DOCTYPE html>
  <html> 
<head>
<title>Notifications</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../dash_style/style.css">
</head>
<body>
</head>
<body>
<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active">
				<h1><a href="../index.php" class="logo">CMS</a></h1>
        <ul class="list-unstyled components mb-5">
          <li class="active">
            <a href="stddash.php"><span class="fa fa-home"></span><?php echo $_SESSION['student_name'];?>'s DASHBOARD</a>
          </li>
		  <li>
            <a href="student_profile_details.php"><span class="fa fa-user"></span>PROFILE DETAILS</a>
          </li>
          <li>
            <a href="student_update_details.php"><span class="fa fa-user-plus"></span>SEND REQUEST </a>
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

            <div class='mx-auto text-center'>
                <h4>STUDENT NOTIFICATION</h4>
            </div>

          </div>
        </nav>


        <div class="container" >
<div class="row">
<div class="container">

    <?php
    $qry = "SELECT * from admin_notifications WHERE  target='student' OR target='both'
            ORDER BY logs DESC";
    

    
    $output = $con->query($qry);
    $color = array('success', 'primary', 'info', 'warning', 'danger', 'secondary', 'dark');
    $i = 0;
    while($row = $output->fetch_assoc()){
    ?>
    <div class="card text-white bg-<?php echo $color[$i%7]?> mt-3">
    <div class="card-header p-1 text-center">
    <h4><?php echo $row['title']; ?></h4>
    </div>
    <div class='row d-flex'>
    <?php if($row['upload']!=NULL){
        ?>
        <div class='col-md-3 d-flex'>
        <button onclick='window.open("../uploads/admin_notif/<?php echo $row["upload"] ?>", "_blank")' target='_blank' style='width:100%, height:100%' class="btn btn-<?php echo $color[($i+2)%7]?>">Click here to view</button>
        </div>
        <?php
    }?>
        <div class='<?php if($row['upload']!=NULL){echo "col-md-9";} else{echo "col-md-12";}?> d-flex'>
        <div class="card-body p-1">
        <blockquote class="blockquote mb-0 ml-3">
            <p><?php echo $row['message'];?></p>
            <footer class="blockquote-footer text-white p-0"><?php
         $date = date_create($row['logs']);
         echo 'Uploaded On: ' . date_format($date, 'H:i - d F, Y') ;?></footer>
            </blockquote>
         </div>
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
  <script src="../dash_style/main.js"></script>
</body>
</html>

