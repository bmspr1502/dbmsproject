<?php
 session_start();
require 'dbconfig/config.php'
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
    background-image:url("images/loginbg.jpg");
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


	.fa-linkedin{
  height: 60px;
  width: 60px;
  color:white;
  background-color:#0077b5;
}

    .fa-twitter {
      background: #55ACEE;
      color: white;
    }

    .fa-instagram {
    background: #f09433; 
	background: -moz-linear-gradient(45deg, #f09433 0%, #e6683c 25%, #dc2743 50%, #cc2366 75%, #bc1888 100%); 
	background: -webkit-linear-gradient(45deg, #f09433 0%,#e6683c 25%,#dc2743 50%,#cc2366 75%,#bc1888 100%); 
	background: linear-gradient(45deg, #f09433 0%,#e6683c 25%,#dc2743 50%,#cc2366 75%,#bc1888 100%); 
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f09433', endColorstr='#bc1888',GradientType=1 );
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
 <div class="headerr";">
    <h1 class="headerr_text glow"><b>𝓒𝓔𝓖 𝓒𝓜𝓢</b></h1>
</div>

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
  
<form class="modal-content animate" action="index1.php" method="post" id='studentForm'>
    <div class="imgcontainer">
        <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
            <img src="student/stud.png" alt="Avatar" class="avatar">
    </div>

    <div class="container">
      <label><b>STUDENT ID</b></label>
						<input type="text" placeholder="ENTER STUDENT ID" name="SROLLNO" required>

      <label><b>PASSWORD</b></label>
      <input type="password" placeholder="ENTER PASSWORD" name="SPASSWORD" required>
        
      <button type="submit" name="SLOGIN" id='SLOGIN'>LOGIN</button>
      <label>
        <input type="checkbox" checked="checked" name=""> REMEMBER ME
      </label>
    </div>
    <p id='sresult'></p>
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
  
  <form class="modal-content animate" action="index1.php" method="post" id='professorForm'>
    <div class="imgcontainer">
      <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="images/teacher.jpg" alt="Avatar" class="avatar">
    </div>

    <div class="container">
      <label><b>PROFESSOR ID</b></label>
      <input type="text" placeholder="ENTER PROFESSOR ID" name="PID" required>

      <label><b>PASSWORD</b></label>
      <input type="password" placeholder="ENTER PASSWORD" name="PPASSWORD" required>
        
      <button type="submit" name="PLOGIN" id='PLOGIN'>LOGIN</button>
      <label>
        <input type="checkbox" checked="checked" name=""> REMEMBER ME
      </label>
    </div>
    <p id='presult'></p>
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
  
  <form class="modal-content animate" action="index1.php" method="post" id='adminForm'>
    <div class="imgcontainer">
      <span onclick="document.getElementById('id03').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="admin_dash/admin.jpg" alt="Avatar" class="avatar">
    </div>

    <div class="container">
      <label><b>ADMIN ID</b></label>
      <input type="text" placeholder="ENTER ADMIN ID" name="AID" required>

      <label><b>PASSWORD</b></label>
      <input type="password" placeholder="ENTER PASSWORD" name="APASSWORD" required>
        
      <button type="submit" name="ALOGIN" id='ALOGIN'>LOGIN</button>
      <label>
        <input type="checkbox" checked="checked" name="">REMEMBER ME
      </label>
    </div>
    <p id='aresult'></p>
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
<p style="color:ghostwhite">We all have faced the problem where we would have missed some information that was sent in the official groups,sometimes lost track of the information sent.</p>
     </div>
	</div>
	 </div>
	</div>
		  
 
<div class="container">
<p style="color:white"><b>DONE BY</b></p>
    <div class="row">
      <div class="col-sm-4">
        <div style="color:#ffffff" class="wow fadeInUp footer-copyright" id="CONTACT US">
	
   <p>
	<p>DHEEPAK RAJ<P>   
	<a href="https://www.linkedin.com/in/dheepak-raaj-208a0020b/" target='_blank'  class="fa fa-linkedin"></a>
	<a href="https://www.instagram.com/rdheepakraaj/" target='_blank' class="fa fa-instagram"></a>
	<a href="https://github.com/Dheepakraaj123/" class="fa fa-github" target='_blank'  style="font-size:35px;"></a>
  </p>
        </div>
      </div>
	   <div class="col-sm-4">
        <div style="color:#ffffff" class="wow fadeInUp footer-copyright" id="CONTACT US">
   <p>	 
    	<p>PRANAVA RAMAN B M S<P>
	<a href="https://www.linkedin.com/in/pranava-raman-bms/" target='_blank'  class="fa fa-linkedin"></a>
	<a href="https://www.instagram.com/pranavaramanbms/" target='_blank' class="fa fa-instagram"></a>
	<a href="https://github.com/bmspr1502/" target='_blank' class="fa fa-github" style="font-size:35px;"></a>
</p>

	
        </div>
      </div>
	   <div class="col-sm-4">
        <div style="color:#ffffff" class="wow fadeInUp footer-copyright" id="CONTACT US">

   <p>	
	<p>SUGAVANESHWARAN K<P>   
	<a href="https://www.linkedin.com/in/sugavanesh-k-46705a205/" target='_blank'  class="fa fa-linkedin"></a>
	<a href="https://www.instagram.com/sugavanesh_k/" target='_blank' class="fa fa-instagram"></a>
	<a href="https://github.com/Sugavanesh10/" target='_blank' class="fa fa-github" style="font-size:35px;"></a>
  </p>
        </div>
      </div>
	  
	  
    </div>
	 <p style="color:white">Made with ❤ in CEG <br>
            Copyright &copy; 2021 </p>
 </div>

</footer>


<script>

    
    $(document).ready(function(){
        $('#studentForm').submit(function(event){
            event.preventDefault();

            var formValues= $(this).serialize();
            console.log(formValues);

            $.post("check.php", formValues, function(data){
                // Display the returned data in browser
                $('#sresult').html(data);
                //alert(data);
            });
        });

        $('#professorForm').submit(function(event){
            event.preventDefault();

            var formValues= $(this).serialize();
            console.log(formValues);

            $.post("check.php", formValues, function(data){
                // Display the returned data in browser
                $('#presult').html(data);
                //alert(data);
            });
        });

        $('#adminForm').submit(function(event){
            event.preventDefault();

            var formValues= $(this).serialize();
            console.log(formValues);

            $.post("check.php", formValues, function(data){
                // Display the returned data in browser
                $('#aresult').html(data);
                //alert(data);
            });
        });

    })
</script>
</body>
</html>
