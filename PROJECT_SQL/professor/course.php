<?php
  require '../dbconfig/config.php';
  require "pcommondash.php";
?>
<!DOCTYPE html>
<html>
<head>
<title>view_all_course</title>
    <!--meta name="viewport" content="width=device-width, initial-scale=1">
    
    
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" >
    <link href="../bootstrap/css/stddashstyle.css" rel="stylesheet" >
	<link href="../fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet"-->
</head>
<body>
 <div class="container-fluid p-0" id="enrolledcourses">
        <h3 style="margin:20px">All Courses:</h3>
     <div class="container" id="box">
        <div class="row" id='courserow'>                         
        </div>
    </div>
</div>
    <script>
        function load_all_courses(){
            $.get('load_all_courses.php', function(data){
                $('#courserow').html(data);
            })
        }

        function load_course_details(cid){
            $.post('set_course.php', {
                course_id: cid
            },function(data){
                $('#box').html(data);
            })
        }
        $(document).ready(function(){
            load_all_courses();

            
        });
    </script>
</body>
</html>
