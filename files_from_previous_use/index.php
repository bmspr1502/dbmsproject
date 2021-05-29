<?php
   session_start();
   require 'PROJECT_SQL/dbconfig/config.php'
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <title></title>

  <style>
    .jumbotron {
	  background-image : url("ba.gif");
	  background-position:cover;
	  background-repeat:repeat;

	  

    }

    .jumbotron h1 {
	 padding-top:10px;
    text-align:center;
    font-family: Sans-serif;
    font-size: 70px;

    }

    .alert {
      margin: 0px;
    }

	.a{
	background-image : url("bgr.gif");
	}
    .bs-example {
      margin:0px;
	  position: sticky;
    }

    .navbar-brand {
      font-size: 20px;
      font-family: sans-serif;
    }
	.card {
      box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
      max-width: 300px;
      margin: auto;
      text-align: center;
      font-family: arial;
    }

    .title {
      color: grey;
      font-size: 18px;
    }

    button {
      border: none;
      outline: 0;
      display: inline-block;
      padding: 8px;
      color: white;
      background-color: #000;
      text-align: center;
      cursor: pointer;
      width: 100%;
      font-size: 18px;
    }

    button:hover,
    a:hover {
      opacity: 0.7;
    }

    .grid-container {
      display: grid;
      grid-template-columns: auto auto auto;
      padding: 10px;
    }

    a:link {
      text-decoration: none;
    }

    a {
      color: white;
    }
	

    .glow {
      font-size: 70px;
      color: #ffffff;
      text-align: center;
      -webkit-animation: glow 1s ease-in-out infinite alternate;
      -moz-animation: glow 1s ease-in-out infinite alternate;
      animation: glow 1s ease-in-out infinite alternate;
    }

    footer {
      padding: 0px 0px 0px 0px;
      background-color: black;
      margin: 0px;
    }

    .fa {
      padding: 20px;
      font-size: 23px;
      width: 60px;
      text-align: center;
      text-decoration: none;
      margin: 5px 2px;
      border-radius: 50%;
    }

    .fa:hover {
      opacity: 0.5;
      text-decoration: none;
    }

    .fa-facebook {
      background: #3B5998;
      color: white;
      margin-top: 30px;
    }

    .fa-whatsapp {
      background: #25d366;
      color: white;
    }

    .fa-twitter {
      background: #55ACEE;
      color: white;
    }

    .fa-instagram {
      background: #125688;
      color: white;
    }

    p {
      text-align: center;

    }
	
    @-webkit-keyframes glow {
      from {
        text-shadow: 0 0 10px #eeeeee, 0 0 20px #000000, 0 0 30px #000000, 0 0 40px #000000, 0 0 50px #9554b3, 0 0 60px #9554b3, 0 0 70px #9554b3;
      }

      to {
        text-shadow: 0 0 20px #eeeeee, 0 0 30px #ff4da6, 0 0 40px #ff4da6, 0 0 50px #ff4da6, 0 0 60px #ff4da6, 0 0 70px #ff4da6, 0 0 80px #ff4da6;
      }
    }
  </style>

</head>

<body>
 <div class="jumbotron" style="margin-bottom:0px;margin-top: 0px;">
    <h1 class="display-14 glow">COURSE MANAGMENET SYSTEM</h1>

  </div>

  <div class="bs-example">
    <nav class="navbar navbar-expand-md bg-dark navbar-dark fixed">
      <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
        	
        <div class="navbar-nav">
		<a href="#HOME" class="nav-item nav-link">HOME</a>
          <a href="#ABOUT US" class="nav-item nav-link">ABOUT US</a>
          <a href="#CONTACT US" class="nav-item nav-link">CONTACT US</a>
        </div>

      </div>
    </nav>
  </div>
  
  
  
  <div class ="a">
  <br><br>
<div class="grid-container">
    <div class="grid-item">
      <div class="card">
	  <div class="container">
	<div class="row">
	<div class=" col-xs-12 ">
			<div class="d-flex justify-content-center">
					<div class="brand_logo_container">
						<img src="student.png" alt="John" style="width:100%">
					</div>
				</div><br>
				<h4>STUDENT</h4>
				<div class="d-flex justify-content-center form_container">
					<form action="homlof.php" class="myform" method="POST">
						<div class="input-group">
							<div class="input-group-append">
								<span class="input-group"></span>
							</div>
											
							
							<input type="text" name="SROLLNUMBER" class="form-control input_user" value="" placeholder="ROLL NUMBER" required>
						</div>
						<div class="input-group">
							<div class="input-group-append">
								<span class="input-group"></span>
							</div>
							<input type="password"  name="SPASSWORD" class="form-control input_pass" value="" placeholder="PASSWORD" required>
						</div><br>
						
					<div class="d-flex justify-content-center  login_container">
					<input type="submit"  name="SLOGIN" class="btn btn-info" value="LOGIN">
				 	
				   </div>
					</form>
					</div>
					</div>
						</div>
					</div>
						</div>
					</div><br><br><br><br><br>
					    <div class="grid-item">
      <div class="card">
	  <div class="container">
	<div class="row">
	<div class="col-xs-12">
			<div class="d-flex justify-content-center">
					<div class="brand_logo_container">
						<img src="teacher.jpg" alt="John" style="width:100%">
					</div>
				</div><br>
				<h4>PROFESSOR</h4>
				<div class="d-flex justify-content-center form_container">
					<form action="homlof.php" class="myform" method="POST">
						<div class="input-group">
							<div class="input-group-append">
								<span class="input-group"></span>
							</div>
											
							
							<input type="text" name="PPROFESSORID" class="form-control input_user" value="" placeholder="PROFESSOR ID">
						</div>
						<div class="input-group">
							<div class="input-group-append">
								<span class="input-group"></span>
							</div>
							<input type="password" name="PPASSWORD"  class="form-control input_pass" value="" placeholder="PASSWORD">
						</div><br>
						
					<div class="d-flex justify-content-center  login_container">
					<input type="submit" name="PLOGIN" class="btn btn-info" value="LOGIN">
				 	
				   </div>
					</form>
					</div>
					</div>
						</div>
					</div>
						</div>
					</div><br><br><br><br><br>
					    <div class="grid-item">
      <div class="card">
	  <div class="container">
	<div class="row">
	<div class="col-xs-2"></div>
	<div class="col-xs-8">
			<div class="d-flex justify-content-center">
					<div class="brand_logo_container">
						<img src="admin.png" alt="John" style="width:80%">
					</div>
				</div><br>
				<h4>ADMIN</h4>
				<div class="d-flex justify-content-center form_container">
					<form action="homlof.php" class="myform" method="POST">
						<div class="input-group">
							<div class="input-group-append">
								<span class="input-group"></span>
							</div>
											
							
							<input type="text" name="AADMINID" class="form-control input_user" value="" placeholder="ADMIN ID" required>
						</div>
						<div class="input-group">
							<div class="input-group-append">
								<span class="input-group"></span>
							</div>
							<input type="password" name="APASSWORD" class="form-control input_pass" value="" placeholder="PASSWORD" required>
						</div><br>
						
					<div class="d-flex justify-content-center  login_container">
					<input type="submit" name="ALOGIN" class="btn btn-info" value="LOGIN">
				 	
				   </div>
					</form>
					</div>
					</div>
					<div class="col-xs-2"></div>
						</div>
					</div>
						</div>
					</div>
        

					</div>
						</div>

  

  <footer>


  <br>
  <div class="container">
    <div class="row">
	<div class="col-sm-12" style="color:#ffffff"  id="ABOUT US">
	<p><b>ABOUT US</b></p><br>
<p style="color:ghostwhite"><i>We all have faced the problem where we would have missed some information that was sent in the official groups,sometimes lost track of the information sent.  Some have thought of designing a course management system where for each course the professor can directly send the details and any other announcements to the students.</i></p>
	</div>
	</div>
	</div>
      <br><br><br>
	  
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div style="color:#ffffff;" class="wow fadeInUp footer-copyright" id="CONTACT US">
		 <p>CONTACT US</p>
		 <p>
		 
    <a href="https://www.facebook.com/AnnaUniversityImpUpdates/" class="fa fa-facebook"></a>
    <a href="https://www.instagram.com/anna_university/" class="fa fa-instagram"></a>
    <a href="https://twitter.com/annauniversity?lang=en" class="fa fa-twitter"></a>
  </p>
          <p>Made in India <br>
            Copyright &copy; 2021 </p>
        </div>
      </div>
    </div>
  </div>
</footer>

   <?php
if(isset($_POST['SLOGIN']))
{
	$srollno=$_POST['SROLLNUMBER'];
	$spassword=$_POST['SPASSWORD'];
	$query="select * from student_details WHERE rollno='$srollno' AND password='$spassword'";
	$query_run=mysqli_query($con,$query);
	if(mysqli_num_rows($query_run)>0)
	{
		$_SESSION['SROLLNUMBER']= $srollno;
		echo"<script>window.location.href='stddash.php'</script>";
	
	}
	
	else{
		echo '<script type="text/javascript"> alert(" Student Error!")</script>';
}
}
	

?>
 <?php
if(isset($_POST['PLOGIN']))
{
	$p_no=$_POST['PPROFESSORID'];
	$ppassword=$_POST['PPASSWORD'];
	$query="select * from prof_details WHERE profno='$p_no' AND password='$ppassword'";
	$query_run=mysqli_query($con,$query);
	if(mysqli_num_rows($query_run)>0)
	{
		$_SESSION['PPROFESSORID']= $p_no;
		echo"<script>window.location.href='profdash.php'</script>";	
	}
	
	else{
		echo '<script type="text/javascript"> alert(" professor Error!")</script>';
}
}
	

?>
 <?php
if(isset($_POST['ALOGIN']))
{
	$a_no=$_POST['AADMINID'];
	$apassword=$_POST['APASSWORD'];
	$query="select * from admin_login WHERE aid='$a_no' AND apassword='$apassword'";
	$query_run=mysqli_query($con,$query);
	if(mysqli_num_rows($query_run)>0)
	{
		$_SESSION['AADMINID']= $a_no;
		echo"<script>window.location.href='admindash.php'</script>";
	}
	
	else{
		echo '<script type="text/javascript"> alert("Admin Error!")</script>';
}
}
	

?>
</body>
</html>
