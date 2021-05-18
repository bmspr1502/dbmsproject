<?php
     session_start();
 ?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>HOME PAGE</title>
       <!-- <link rel="stylesheet" href="homestyle.css"> -->

    </head>
    <body>
       
  <h1>Hello User</h1>
  <?php echo $_SESSION['sroll_no'] ?>
  
        

    </body>
</html>