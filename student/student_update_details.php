<?php
session_start();
require '../dbconfig/config.php';

if(isset($_POST['send']))
{   
    
	$rollno=$con->real_escape_string($_POST['rollno']);
	$title=$con->real_escape_string($_POST['title']);
	$request=$_POST['request'];

	
	$query=$con->prepare("insert into student_update(rollno,title,request) values (?,?,?)");
  $query->bind_param('sss',$_SESSION['sroll_no'],$title,$request);
	
 
	if($query->execute()){
		echo "<script type='text/javascript'> alert('sucessfully requested');</script>";
	}
	else{
		echo "<script type='text/javascript'> alert('unsuccess');</script>";
		
	}
}



?>

<!DOCTYPE html>
<html>
<head>
<title>Update Details</title>
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
              <h4>SEND REQUEST TO ADMIN</h4>
            </div>


          </div>
        </nav>


 <div class="container-fluid p-0" id="enrolledcourses">

        <div class="container">
               
              <form class="update_form" action="student_update_details.php" method="POST">
              <div class="form-group">
                <input type="hidden" class="form-control" name="rollno" value="<?php echo $_SESSION['sroll_no'];?>">
                <label class="control-label"><i class="fa fa-lock fa-1.5x"></i>Title</label>
                <input type="text" placeholder="Title" class="form-control" name="title">
              </div>
              <div class="form-group">
                <label class="control-label"><i class="fa fa-address-card" ></i>Request</label>
                <textarea rows="4" cols="70" name="request" class="form-control" style="margin-left:10px"></textarea>
              </div>
              <div class='form-group'>
                <button  name="send" class="btn btn-success" id="sendbtn" type="submit">SEND REQUEST TO ADMIN</button>
              </div>
              </form>
              </div>


<hr>

<div class='container'>
<h4 class='text-center'>Previous Requests</h4>
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
      $roll = $_SESSION['sroll_no'];
	   $sql="SELECT * from student_update WHERE rollno = $roll ORDER BY logs DESC";
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
       
					   <td><button name='submit' 
                              class='btn btn-<?php if($row['status'])
                                                            echo "success";
                                                            else
                                                            echo "danger";?>'>
                                                            
                                      <?php if($row['status'])
                                                            echo "Taken Care of";
                                                            else
                                                            echo "Not Responded";?></button></td>
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
    </div>
  </div>
</div>
</div>

    <script src="../dash_style/main.js"></script>

</body>

</html>
