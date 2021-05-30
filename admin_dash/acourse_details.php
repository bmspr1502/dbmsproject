<?php
session_start();
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="../dash_style/style.css">
  <title>Course details</title>

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
            <h4>All Course Details</h4>
          </div>
        </div>
      </nav>



      <div class="container">
        <div class="row">

          <div class="container">
            <div class="row">

              <div class="container">
                <form>
                  <input type="text" name="Search" placeholder="Search..." id="myinput" style="width:100%" class="form-control" />
                  <br>
                  <br>

                </form>
              </div>
              <div style="overflow-x:auto;">
              <table class="table table-bordered table-dark table-striped">
                <thead>
                  <tr>
                    <th>S.No</th>
                    <th>Course id</th>
                    <th>course Name</th>
                    <th>Professor id</th>
                    <th>No of students</th>
                    <th>Edit</th>
                    <th>Delete</th>

                  </tr>
                </thead>
                <tbody class="tbody">
                  <?php

                  $query = "select * from course_details";
                  $result = mysqli_query($con, $query);
                  if ($result->num_rows > 0) {
                    $i = 0;
                    while ($row = $result->fetch_assoc()) {
                      $sql = "select * from student_courses where courseid='{$row['courseid']}'";
                      $query_run = mysqli_query($con, $sql);
                      $i++;
                      echo "<tr>
				       <td>{$i}</td>
					   <td>{$row['courseid']}</td>
			           <td>{$row['name']}</td>
					   <td>{$row['profno']}</td>
					   <td>$query_run->num_rows</td>
					   <td><button type='button' class='btn btn-success editbtn' data-toggle='modal' data-target='#editmodal'>Edit</button></td>
					   <td><button type='button' class='btn btn-danger deletebtn' data-toggle='modal' data-target='#DeleteConfirm'>Delete</button></td>
					   </tr>";
                    }
                  } else {
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
                      <form action="acourse_details.php" method="POST">
                        <div class="form-group align-items-center">
                          
                          <label class="control-label"><i class="fas fa-lock fa-1.5x"></i> Courseid</label>
                          <input type="hidden" class="form-control" name="cid" id="cid">
                        </div>
                        <div class="form-group">
                          <label class="control-label"><i class="fa fa-address-card"></i> Course Name</label>
                          <input type="text" class="form-control" name="cname" id="cname">
                        </div>
                        <div class="form-group">
                          <label class="control-label"><i class="fa fa-birthday-cake"></i> Professor id</label>
                          <input type="text" class="form-control" name="pid" id="pid">
                        </div>
                        <input type="hidden" id="noofcourses"></input>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      <button type="submit" class="btn btn-primary" name="update">Update</button>
                    </div>
                    </form>
                  </div>
                </div>
              </div>
              <div class="modal fade" id="DeleteConfirm" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Delete Confirmation</h5>
                      <button type="button" class="btn-close close" data-dismiss="modal" aria-label="Close">&times;</button>
                    </div>
                    <form action="acourse_details.php" method="POST">
                      <div class="modal-body">

                        <h5>Are You sure want to delete this course? All the course data will be deleted and will not be retrievable.</h5>
                        <input type="hidden" name="delete_id" id="delete_id" ></input>
                      </div>
                      <div class="modal-footer">

                        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close close">Close</button>
                        <button type="submit" class="btn btn-danger" name="delete">Delete</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              <?php

              if (isset($_POST['delete'])) {

                $id = $_POST['delete_id'];

                $query = "delete from course_details WHERE courseid='$id'";
                $query_run = mysqli_query($con, $query);

                if ($query_run) {
                  echo "<script type='text/javascript'> alert('data deleted');</script>";
                } else {
                  echo "<script type='text/javascript'> alert('unsuccessfull deletion');</script>";
                }
              }


              ?>
              <?php

              if (isset($_POST['update'])) {

                $id = $_POST['cid'];
                $cname = $_POST['cname'];
                $pid = $_POST['pid'];
                $query = $con->prepare("update course_details set name=?,profno=? where courseid='$id'");
                $query->bind_param("ss",$cname,$pid);

                if ($query->execute()) {
                  echo "<script type='text/javascript'> alert('data updated');</script>";
                } else {
                  echo "<script type='text/javascript'> alert('unsuccessfull updation');</script>";
                }
              }


              ?>



              <script>
                $(document).ready(function() {
                  $('.editbtn').on('click', function() {
                    $('#editmodal').modal('show');
                    var currrow = $(this).closest('tr');
                    var data1 = currrow.find('td:eq(1)').text();
                    var data2 = currrow.find('td:eq(2)').text();
                    var data3 = currrow.find('td:eq(3)').text();

                    $('#cid').val(data1);
                    $('#cname').val(data2);
                    $('#pid').val(data3);
                    console.log(data1);
                    console.log(data2);
                    console.log(data3);


                  });
                });
              </script>
              <script>
                $(document).ready(function() {
                  $('.deletebtn').on('click', function() {
                    $('#DeleteConfirm').modal('show');
                    var currrow = $(this).closest('tr');
                    var data1 = currrow.find('td:eq(1)').text();
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
              </script>
              </script>
              <script src="../dash_style/main.js"></script>
              <script>
                $(document).ready(function() {
                  $('#myinput').on("keyup", function() {
                    var value = $(this).val().toLowerCase();
                    $('.tbody tr').filter(function() {
                      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)


                    });


                  });

                });
              </script>
</body>

</html>