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
  <title>LOGIN PAGE</title>
<style> 
.headerr{
	height:100px;
  background-color:LightSteelBlue;

}

.headerr_text
{
    padding-top:20px;
    text-align:center;
    font-family:Helvetica;
    font-size: 6;
    text-align:center;
}

.alert{
      margin: 0px;
}
.a{
    background-image:url("loginbg.jpg");
	position:relative;
}
.bs-example {
    margin:0px;
	
}
.title {
    color: grey;
    font-size: 18px;
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
        text-shadow: 0 0 10px #eeeeee, 0 0 20px #000000, 0 0 30px white, 0 0 40px LightSteelBlue, 0 0 50px LightCyan  , 0 0 60px black, 0 0 70px black;
      }

      to {
        text-shadow: 0 0 20px white, 0 0 30px LightSteelBlue, 0 0 40px black, 0 0 50px white, 0 0 60px LightCyan , 0 0 70px PowderBlue  , 0 0 80px PowderBlue  ;
      }
    }
	
	.card {
      box-shadow: 5px 5px 5px rgba(0,0,255,0.3);
	  background-color:snow;
      max-width: 300px;
	  max-height:150px;
      margin: auto;
      text-align: center;
      font-family: Verdana;
	  padding: 10px 0;
	  font-size: 20px;
    }

    .title {
      color: grey;
      font-size: 18px;
}
    .grid-container {
    display: grid;
	grid-template-columns: minmax(30vw, 1fr);
	grid-template-rows: minmax(30vh, 1fr);
	align-items: center;
	justify-content: center;    
    }

    a:link {
      text-decoration: none;
    }

    a {
      color: white;
    }
	
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}
     
button {
  background-color: #04AA6D;
  color: white;
   outline: 0;
  display: inline-block;
  padding: 14px 16px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  font-size:15px;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}


.modal {
  display: none;
  position: fixed; 
  z-index: 1; 
  left: 0;
  top: 0;
  width: 100%; 
  height: 100%;
  overflow: auto; 
  background-color: rgb(0,0,0); 
  background-color: rgba(0,0,0,0.4); 
  padding-top:10px;
}

.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 40%;
}

.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}
.sticky {
  position: fixed;
  top: 0;
  width: 100%;
}

@media screen and (max-width: 300px) {
  .cancelbtn {
     width: 100%;
  }
}
</style>

</head>
<body id="HOME">
  <div class="bs-example">
    <nav class="navbar navbar-expand-md bg-dark navbar-dark ">	
       <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
         <span class="navbar-toggler-icon"></span>
       </button>
       <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">			
        <div class="navbar-nav">
       <a href="#HOME" class="navbar-brand">HOME</a>
     <a href="#STUDENT" class="nav-item nav-link">STUDENT</a>
     <a href="#PROFESSOR" class="nav-item nav-link">PROFESSOR</a>
         <a href="#ADMIN" class="nav-item nav-link">ADMIN</a>
     <a href="#ABOUT US" class="nav-item nav-link">ABOUT US</a>
         <a href="#CONTACT US" class="nav-item nav-link">CONTACT US</a>
         </div>
       </div>
     </nav>
 </div>
 <div class="headerr";">
    <h1 class="headerr_text glow"><b>𝓒𝓔𝓖 𝓒𝓜𝓢</b></h1>
</div>


<div class="a" > 
<div class="grid-container">
    <div class="grid-item">
      <div class="card">
	   <div class="container">
	    <div class="row">
        	<div class="col-sm-12" id="STUDENT">

	         <h2>STUDENT</h2>
				<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">LOGIN</button>
					<div id="id01" class="modal">
  
						<form class="modal-content animate" action="index1.php" method="post">
							<div class="imgcontainer">
                                <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
                                   <img src="stud.png" alt="Avatar" class="avatar">
                            </div>

							<div class="container">
      <label><b>STUDENT ID</b></label>
						<input type="text" placeholder="ENTER STUDENT ID" name="SROLLNO" required>

      <label><b>PASSWORD</b></label>
      <input type="password" placeholder="ENTER PASSWORD" name="SPASSWORD" required>
        
      <button type="submit" name="SLOGIN">LOGIN</button>
      <label>
        <input type="checkbox" checked="checked" name=""> REMEMBER ME
      </label>
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">CANCEL</button>
    </div>
  </form>
</div>
</div>

</div>
</div>
</div>
</div>
</div>
<div class="grid-container">
    <div class="grid-item">
      <div class="card">
	  <div class="container">
	<div class="row">
	<div class="col-sm-12">
	<div id="PROFESSOR">
	<h2>PROFESSOR</h2>
	</div>

<button onclick="document.getElementById('id02').style.display='block'" style="width:auto;">LOGIN</button>

<div id="id02" class="modal">
  
  <form class="modal-content animate" action="index1.php" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="teacher.jpg" alt="Avatar" class="avatar">
    </div>

    <div class="container">
      <label><b>PROFESSOR ID</b></label>
      <input type="text" placeholder="ENTER PROFESSOR ID" name="PID" required>

      <label><b>PASSWORD</b></label>
      <input type="password" placeholder="ENTER PASSWORD" name="PPASSWORD" required>
        
      <button type="submit" name="PLOGIN">LOGIN</button>
      <label>
        <input type="checkbox" checked="checked" name=""> REMEMBER ME
      </label>
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">CANCEL</button>

    </div>
  </form>
</div>
</div>

</div>
</div>
</div>
</div>
</div>
<div class="grid-container">
    <div class="grid-item">
      <div class="card">
	  <div class="container">
	<div class="row">
	<div class="col-sm-12">
	<div id="ADMIN">
	<h3>ADMIN</h3>
	</div>

<button onclick="document.getElementById('id03').style.display='block'" style="width:auto;">LOGIN</button>

<div id="id03" class="modal">
  
  <form class="modal-content animate" action="index1.php" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id03').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="admin.jpg" alt="Avatar" class="avatar">
    </div>

    <div class="container">
      <label><b>ADMIN ID</b></label>
      <input type="text" placeholder="ENTER ADMIN ID" name="AID" required>

      <label><b>PASSWORD</b></label>
      <input type="password" placeholder="ENTER PASSWORD" name="APASSWORD" required>
        
      <button type="submit" name="ALOGIN">LOGIN</button>
      <label>
        <input type="checkbox" checked="checked" name="">REMEMBER ME
      </label>
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id03').style.display='none'" class="cancelbtn">CANCEL</button>

    </div>
  </form>
</div>
</div>

</div>
</div>
</div>
</div>
</div>

<script>

var modal = document.getElementById('id01');
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

<script>
var modal = document.getElementById('id02');
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

<script>
var modal = document.getElementById('id03');
window.onclick = function(event){
    if (event.target == modal){
        modal.style.display = "none";
    }
}
</script>
</div>


<footer>
  <div class="container">
    <div class="row">
	<div class="col-sm-12"  style="color:#ffffff"  id="ABOUT US">
	<div style="font-family:verdana">
	<p> ABOUT US</p><br>
<p style="color:ghostwhite">We all have faced the problem where we would have missed some information that was sent in the official groups,sometimes lost track of the information sent.  Some have thought of designing a course management system where for each course the professor can directly send the details and any other announcements to the students.</p>
     </div>
	</div>
	</div>
	</div>

	  
<div class="container">
    <div class="row">
      <div class="col-md-12">
        <div style="color:#ffffff" class="wow fadeInUp footer-copyright" id="CONTACT US">
		 <p >CONTACT US</p>
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
		echo"<script>window.location.href='PROJECT_SQL/stddash.php'</script>";
	
	}
	
	else{
		echo '<script type="text/javascript"> alert(" Student Error!")</script>';
}
}
	

?>
 <?php
if(isset($_POST['PLOGIN']))
{
	$p_no=$_POST['PID'];
	$ppassword=$_POST['PPASSWORD'];
	$query="select * from prof_details WHERE profno='$p_no' AND password='$ppassword'";
	$query_run=mysqli_query($con,$query);
	if(mysqli_num_rows($query_run)>0)
	{
		$_SESSION['PPROFESSORID']= $p_no;
		echo"<script>window.location.href='PROJECT_SQL/professor/profdash.php'</script>";	
	}
	
	else{
		echo '<script type="text/javascript"> alert(" professor Error!")</script>';
}
}
	

?>
 <?php
if(isset($_POST['ALOGIN']))
{
	$a_no=$_POST['AID'];
	$apassword=$_POST['APASSWORD'];
	$query="select * from admin_login WHERE aid='$a_no' AND apassword='$apassword'";
	$query_run=mysqli_query($con,$query);
	if(mysqli_num_rows($query_run)>0)
	{
		$_SESSION['AID']= $a_no;
		echo"<script>window.location.href='PROJECT_SQL/admin_dash/admindash.php'</script>";
	}
	
	else{
		echo '<script type="text/javascript"> alert("Admin Error!")</script>';
}
}
	

?>
</body>
</html>
