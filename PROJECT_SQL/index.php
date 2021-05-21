<?php
   session_start();
   require 'dbconfig/config.php'
?>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" >
    <link rel="stylesheet" href="bootstrap/css/sytle.css">

    <title>Login</title>
  </head>
  <body>
    

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="bootstrap/js/bootstrap.bundle.min.js" ></script>
    <script src="bootstrap-5.0.0/js/src/collapse.js" ></script>
    <script src="bootstrap-5.0.0/js/src/dropdown.js" ></script>
    <script src="bootstrap-5.0.0/js/src/popover.js" ></script>
    <header>
    <div class="topheader">
    <div class="container-fluid">
       

     <nav class="navbar navbar-dark  navbar-expand-md "style="background-color: #004d80">
        <a class="navbar-brand" href="#">
          <img src="images/ceglogo.png" style="height:100px ">
        </a>
        <button type="button" data-bs-toggle="collapse" data-bs-target=".navbar-collapse"  class="navbar-toggler">
            <span class="navbar-toggler-icon">
                </span>
            </button>
        <div class="collapse navbar-collapse">
      <ul class="navbar-nav">
          <li class="nav-item">
              <a class="nav-link" href="#">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About us</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Contact</a>
        </li>
            
      </ul>
    </div>

     </nav>

    </div>
    </div>
</header>
<section>
<div class="container">
  <div class="row">
        <div class="col-md-6">
            <h3>Student Login</h3>
            <img src="images/images (2).png" style="border-radius:30px"><br>
			<form action="index.php" class="myform" method="POST">
            <label>Roll No</label>
            <input type="text" name="sroll_no" placeholder="enter your roll no"required><br>
            <label>Password</label>
            <input type="password" name="spassword" placeholder="enter password" required><br>
            <input name="slogin" type="submit" value="Login "/>
			</form>

        </div>
        <div class="col-md-6">
            <h3>Professor Login</h3>
            <img src="images/images (1).png" style="border-radius:30px"><br>
			<form action="index.php" class="myform" method="POST">
            <label>Professor Id</label>
            <input name="pid" type="text" required ><br>
            <label>Password</label>
            <input name="ppassword" type="password" required><br>
            <input type="submit" name="plogin" value="Login" />
            </form>
        </div>

  </div>
  </div>
</section>





<div class="container">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="center">
            <h3><center>Admin Login</center></h3>
			
           <center><img src="images/software-engineer-vector-6122111.jpg" class="center2"> </center> <br>
		   <form action="index.php" class="myform" method="POST">
           <label>Username</label>
           <input type="text" name="aid"><br>
           <label>Password</label>
           <input type="password" name="apassword"><br>
           <input type="submit" name="alogin" value="Login" />
            </form>
            </div>
        </div>
        <div class="col-md-3"></div>
    </div>
    </div>
    
  <?php
if(isset($_POST['slogin']))
{
	$srollno=$_POST['sroll_no'];
	$spassword=$_POST['spassword'];
	$query="select * from student_details WHERE rollno='$srollno' AND password='$spassword'";
	$query_run=mysqli_query($con,$query);
	if(mysqli_num_rows($query_run)>0)
	{
		$_SESSION['sroll_no']= $srollno;
		header('location:stddash.php');
	
	}
	
	else{
		echo '<script type="text/javascript"> alert(" '. mysqli_error($con) .' Student Error!")</script>';
}
}
	

?>
 <?php
if(isset($_POST['plogin']))
{
	$p_no=$_POST['pid'];
	$ppassword=$_POST['ppassword'];
	$query="select * from prof_details WHERE profno='$p_no' AND password='$ppassword'";
	$query_run=mysqli_query($con,$query);
	if(mysqli_num_rows($query_run)>0)
	{
		$_SESSION['pid']= $p_no;
		header('location:professor/profdash.php');
	
	}
	
	else{
		echo '<script type="text/javascript"> alert(" professor Error!")</script>';
}
}
	

?>
 <?php
if(isset($_POST['alogin']))
{
	$a_no=$_POST['aid'];
	$apassword=$_POST['apassword'];
	$query="select * from admin_login WHERE aid='$a_no' AND apassword='$apassword'";
	$query_run=mysqli_query($con,$query);
	if(mysqli_num_rows($query_run)>0)
	{
		$_SESSION['aid']= $a_no;
		header('location:admin_dash/admindash.php');
	
	}
	
	else{
		echo '<script type="text/javascript"> alert("Admin Error!")</script>';
}
}
	

?>
 






    
  </body>
</html>