<?php
require  '../dbconfig/config.php';

?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"  type="text/javascript" integrity="sha512-+NqPlbbtM1QqiK8ZAo4Yrj2c4lNQoGv8P79DPtKzj++l5jnN39rHA/xsqn8zE9l0uSoxaCdrOgFs6yjyfbBxSg==" crossorigin="anonymous"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="../dash_style/style.css">
<title>student requests</title>

</head>

<body>
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
            <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>
		</div>
        </nav>


<div class="container" >
<div class="row">
<h4><center>All Professor Details</center></h4>
<div class="container" >
<div class="row">

<form >
<input type="text" name="Search" placeholder="Search..." id="myinput" style="width:200%" />
</br>
</br>
</form>

<table class="table table-bordered table-striped table-dark  ">
    <thead>
      <tr>
	    <th>S.No</th>
        <th>Profnumber</th>
        <th>Name</th>
        <th>Password</th>
	
		<th>Edit</th>
		<th>Delete</th>
		
      </tr>
    </thead>
    <tbody class="tbody"> 
	<?php
	   $sql="select * from prof_details";
    
	   $res=$con->query($sql);
	   if($res->num_rows >0)
	   {      $i=0;
	          while($row=$res->fetch_assoc()) 
			  {
				  $i++;
				  echo "<tr>
				     <td>{$i}</td>
					   <td>{$row['profno']}</td>
			       <td>{$row['name']}</td>
					   <td>{$row['password']}</td>
					 
					   <td><button type='button' class='btn btn-success editbtn' data-bs-toggle='modal' data-bs-target='#editmodal'>Edit
</button>
					   
					   <td><button type='button' class='btn btn-danger deletebtn' data-bs-toggle='modal' data-bs-target='#DeleteConfirm'>
 Delete
</button>
					   </tr>";
					   
					   
			  }
	   }
	   else{
		   echo "No records found";
	   }
	
	?>
      
    </tbody>
  </table>
  
  <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="editmodal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="prof_details.php" method="POST" >
<div class="form-group align-items-center">
<input type="hidden" id="sno"></input>
<label class="control-label" ><i class="fas fa-lock fa-1.5x"></i> profno</label>
<input type="text"  class="form-control" name="profid"  id="profid"></div>
<div class="form-group">
<label class="control-label" ><i class="fa fa-address-card" ></i> Prof Name</label>
<input type="text"  class="form-control" name="profname" id="profname"></div>
<div class="form-group">
<label class="control-label" ><i class="fa fa-birthday-cake"></i> Prof password</label>
<input type="text"  class="form-control" name="profpass" id="profpass"></div>
<input type="hidden" id="noofcourses"></input>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" name="update">Update</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="DeleteConfirm" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Delete Confirmation</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div><form action="prof_details.php" method="POST">
      <div class="modal-body">
	  
        <h5>Are You sure want to delete this record?</h5>
		<input type="text" name="delete_id" id="delete_id"></input>
      </div>
      <div class="modal-footer" >
        
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="close">Close</button>
		<button type="submit" class="btn btn-danger" name="delete" >Delete</button>
      </div></form>
    </div>
  </div>
</div>
<?php

if(isset($_POST['delete']))
{
	
	$id=$_POST['delete_id'];
	
	$query="delete from prof_details WHERE profno='$id'";
	$query_run=mysqli_query($con,$query);
	
	if($query_run){
		echo "<script type='text/javascript'> alert('data deleted');</script>";
		
	}
	else{
		echo "<script type='text/javascript'> alert('unsuccessfull deletion');</script>";
		
	}
	
}


?>
<?php

if(isset($_POST['update']))
{
	
	$id=$_POST['profid'];
	$profname=$_POST['profname'];
	$profpass=$_POST['profpass'];
	$query="update prof_details set name='$profname',password='$profpass' where profno='$id'";
	$query_run=mysqli_query($con,$query);
	
	if($query_run){
		echo "<script type='text/javascript'> alert('data updated');</script>";
		
	}
	else{
		echo "<script type='text/javascript'> alert('unsuccessfull updation');</script>";
		
	}
	
}


?>

	<script>
jQuery(document).ready(function($){
$(document).ready(function(){
	$('.editbtn').on('click',function(){
		$('#editmodal').modal('show');
          var currrow=$(this).closest('tr');
          var data1=currrow.find('td:eq(1)').text();
		  var data2=currrow.find('td:eq(2)').text();
		  var data3=currrow.find('td:eq(3)').text();
		   
		 $('#profid').val(data1);
		  $('#profname').val(data2);
		   $('#profpass').val(data3);
		  console.log(data1);
		   console.log(data2);
		    console.log(data3);
		  
			 
});
});
});		  
          		  
</script>
	<script>
jQuery(document).ready(function($){
$(document).ready(function(){
	$('.deletebtn').on('click',function(){
		$('#DeleteConfirm').modal('show');
          var currrow=$(this).closest('tr');
          var data1=currrow.find('td:eq(1)').text();
		 // var data2=currrow.find('td:eq(2)').text();
		//  var data3=currrow.find('td:eq(3)').text();
		   
		 $('#delete_id').val(data1);
		 // $('#profname').val(data2);
		 //  $('#profpass').val(data3);
		  console.log(data1);
		 //  console.log(data2);
		  //  console.log(data3);
		  
			 
});
});
});		  
 		         		  
</script>
<script src="../dash_style/main.js"></script>
<script>
$(document).ready(function(){
		$('#myinput').on("keyup",function(){
			var value=$(this).val().toLowerCase();
			$('.tbody tr').filter(function(){
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	
				
			});
			
			
		});
		
	});
</script>
</body>
</html>
