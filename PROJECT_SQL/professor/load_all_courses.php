<?php 
    session_start();
    //print_r($_SESSION);
    include '../dbconfig/config.php';
  $sql="SELECT course_details.courseid, course_details.name as 'course_name', 
        prof_details.profno, prof_details.name as 'prof_name' 
        from course_details inner join prof_details 
        on course_details.profno = prof_details.profno 
        where course_details.profno = ". $_SESSION['pid'];
   if($query_run=$con->query($sql)){
    while ($row =$query_run->fetch_assoc()) {
        ?>
        <div class=" col-lg-4 col-md-6 col-12">
        <div class="card text-white bg-warning mb-3" style="margin:20px;" id="cardcourse">
        <div class="card-header">
        <center><i class="fa fa-book-reader fa-2x"></center></i>            
        <h3 class="card-title" style="text-align:center;"><?php echo $row['course_name'];?></h3>
                </div>
    <div class="card-body">
        <p>Taught by: <?php echo $row['prof_name'];?></p>
    <center><input type='button' onclick="load_course_details('<?php echo $row['courseid'];?>')" class='btn btn-success' value='View Details'></center>
    </div> 
    </div>
    </div>
    <?php
    
    }
}else{
    echo $con->error;
}
 ?>  