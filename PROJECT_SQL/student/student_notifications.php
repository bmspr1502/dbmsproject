<?php
require "C:/xampp/htdocs/PROJECT_SQL/dbconfig/config.php";
require "scommondash.php";
?>
<!DOCTYPE html>
<html>
<head>
<title>Update Details</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" >
    <link href="bootstrap/css/stddashstyle.css" rel="stylesheet" >
	<link href="fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
</head>
<body>
</head>
<body>
        <div class="container" >
<div class="row">
<h4><center>Notifications</center></h4>

<table class="table table-bordered">
    <thead>
      <tr>
	    <th>S.No</th>
        <th>Title</th>
        <th>Message</th>
        <th>Logs</th>
		<th>View</th>
		
      </tr>
    </thead>
    <tbody>
	<?php
	   $sql="select * from admin_notifications";
	   $res=$con->query($sql);
	   if(($res->num_rows)> 0)
	   {      $i=0;
	          while($row=$res->fetch_assoc()) 
			  {
				  $i++;
				  echo "<tr>
				       <td>{$i}</td>
					   <td>{$row['title']}</td>
			           <td>{$row['message']}</td>
					   <td>{$row['logs']}</td>
					   <td><a href='admin_dash/{$row['upload']}' target='_blank'>View</a></td>
					   
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