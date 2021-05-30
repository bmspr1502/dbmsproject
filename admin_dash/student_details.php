<?php
session_start();
require  '../dbconfig/config.php';



if(isset($_POST['delete']))
{
	
	$id=$_POST['delete_id'];
	
	$query="delete from student_details WHERE rollno='$id'";
	$query_run=mysqli_query($con,$query);
	
	if($query_run){
		echo "<script type='text/javascript'> alert('dataleted');</script>";
		
	}
	else{
		echo "<script type='text/javascript'> alert('unsuccessfull deletion');</script>";
		
	}
	
}




if(isset($_POST['update']))
{
	
	   
	$sid=$_POST['srollno'];
	$sname=$_POST['sname'];
	$spassword=$_POST['spass'];
	$sdob=$_POST['sdob'];
	$saddress=$_POST['saddress'];
	$semail=$_POST['semail'];
	$scontactno=$_POST['scontactno'];
	
	
	
	if(!($query=$con->prepare("update student_details set name=?, password=?, DOB=?,Address=?,email=?,contactno=? where rollno=?"))){
    echo $con->error;
  }
	$query->bind_param("sssssss",$sname,$spassword,$sdob,$saddress,$semail,$scontactno,$sid);

	
	
	if($query->execute()){
		echo "<script type='text/javascript'> alert('data updated');</script>";
		
	}
	else{
		echo "<script type='text/javascript'> alert('unsuccessfull updation".$con->error."');</script>";
          
		
		
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
			<div class='mx-auto text-center'>
              <h4>All Students Details</h4>
		      </div>
        </nav>



<div class="container" >
<div class="row">
<div class="container">
<form>
<input type="text" name="Search" placeholder="Search..." id="myinput" style="width:100%" class="form-control"/>
<br>
<br>

</form>
</div>
<div style="overflow-x:auto;">
<table class="table table-bordered table-dark table-striped">
    <thead>
      <tr>
	    <th>S.No</th>
        <th>Rollno</th>
        <th>Name</th>
        <th>Password</th>
        <th>DOB</th>
        <th>Address</th>
        <th>Email</th>
        <th>Contact No</th>
		    <th>Edit</th>
		    <th>Delete</th>
		
      </tr>
    </thead>
    <tbody class="tbody">
	<?php
	   $query="select * from student_details";
	   $result=mysqli_query($con,$query);
	   if($result->num_rows >0)
	   {      $i=0;
	          while($row=$result->fetch_assoc() )
			  {
				  $i++;
				  echo "<tr>
				      <td>{$i}</td>
					   <td>{$row['rollno']}</td>
			       <td>{$row['name']}</td>
					   <td>{$row['password']}</td>
					   <td>{$row['DOB']}</td>
					   <td>{$row['Address']}</td>
					   <td>{$row['email']}</td>
					   <td>{$row['contactno']}</td>
					   <td><button type='button' class='btn btn-success editbtn' data-bs-toggle='modal' data-bs-target='#editmodal'>Edit</button></td>
					   <td><button type='button' class='btn btn-danger deletebtn' data-bs-toggle='modal' data-bs-target='#DeleteConfirm'>Delete</button></td>
					   </tr>";
					   
					   
			  }
	   }
	   else{
		   echo "No records found";
	   }
	
	?>
      
    </tbody>
  </table>
</div>
 <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="editmodal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit Details</h5>
        <button type="button" class="btn-close close" data-dismiss="modal" aria-label="Close">&times;</button>
      </div>
      <div class="modal-body">
        <form action="student_details.php" method="POST" >
      
<div class="form-group align-items-center">

<label class="control-label" ><i class="fa fa-lock "></i> rollno</label>
<input type="hidden"  class="form-control" name="srollno"  id="srollno"  ></div>
<div class="form-group">
<label class="control-label" ><i class="fa fa-address-card" ></i>  Name</label>
<input type="text"  class="form-control" name="sname" id="sname"></div>
<div class="form-group">
<label class="control-label" ><i class="fa fa-birthday-cake"></i> Password</label>
<input type="text"  class="form-control" name="spass" id="spass"></div>
    
      <div class="form-group">
<label class="control-label" ><i class="fa fa-birthday-cake"></i> DOB</label>
<input type="text"  class="form-control" name="sdob" id="sdob"></div>
      
      <div class="form-group">
<label class="control-label" ><i class="fa fa-birthday-cake"></i> Address</label>
<input type="text"  class="form-control" name="saddress" id="saddress"></div>
      
      <div class="form-group">
<label class="control-label" ><i class="fa fa-birthday-cake"></i> Email</label>
<input type="email"  class="form-control" name="semail" id="semail"></div>
      
      <div class="form-group">
<label class="control-label" ><i class="fa fa-birthday-cake"></i> Contact no</label>
<input type="text"  class="form-control" name="scontactno" id="scontactno"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" name="update">Update</button>
      </div></form>
    </div>
  </div>
</div>
<div class="modal fade" id="DeleteConfirm" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Delete Confirmation</h5>
        <button type="button" class="btn-close close" data-dismiss="modal" aria-label="Close">X</button>
      </div><form action="student_details.php" method="POST">
      <div class="modal-body">
	  
        <h5>Are You sure want to delete this student? This action is not undoable.</h5>
		<input type="hidden" name="delete_id" id="delete_id"></input>
      </div>
      <div class="modal-footer" >
        
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close">Close</button>
		<button type="submit" class="btn btn-danger" name="delete" >Delete</button>
      </div></form>
    </div>
  </div>
</div>



   
	<script>
$(document).ready(function(){
	$('.editbtn').on('click',function(){
		$('#editmodal').modal('show');
          var currrow=$(this).closest('tr');
          var data1=currrow.find('td:eq(1)').text();
		  var data2=currrow.find('td:eq(2)').text();
		  var data3=currrow.find('td:eq(3)').text();
		  var data4=currrow.find('td:eq(4)').text();
		  var data5=currrow.find('td:eq(5)').text();
		  var data6=currrow.find('td:eq(6)').text();
		  var data7=currrow.find('td:eq(7)').text();
		   
		 $('#srollno').val(data1);
		  $('#sname').val(data2);
		   $('#spass').val(data3);
		   $('#sdob').val(data4);
		   $('#saddress').val(data5);
		   $('#semail').val(data6);
		   $('#scontactno').val(data7);
		  console.log(data1);
		   console.log(data2);
		    console.log(data3);
		  
			 
});
});
		  
          		  
</script>
	<script>
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
  
          		  
</script>	</script>
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
