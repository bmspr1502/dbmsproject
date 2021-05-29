<?php
session_start();
include 'dbconfig/config.php';
if(isset($_POST['SROLLNO'])){
	$srollno=$con->real_escape_string($_POST['SROLLNO']);
	$spassword=$con->real_escape_string($_POST['SPASSWORD']);
	$query=$con->prepare("SELECT * from student_details WHERE rollno=? AND password=?");
    $query->bind_param('ss', $srollno, $spassword );
	$query->execute();

    $result = $query->get_result();
	if($result->num_rows>0)
	{
		$row = $result->fetch_assoc();
		$_SESSION['sroll_no']= $srollno;
		$_SESSION['student_name'] = $row['name'];
		echo "<script>window.location.href='student/stddash.php'</script>";
	
	}
	
	else{
        echo "Incorrect Password / Username";
		echo '<script type="text/javascript"> alert(" Student Er! '. $con->error .'")</script>';
    }

}else if(isset($_POST['PID'])){

    $pid=$con->real_escape_string($_POST['PID']);
	$ppassword=$con->real_escape_string($_POST['PPASSWORD']);
	$query=$con->prepare("SELECT * from prof_details WHERE profno=? AND password=?");
    $query->bind_param('ss', $pid, $ppassword );
	$query->execute();

    $result = $query->get_result();
	if($result->num_rows>0)
	{
        $row = $result->fetch_assoc();
		$_SESSION['pid']= $pid;
        $_SESSION['pname'] = $row['name'];
		echo"<script>window.location.href='professor/profdash.php'</script>";	
	}
	else{
        echo "Incorrect Password / Username";
		echo '<script type="text/javascript"> alert(" Professor Er! '.$con->error .'")</script>';
    }

}else if(isset($_POST['AID'])){

    $aid=$con->real_escape_string($_POST['AID']);
	$apassword=$con->real_escape_string($_POST['APASSWORD']);
	$query=$con->prepare("SELECT * from admin_login WHERE aid=? AND apassword=?");
    $query->bind_param('ss', $aid, $apassword );
	$query->execute();

    $result = $query->get_result();
	if($result->num_rows>0)
	{
		$_SESSION['aid']= $aid;
		echo"<script>window.location.href='admin_dash/admindash.php'</script>";	
	}
	else{
        echo "Incorrect Password / Username";
		echo '<script type="text/javascript"> alert(" Professor Er! '.$con->error .'")</script>';
    }
}else{
    echo "NOT VIEWABLE";
}
	

?>