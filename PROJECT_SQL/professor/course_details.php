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
    <div id='insideNav'>
    
        <ul class="nav nav-pills nav-fill mt-3 mb-3">
        <li class="nav-item">
            <button class="nav-link" id='navStudentDetails'  >Show Student Details</button>
        </li>
        <li class="nav-item">
            <button class="nav-link" id='navCourseMaterials' >Course Materials</button>
        </li>
        <li class="nav-item">
            <button class="nav-link" id='navCourseNotifications' >Course Notifications</button>
        </li>
        </ul>
    </div>
     <div class="container" id="box">
    </div>
</div>

<script type='text/javascript'>
    function show_course_details(){
        $.post('api/show_course_details.php', function(data){
            make_all_inactive();
            $('#navStudentDetails').addClass('active');  
            $("#box").html(data);
        })
    }
    
    function show_course_materials(){
        $.post('api/show_course_materials.php', function(data){
            make_all_inactive();
            $('#navCourseMaterials').addClass('active');
            $("#box").html(data);
        })
    }

    function show_course_notifications(){
        make_all_inactive();
        $('#navCourseNotifications').addClass('active');
        $("#box").html('HIIIIII');  
    }

    $(document).ready(function(){
        if (window.location.hash === '#navStudentDetails') {
            show_course_details();
        }else if (window.location.hash === '#navCourseMaterials') {
            show_course_materials();
        }else if (window.location.hash === '#navCourseNotifications') {
            show_course_notifications();
        }else {
        show_course_details();
        }

        $('#navStudentDetails').click(function(){
            show_course_details();
        });

        $('#navCourseMaterials').click(function(){
            show_course_materials();
        });

        $('#navCourseNotifications').click(function(){
            show_course_notifications();
        });
    })
    
    function make_all_inactive(){
        $('#navStudentDetails').removeClass('active');
        $('#navCourseMaterials').removeClass('active');
        $('#navCourseNotifications').removeClass('active');
    }
</script>
</body>
</html>
