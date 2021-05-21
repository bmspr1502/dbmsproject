<?php
    session_start();
  require '../dbconfig/config.php';
  require"pcommondash.php";
?>
<!DOCTYPE html>
<html>
<head>
<title>view_all_course</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" >
    <link href="../bootstrap/css/stddashstyle.css" rel="stylesheet" >
	<link href="../fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
</head>
<body>
 <div class="container-fluid p-0" id="enrolledcourses">
        <h3 style="margin:20px">All Courses:</h3>
     <div class="container" id="box">
    <div class="row">
                
<?php 
    //print_r($_SESSION);
  $sql="select course_details.courseid, course_details.name as 'course_name', prof_details.profno, prof_details.name as 'prof_name' from course_details inner join prof_details on course_details.profno = prof_details.profno where course_details.profno = ". $_SESSION['pid'];
   if($query_run=$con->query($sql)){
    $storeArray = Array();
    while ($row =$query_run->fetch_assoc()) {
        ?>
        <div class="col-md-3">
        <div class="card text-white bg-warning mb-3" style="max-width: 18rem;margin:20px;" id="cardcourse">
        <div class="card-header">
        <center><i class="fa fa-book-reader fa-2x"></center></i>            
        <h3 class="card-title" style="text-align:center;"><?php echo $row['course_name'];?></h3>
                </div>
    <div class="card-body">
        <p>Taught by: <?php echo $row['prof_name'];?></p>
    <center><a onclick="viewcourse(<?php echo $row['courseid'];?>)">View Details</a></center>
    </div> 
    </div>
    </div>
    <?php
    
    }
}else{
    echo $con->error;
}
 ?>                           
</div></div>
            </div>
            
        </div>

    </div>


    <script>

    </script>
</body>
</html>
