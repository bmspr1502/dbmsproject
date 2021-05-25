<?php
  require '../dbconfig/config.php';
  require "scommondash.php";
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

  $sql="select name from course_details";
   $query_run=mysqli_query($con,$sql);
   $storeArray = Array();
   while ($row =$query_run->fetch_assoc()) {
    $storeArray[] =  $row['name'];  
}
$total=count($storeArray);
 $i=0;
 while($i < $total)
 {  
	echo '<div class="col-md-3">';
	echo   '<div class="card text-white bg-warning mb-3" style="max-width: 18rem;margin:20px;" id="cardcourse">';
	echo     '<div class="card-header">';
	echo      ' <center><i class="fa fa-book-reader fa-2x"></center></i>';            
    echo       ' <h3 class="card-title" style="text-align:center;">'; echo $storeArray[$i]; echo'</h3>
            </div>
  <div class="card-body">
  <center><a href="#">View Details</a></center>
   </div> 
   </div>
  </div>';
  $i++;
 }
 ?>                           
</div></div>
            </div>
            
        </div>

    </div>
</body>
</html>
