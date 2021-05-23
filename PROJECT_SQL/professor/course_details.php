<?php

require "pcommondash.php";
?>
<!DOCTYPE html>
<html>
<head>
<title>view_all_course</title>
</head>

<body>
<div class="container-fluid p-0" id="enrolledcourses">
     <div class="container" id="box">
    </div>
</div>

<script type='text/javascript'>
    function show_course_details(){
        $.post('show_course_details.php', function(data){
            $("#box").html(data);
        })
    }
    
    function show_course_materials(){
        $.post('show_course_materials.php', function(data){
            $("#box").html(data);
        })
    }

    $(document).ready(function(){
        show_course_details();
    })
    
</script>
</body>
</html>
