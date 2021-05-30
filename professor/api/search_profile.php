<?php
include '../../dbconfig/config.php';

if(isset($_POST['rollno'])){
    $roll = $_POST['rollno'];

    $qry = $con->prepare('SELECT rollno, name, email, contactno
                            FROM student_details WHERE rollno=?');
    $qry->bind_param('i', $roll);
    if($qry->execute()){
        $res = $qry->get_result();
        $row = $res->fetch_assoc();
        //print_r($row);
        ?>
<div class='container'>
<div class='row'>
    <div class='col-md-3 bg-dark text-light'>
        Roll Number: 
    </div>
    <div class='col-md-9 bg-light text-dark'>
        <?php echo $row['rollno'];?>
    </div>
    <div class='col-md-3 bg-dark text-light'>
        Name: 
    </div>
    <div class='col-md-9 bg-light text-dark'>
        <?php echo $row['name'];?>
    </div>
    <div class='col-md-3 bg-dark text-light'>
        Email: 
    </div>
    <div class='col-md-9 bg-light text-dark'>
        <a href='mailto:<?php echo $row['email'];?>' target='_blank'><?php echo $row['email'];?></a>
    </div>
    <div class='col-md-3 bg-dark text-light'>
        Phone No: 
    </div>
    <div class='col-md-9 bg-light text-dark'>
        <?php echo $row['contactno'];?>
    </div>
</div>

<?php
        
        $courses = "SELECT * FROM `view_all_courses_student` WHERE rollno=$roll";
        if($crs= $con->query($courses)){
            ?>
            <h3>Here is the list of courses that the student has enrolled:</h3>
            <div class='row'>
    <?php
            while($course = $crs->fetch_assoc()){
                ?>
                
                <div class='card p-0 col-md-4'>
                    <div class='card-body'>
                    <h4><?php echo $course['course_name']?></h4>
                    </div>
                    <div class='card-footer'>
                    <h5>Id: <?php echo $course['courseid']?></h5>
                    </div>
                </div>
                <?php
            }
            ?>
    
            </div>
<?php
        }else{
            echo $con->error;
        }
?>


</div>
<?php
    }else{
        echo $con->error;
    }
}else if(isset($_POST['pid'])){

    $pid = $_POST['pid'];
    $qry = $con->prepare('SELECT profno, name, email, contactno
            FROM prof_details WHERE profno=?');
    $qry->bind_param('i', $pid);
if($qry->execute()){
    $res = $qry->get_result();
    $row = $res->fetch_assoc();
    //print_r($row);
    ?>
<div class='container'>
    <div class='row'>
        <div class='col-md-3 bg-dark text-light'>
            Prof ID: 
        </div>
        <div class='col-md-9 bg-light text-dark'>
            <?php echo $row['profno'];?>
        </div>
        <div class='col-md-3 bg-dark text-light'>
            Name: 
        </div>
        <div class='col-md-9 bg-light text-dark'>
            <?php echo $row['name'];?>
        </div>
        <div class='col-md-3 bg-dark text-light'>
            Email: 
        </div>
        <div class='col-md-9 bg-light text-dark'>
            <a href='mailto:<?php echo $row['email'];?>' target='_blank'><?php echo $row['email'];?></a>
        </div>
        <div class='col-md-3 bg-dark text-light'>
            Phone No: 
        </div>
        <div class='col-md-9 bg-light text-dark'>
            <?php echo $row['contactno'];?>
        </div>
    </div>
<?php
    $prof = "SELECT * from `all_courses` WHERE profno=$pid";
    if($res = $con->query($prof)){
        ?>
        <div class='container'>
        <h3>Here is the list of courses that the professor takes:</h3>
        <div class='card-deck row'>
<?php
        while($course = $res->fetch_assoc()){
            ?>
            
            <div class='card col-md-4'>
                <div class='card-body'>
                <h4><?php echo $course['course_name']?></h4>
                <h5><?php echo $course['courseid']?></h5>
                </div>
            </div>
            <?php
        }
        ?>

        </div>
    </div>
</div>
<?php
        //print_r($professors);
    }else{
        echo $con->error;
    }
}else{
    echo $con->error;
}

}else{
    echo "NOT VIEWABLE";
}