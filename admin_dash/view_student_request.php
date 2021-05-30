<?php
session_start();
require '../dbconfig/config.php';

if(isset($_POST['submit'])){
  $id = $_POST['notifid'];
  if($con->query("UPDATE `student_update` SET status =  status ^ 1 WHERE id = $id;")){
    echo "<script>alert('Updated');</script>";
  }else{
    echo $con->error;
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
<title>student requests</title>

</head>
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
              <h4>All Students Requests</h4>
		      </div>
		</div>
        </nav><body>


<div class="container" >
<div class="row">

<div style="overflow-x:auto;">
<table class="table table-bordered table-dark table-striped">
    <thead>
      <tr>
	    <th>S.No</th>
        <th>Rollno</th>
        <th>Title</th>
        <th>Request</th>
		    <th>logs</th>
        <th>Status</th>
      </tr>
    </thead>
    <tbody>
	<?php
	   $sql="SELECT * from student_update";
	   $res=$con->query($sql);
	   if($res->num_rows >0)
	   {      $i=0;
	          while($row=$res->fetch_assoc()) 
			  {
				  $i++;
				  echo "<tr>
				       <td>{$i}</td>
					   <td>{$row['rollno']}</td>
			           <td>{$row['title']}</td>
					   <td>{$row['request']}</td>
					   <td>{$row['logs']}</td>";
?>
        <form action='<?php echo $_SERVER['PHP_SELF']; ?>' method='post'>
        <input type='hidden' name='notifid' value='<?php echo $row['id'];?>'>
					   <td><input type='submit' name='submit'  class='btn btn-<?php if($row['status'])
                                                            echo "success";
                                                            else
                                                            echo "danger";?>'
                                                            
                                      value='<?php if($row['status'])
                                                            echo "Taken Care of";
                                                            else
                                                            echo "Not Responded";?>' /></td>
        </form>
					   </tr>
					   
<?php					   
			  }
	   }
	   else{
		   echo "No records found";
	   }
	
	?>
      
    </tbody>
  </table>
  </div>
</div></div>
</div></div>
<script src="../dash_style/main.js"></script>

</body>
</html>
