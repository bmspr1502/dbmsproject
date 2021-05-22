<?php
session_start();
include '../dbconfig/config.php';
?>

<ul class="nav nav-pills nav-fill mt-3 mb-3">
  <li class="nav-item">
    <a class="nav-link " href="#" onclick='show_course_details()'>Show Student Details</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#" onclick='show_course_materials()'>Course Materials</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Course Notifications</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
  </li>
</ul>

<?php
$sql=  "SELECT * from `course_data`
        WHERE courseid = '". $_SESSION['p_course'] ."';";

if($result = $con->query($sql)){
    echo '<div class="row">';
    while($row = $result->fetch_assoc()){
    ?>

    <div class="card col-lg-4 col-md-6 col-12" >
    <?php if($row['type']=='pdf'){
        echo '<img class="card-img-top img-fluid" src="https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c3R1ZHl8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80" alt="Card image">';
    }else{
        echo '<iframe height="200px" class="card-img-top" src="' .$row['link'] . '" 
            title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; 
            clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>';

    }?>
    
    <div class="card-body">
        <h4 class="card-title"><?php echo $row['title'] ?></h4>
        <p class="card-text"><?php echo $row['description'] ?></p>
        <a href="<?php echo $row['link'] ?>" target='_blank' class="btn btn-primary">Click here to view</a>
    </div>
    </div>


<?php

    }   

    echo '</div>';
}else{
    echo $con->error;
}