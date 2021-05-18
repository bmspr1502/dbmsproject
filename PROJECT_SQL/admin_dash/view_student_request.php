<?php
require 'C:\xampp\htdocs\PROJECT_SQL\dbconfig\config.php';
require "acommon_dash.php"
?>
<!DOCTYPE html>
<html>
<head>
<title>student requests</title>
 <!-- Required meta tags -->
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <link href="/PROJECT_SQL/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
    <link href="/PROJECT_SQL/bootstrap/css/stddashstyle.css" rel="stylesheet" >
<link href="/PROJECT_SQL/fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
</head>
<body>
<div class="container" >
<div class="row">
<h4><center>Students Requests</center></h4>

<table class="table table-bordered">
    <thead>
      <tr>
	    <th>S.No</th>
        <th>Rollno</th>
        <th>newpassword</th>
        <th>newname</th>
		<th>newdob</th>
		<th>newaddress</th>
      </tr>
    </thead>
    <tbody>
	<?php
	   $sql="select * from student_update";
	   $res=$con->query($sql);
	   if($res->num_rows >0)
	   {      $i=0;
	          while($row=$res->fetch_assoc()) 
			  {
				  $i++;
				  echo "<tr>
				       <td>{$i}</td>
					   <td>{$row['rollno']}</td>
			           <td>{$row['newpassword']}</td>
					   <td>{$row['newname']}</td>
					   <td>{$row['newdob']}</td>
					   <td>{$row['newaddress']}</td>
					   </tr>";
					   
					   
			  }
	   }
	   else{
		   echo "No records found";
	   }
	
	?>
      
    </tbody>
  </table>



</body>
</html>
