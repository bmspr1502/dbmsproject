<?php
session_start();
include '../../dbconfig/config.php';

if(isset($_POST['courseid'])){

    $qry = $con->prepare("SELECT * from course_notifications WHERE courseid = ? ORDER BY time DESC");
    $qry->bind_param("s", $_POST['courseid']);

    $qry->execute();
    $output = $qry->get_result();
    $color = array('success', 'primary', 'info', 'warning', 'danger', 'secondary', 'dark');
    $i = rand()%100;
    while($row = $output->fetch_assoc()){
    ?>
   <div class="card text-white bg-<?php echo $color[$i%7]?> mt-3">
    <div class='row d-flex'>
    <?php if($row['file']!=NULL){
        ?>
        <div class='col-md-3 d-flex'>
        <button onclick='window.open("../uploads/course_notif/<?php echo $row["file"] ?>", "_blank")' target='_blank' style='width:100%, height:100%' class="btn btn-<?php echo $color[($i+2)%7]?>">Click here to view</button>
        </div>
        <?php
    }?>
        <div class='<?php if($row['file']!=NULL){echo "col-md-9";} else{echo "col-md-12";}?> d-flex'>
        <div class="card-body p-1">
        <blockquote class="blockquote mb-0 ml-3">
            <p><?php echo $row['content'];?></p>
            <footer class="blockquote-footer text-white p-0"><?php
         $date = date_create($row['time']);
         echo 'Uploaded On: ' . date_format($date, 'H:i - d F, Y') ;?></footer>
            </blockquote>
         </div>
         </div>
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