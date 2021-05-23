<?php
session_start();
include '../dbconfig/config.php';
?>

<ul class="nav nav-pills nav-fill mt-3 mb-3">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#" onclick='show_course_details()'>Show Student Details</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#" onclick='show_course_materials()'>Course Materials</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Course Notifications</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
  </li>
</ul>

<?php
$sql=  "SELECT course_details.courseid, course_details.name as 'course_name', 
        prof_details.profno, prof_details.name as 'prof_name' 
        from course_details inner join prof_details 
        on course_details.profno = prof_details.profno 
        where course_details.courseid = '". $_SESSION['p_course'] . "';";

if($result = $con->query($sql)){
    $row = $result->fetch_assoc();
    ?>
<h3>Course ID: <?php echo $row['courseid']?></h3>
<h3> Course Name: <?php echo $row['course_name']?></h3>
<h3> Professor's name: <?php echo $row['prof_name']?></h3>

<h4 class='m-3'> Student's Details</h4>

<?php
    $stu_qry = "SELECT student_courses.rollno, student_details.name 
                FROM student_courses INNER JOIN student_details 
                ON student_details.rollno = student_courses.rollno 
                WHERE student_courses.courseid = '". $_SESSION['p_course'] ."'";

    if($stu_res = $con->query($stu_qry)){
        ?>
<table class="table table-dark table-striped">
<thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Roll No.</th>
      <th scope="col">Student Name</th>
      <th scope="col">Remove Student</th>
    </tr>
</thead>
<tbody>
        <?php
        $i = 1;
        while($stu_row = $stu_res->fetch_assoc()){
          ?>
            <tr>
            <th scope='row'><?php echo $i ?></th>
            <td><?php echo $stu_row['rollno']?></td>
            <td><?php echo $stu_row['name'] ?></td>
            <td><button class='btn btn-danger' ><i class="fa fa-trash-alt"></i></button>
          </tr>";
<?php
          $i++;
        }
        ?>
</tbody>
</table>
<?php
    }else{
        echo $con->error();
    }

?>

<?php


}else{
    echo $con->error();
}


