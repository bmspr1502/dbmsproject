<?php
session_start();
include '../../dbconfig/config.php';

$sql=  "SELECT * from `course_data`
        WHERE courseid = '". $_SESSION['s_course'] ."';";

if($result = $con->query($sql)){
    ?>
    <div class="row">
    <?php
    while($row = $result->fetch_assoc()){
        $date=date_create($row['time']);
    
        echo '<div class="card col-xl-3 col-lg-4 col-md-6 col-12 p-0" >
                <div clas="card-header">' . date_format($date, 'H:i - d F, Y') .'</div>';
     if($row['type']=='link'){
?>

    <img class="card-img-top img-fluid" src="https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c3R1ZHl8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80" alt="Card image">
    <div class="card-body">
        <h4 class="card-title"><?php echo $row['title'] ?></h4>
        <p class="card-text"><?php echo stripslashes($row['description']) ?></p>
    </div>
    <a href="<?php echo $row['link'] ?>" target='_blank' class="btn btn-primary">Click here to view</a>
<?php
    }else if($row['type']=='video'){
?>
    <iframe height="250px" class="card-img-top" src="<?php echo $row['link']?>" 
            title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; 
            clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <div class="card-body">
        <h4 class="card-title"><?php echo $row['title'] ?></h4>
        <p class="card-text"><?php echo stripslashes($row['description']) ?></p>
        </div>
<?php
    }else{
?>
    <div class='card-img-top'><?php echo stripslashes($row['link'])?></div>
    <div class="card-body">
        <h4 class="card-title"><?php echo $row['title'] ?></h4>
        <p class="card-text"><?php echo stripslashes($row['description']) ?></p>
    </div>
<?php
    }  
    ?>
    
</div>
    <?php 

    }
?>
</div>

    <?php
}else{
    echo $con->error;
}