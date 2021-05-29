<?php
session_start();
if(!isset($_SESSION['p_course'])){
    echo '<script>window.location.href="profdash.php"</script>';
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
    <link rel="stylesheet" href="../dash_style/style.css">
<title>View Course Details</title>

</head>

<body>

<div class="wrapper d-flex align-items-stretch">
<nav id="sidebar" class="active">
            <h1><a href="#" class="logo">CMS</a></h1>
        <ul class="list-unstyled components mb-5">
         <li class="active">
           <a href="profdash.php"><span class="fa fa-home"></span>DASHBOARD</a>
         </li>
          <li>
           <a href="professor_profile_details.php"><span class="fa fa-user"></span><?php  echo $_SESSION['pname']?>'s PROFILE DETAILS</a>
         </li>
         <li>
           <a href="adtoprofnotifications.php"><span class="fa fa-bell"></span>ADMIN NOTIFICATIONS</a>
         </li>
         <li>
           <a href="course_details.php#navStudentDetails" onclick='show_course_details()'><span class="fa fa-sticky-note"></span>VIEW COURSE DETAILS</a>
         </li>
         <li>
           <a href="course_details.php#navCourseMaterials" onclick='show_course_materials()'><span class="fa fa-upload"></span>UPLOAD STUDY MATERIALS</a>
         </li>
         <li>
           <a href="course_details.php#navCourseNotifications" onclick='show_course_notifications()'><span class="fa fa-paper-plane"></span> SEND NOTIFICATION</a>
         </li>
         <li>
           <a href="course_details.php#navCourseDiscussion" onclick='show_course_discussion()'><span class="fa fa-indent"></span>COURSE DISCUSSIONS</a>
         </li>
         <li>
           <a href="log_out.php"><span class="fa fa-sign-out"></span>LOGOUT</a>
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
            <div class='text-center'>
                <h4>Course: <?php echo $_SESSION['p_course_name'];?></h4>
            </div>
            <a href='profdash.php' class='btn btn-success'>Go back to choose course</a>
            </div>
            
        </nav>

<div class="container-fluid p-0" id="enrolledcourses">
    <div id='insideNav'>
    
        <ul class="nav nav-tabs nav-fill mt-3 mb-3">
        <li class="nav-item">
            <button class="nav-link" data-toggle='pill' id='navStudentDetails'  >Show Student Details</button>
        </li>
        <li class="nav-item">
            <button class="nav-link" data-toggle='pill' id='navCourseMaterials' >Course Materials</button>
        </li>
        <li class="nav-item">
            <button class="nav-link" data-toggle='pill' id='navCourseNotifications' >Course Notifications</button>
        </li>
        <li class="nav-item">
            <button class="nav-link" data-toggle='pill' id='navCourseDiscussion' >Course Discussion</button>
        </li>
        </ul>
    </div>
    <div class="container" id="box">
    </div>
</div>
</div>
</div>

<!-- addNewDataModal -->
<div class="modal fade" id="addNewDataModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Insert New Course Material</h5>
        <button type="button" class="addClose close" data-dismiss="modal" aria-label="Close">X</button>
      </div>
      <div class="modal-body">
      <form id='addData'>
        <input type='hidden' name='courseid' value='<?php echo $_SESSION['p_course'];?>'>
        <div class="form-group">
            <label for="addmaterialType" class="form-label">Type of Material:</label>
            <select class="form-control" id='addmaterialType' aria-label="Default select example" onchange='change_add_group(this.value)' name='type'>
                <option selected value='link'>Link</option>
                <option value="video">YouTube Video</option>
                <option value="code">Embedding HTML code</option>
                <option value='file'>File</option>
            </select>
            <div id="typeHelp" class="form-text">Select the type correctly as that will decide how the material looks like.</div>
        </div>

        <div class='custom-file' id='addfilegroup'>
            <label for="addfile" class="custom-file-label">Upload File</label>
            <input type='file' class='custom-file-input' id='addfile' name='file' onchange='upload_file()'/>
            <p id='uploadcheck'></p>
        </div>
        <div class="form-group" id='addlinkgroup'>
            <label for="addlink" class="form-label">Link / code to embed:</label>
            <textarea class='form-control' rows='4' id='addlink' name='link' style='width: 100%'></textarea>
        </div>

        <div class="form-group">
            <label for="addtitle" class="form-label">Title of the material:</label>
            <input type='text' class='form-control' name='title' rows='4' id='addtitle' style='width: 100%'>
        </div>

        <div class="form-group">
            <label for="adddescription" class="form-label">Description of the material:</label>
            <textarea class='form-control' rows='4' name='description' id='adddescription' style='width: 100%'></textarea>
        </div>
        </div>
        <div class="modal-footer">
            
            <input type="submit" name='submit' id='addsubmit' class="btn btn-success" value='Save Changes'/>
            </form>
            <button type="button" class="btn btn-danger addClose" data-dismiss="modal">Close</button>
        </div>

      
      
      
    </div>
  </div>
</div>

<!-- updateExistingModal -->
<div class="modal fade" id="updateExistingModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Update Existing Course Material</h5>
        <button type="button" class="updateClose close" data-dismiss="modal" aria-label="Close">X</button>
      </div>
      <div class="modal-body">
      <form id='updateData'>
        <input type='hidden' name='dataid' id='updateDataId'>
        <input type='hidden' name='courseid' value='<?php echo $_SESSION['p_course'];?>'>
        <div class="form-group">
            <label for="updateMaterialType" class="form-label">Type of Material:</label>
            <select class="form-control " id='updateMaterialType' aria-label="Default select example" onchange='change_upload_group(this.value)' name='type'>
                <option selected value='link'>Link</option>
                <option value="video">YouTube Video</option>
                <option value="code">Embedding HTML code</option>
                <option value='file'>File</option>
            </select>
            <div id="typeHelp" class="form-text">Select the type correctly as that will decide how the material looks like.</div>
        </div>
        <a href="" target='_blank' id='updateFile' class="btn btn-success">Click here to open material</a>
        <div class="form-group" id='updateLinkGroup'>
            <label for="updateLink" class="form-label">Link / code to embed:</label>
            <textarea class='form-control' rows='4' id='updateLink' name='link' style='width: 100%'></textarea>
        </div>

        <div class="form-group">
            <label for="updateTitle" class="form-label">Title of the material:</label>
            <input type='text' class='form-control' name='title' rows='4' id='updateTitle' style='width: 100%'>
        </div>

        <div class="form-group">
            <label for="updateDescription" class="form-label">Description of the material:</label>
            <textarea class='form-control' rows='4' name='description' id='updateDescription' style='width: 100%'></textarea>
        </div>
        </div>
        <div class="modal-footer">
            
            <input type="submit" name='submit' id='updateSubmit' class="btn btn-success" value='Save Changes'/>
            </form>
            <button type="button" class="btn btn-danger updateClose" data-dismiss="modal">Close</button>
        </div>

      
      
      
    </div>
  </div>
</div>


<!-- The Modal -->
<div class="modal" id="viewProfile">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title text-center" id='viewProfileHeading'>Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div id='viewProfileBox'>
        </div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
<script>
    $(document).ready(function(){
        $('#addData').submit(function(event){
                event.preventDefault();

                var formValues= $(this).serialize();
                

                $.post("api/add_course_data.php", formValues, function(data){
                    
                    alert(data);
                    $('#addData')[0].reset();
                    change_add_group('link');
                    show_course_materials();
                    $('#addlink').val('');
                        
                });
            });

        $('#updateData').submit(function(event){
            event.preventDefault();

            var formValues= $(this).serialize();
           

            $.post("api/update_course_data.php", formValues, function(data){
               
                alert(data);
                show_course_materials();
                
            });
        });

        $('#addfilegroup').hide();
        $('#updateFile').hide();

    });

    $('.updateClose').click(function(){
        $('#updateExistingModal').modal('hide');
    });

    $('.addClose').click(function(){
        $('#addNewDataModal').modal('hide');
    });

    function load_update_data(dataid){
        $.post('api/load_update_data.php', {
            dataid: dataid
        }, function(data){
            let result = JSON.parse(data);
            $('#updateDataId').val(result.dataid);
            $('#updateMaterialType').val(result.type);
            if(result.type=='file'){
                $('#updateFile').show();
                $('#updateFile').attr('href', '../uploads/'+result.link);
            }
            $('#updateLink').html(result.link);
            $('#updateTitle').val(result.title);
            $('#updateDescription').html(result.description);
        })
    }

    function delete_material(dataid){
        if(confirm('Are you sure you want to delete this course material?')){
            $.post('api/delete_course_material.php', {
                dataid: dataid
            }, function(data){
                if(data!='DELETED')
                    alert(data);

                show_course_materials();
            })
        }
    }

    function upload_file(){
        var fd = new FormData();
        var files = $('#addfile')[0].files[0];
            
        fd.append('file',files);
        $.ajax({
            url: 'api/upload_file.php?type=course_material',
            type: 'post',
            data: fd,
            contentType: false,
            processData: false,
            cache: false,
            success: function(response){
            if(response!=0){
                $('#uploadcheck').html(response);
                $('#addlink').val(response);
            }else{
                alert("Upload failed");
            }
            },
        });
    }

    function change_add_group(value){
        if(value=='file'){
            $('#addlinkgroup').hide();
            $('#addfilegroup').show();
        }else{
            $('#addlinkgroup').show();
            $('#addfilegroup').hide();
        }
    }

    function show_information_of_person(type, id){
        $('#viewProfileHeading').html(type+' : '+id);
        if(type=='student'){
            $.post('api/search_profile.php', {
                rollno: id
            }, function(data){
                $('#viewProfileBox').html(data);
            });
        }else{
            $.post('api/search_profile.php', {
                pid: id
            }, function(data){
                $('#viewProfileBox').html(data);
            });
        }
    }
</script>
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
        $.post('api/show_course_notification.php',{
            courseid: '<?php echo $_SESSION['p_course']?>'
        },function(data){
            make_all_inactive();
            $('#navCourseNotifications').addClass('active');
            $("#box").html(data);  
        })
       
    }

    function show_course_discussion(){
        $.post('api/show_course_discussion.php',{
            courseid: '<?php echo $_SESSION['p_course']?>'
        },function(data){
            make_all_inactive();
            $('#navCourseDiscussion').addClass('active');
            $("#box").html(data);  
        })
       
    }

    $(document).ready(function(){
        if (window.location.hash === '#navStudentDetails') {
            show_course_details();
        }else if (window.location.hash === '#navCourseMaterials') {
            show_course_materials();
        }else if (window.location.hash === '#navCourseNotifications') {
            show_course_notifications();
        }else if (window.location.hash === '#navCourseDiscussion') {
            show_course_discussion();
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

        $('#navCourseDiscussion').click(function(){
            show_course_discussion();
        });
    })
    
    function make_all_inactive(){
        $('#navStudentDetails').removeClass('active');
        $('#navCourseMaterials').removeClass('active');
        $('#navCourseNotifications').removeClass('active');
        $('#navCourseDiscussion').removeClass('active');
    }
</script>
<script src="../dash_style/main.js"></script>
</body>
</html>
