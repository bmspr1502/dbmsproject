<?php
session_start();
include '../../dbconfig/config.php';

if(isset($_POST['courseid'])){

    $qry = $con->prepare("SELECT * from course_notifications WHERE courseid = ?");
    $qry->bind_param("s", $_POST['courseid']);

    $qry->execute();
    $output = $qry->get_result();
    $color = array('success', 'primary', 'info', 'warning', 'danger', 'secondary', 'dark');
    $i = 0;
    while($row = $output->fetch_assoc()){
    ?>
    <div class="card text-white bg-<?php echo $color[$i%7]?> mt-3">
        <div class="card-body">
            <p><?php echo $row['content'];?></p>
            <?php if($row['file']!=NULL){
?>
            <a href="../uploads/course_notif/<?php echo $row['file'] ?>" target='_blank' class="float-right btn btn-primary">Click here to view</a>
            <?php 
            }
        $date = date_create($row['time']);
        echo 'Uploaded On: ' . date_format($date, 'H:i - d F, Y') ;?>
        </div>
    </div>

    <?php
    
    $i++;
    }

    ?>
<?php
}else{
    echo "NOT VIEWABLE";
}