<?php
session_start();
require '../dbconfig/config.php';
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
    <link rel="stylesheet" href="../dash_style/style.css">
<title>Profile Details</title>

</head>
<body>



<div class="wrapper d-flex align-items-stretch">
<nav id="sidebar" class="active">
			
      <h1><a href="#" class="logo">CMS</a></h1>
        <ul class="list-unstyled components mb-5">
         <li class="active">
           <a href="profdash.php"><span class="fa fa-home"></span>DASHBOARD</a>
         </li>
      <li>
           <a href="professor_profile_details.php"><span class="fa fa-user"></span><?php  echo $_SESSION['pname']?>'s PROFILE DETAILS</a>
         </li>
         <li>
           <a href="adtoprofnotifications.php"><span class="fa fa-bell"></span>ADMIN NOTIFICATIONS</a>
         </li>
         <li>
           <a href="course_details.php#navStudentDetails" onclick='show_course_details()'><span class="fa fa-sticky-note"></span>VIEW COURSE DETAILS</a>
         </li>
     <li>
           <a href="course_details.php#navCourseMaterials" onclick='show_course_materials()'><span class="fa fa-upload"></span>UPLOAD STUDY MATERIALS</a>
         </li>
     <li>
           <a href="course_details.php#navCourseNotifications" onclick='show_course_notifications()'><span class="fa fa-paper-plane"></span> SEND NOTIFICATION</a>
         </li>
         <li>
           <a href="course_details.php#navCourseDiscussion" onclick='show_course_discussion()'><span class="fa fa-indent"></span>COURSE DISCUSSIONS</a>
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
                <h4>Prof. <?php echo $_SESSION['pname'];?>'s Details</h4>
            </div>

            </div>
        </nav>
        <div class="container-fluid p-0 text-center">
	    <div class="container text-center" id="box">
        

        <img src="../images/software-engineer-vector-6122111.jpg" style="width:10%;"></br></br>
			
      <?php 
 $sql="select * from prof_details where profno={$_SESSION['pid']}";

     
      $query_run=mysqli_query($con,$sql);
  if($query_run->num_rows >0)
  { 
              while($row=$query_run->fetch_assoc())
              { 
              ?>
            <div class="row justify-content-center">
          <div class="col-auto">
          <div style="overflow-x:auto;">
      <table class="table table-responsive table-dark table-striped">
              <tr>
                <th>DETAILS</th>
                <th>VALUES</th>
              
              </tr>
              <tr>
              <td>Id</td>  
              <td><?php echo $row['profno']; ?></td> 
            </tr>
              <tr>
              <td>Name</td>  
              <td><?php echo $row['name']; ?></td> 
            </tr>
            <tr>
              <td>Email</td>  
              <td><?php echo $row['email']; ?></td> 
            </tr>
            <tr>
              <td>Contact No</td>  
              <td><?php echo $row['contact no']; ?></td> 
            </tr>
                  
            
           
           
           
           <?php 
           
          
          }
              

  }
?>

<?php
 $sql="select * from course_details where profno={$_SESSION['pid']}";

     
 $query_run=mysqli_query($con,$sql);
if($query_run->num_rows >0)
{
?>
        <tr>
          <td>No. of courses teaching</td>
          <td><?php echo $query_run->num_rows; ?></td>
        </tr>
        </table>
        </div>
      </div>
    </div>

<?php
}?>
</div>
</div>	   

    </div>
    </div>
</div>
<script src="../dash_style/main.js"></script>
</form>
</body>

</html>