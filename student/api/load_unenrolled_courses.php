<?php 
session_start();
include '../../dbconfig/config.php';

if(isset($_POST['rollno'])){
  $roll = $_POST['rollno'];
$sql= $con->query("SELECT * FROM `view_all_courses_student` 
        WHERE  courseid NOT IN 
        (SELECT courseid from `view_all_courses_student` WHERE rollno= $roll GROUP BY courseid) 
        GROUP BY courseid");
/*
$sql->execute();
$query_run = $sql->get_result();
    
*/

$i=0;
$colorArray =Array('warning','info','success','danger');
while ($row =$sql->fetch_assoc()) 
{ ?> 
 <div class="col-lg-6 col-md-6 col-12">
   <div class='card text-white bg-<?php echo $colorArray[$i%4]; ?> mb-3' style='margin:20px;' id='cardcourse'>
    <div class="card-header">
       <center><i class="fa fa-book-reader fa-2x"></center></i>           
         <h3 class="card-title" style="text-align:center;"><?php echo $row['course_name']; ?></h3>
    </div>
    <div class='card-body'>
        <p>Course Id: <?php echo $row['courseid']?></p>
        <p>Taught By: <?php echo $row['prof_name']?></p>
    </div>
    <div class='card-footer'>
    <center><input type="button" class="btn btn-primary" id="enroll" name="enroll" onclick="enroll_course('<?php echo $row['courseid'];?>' )" value="Enroll"/></center>
    </div>
 </div>
</div>
<?php
$i++;
}


}else{
    echo "NOT VIEWABLE";
}
?>                 