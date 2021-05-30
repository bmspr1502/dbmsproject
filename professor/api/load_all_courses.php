<?php 
    session_start();
    //print_r($_SESSION);
    include '../../dbconfig/config.php';
  $sql="SELECT * FROM all_courses
        where profno = ". $_SESSION['pid'];
   if($query_run=$con->query($sql)){
    $i=rand()%4;
    $colorArray =Array('warning','info','success','danger');
    while ($row =$query_run->fetch_assoc()) {
        ?>
        <div class=" col-lg-4 col-md-6 col-12">
        <div class="card text-white bg-<?php echo $colorArray[$i%4]; ?> mb-3" style="margin:20px;" id="cardcourse">
        <div class="card-header">
        <center><i class="fa fa-book-reader fa-2x"></center></i>            
        <h3 class="card-title" style="text-align:center;"><?php echo $row['course_name'];?></h3>
                </div>
    <div class="card-body">
        <p>Taught by: <?php echo $row['prof_name'];?></p>
    <center><input type='button' onclick="load_course_details('<?php echo $row['courseid'];?>', '<?php echo $row['course_name'];?>')" class='btn btn-dark' value='View Details'></center>
    </div> 
    </div>
    </div>
    <?php
    $i++;
    }
}else{
    echo $con->error;
}
 ?>  