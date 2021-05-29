<?php 
if(isset($_FILES)){
    //print_r($_FILES);
    $file = $_FILES['file'];
    if(isset($file)) {
        $filename = $_FILES['file']['name'];
        $filetmp = $_FILES['file']['tmp_name'];
        $filesize = $_FILES['file']['size'];
        $fileerror = $_FILES['file']['error'];
        $filetype = $_FILES['file']['type'];

        $fileext = explode('.', $filename);
        $fileactualext = strtolower(end($fileext));
        $type= $_GET['type'];
        if ($fileerror === 0){
            
            $filedestination = '../../uploads/'. $type .'/' . $filename;
            if(move_uploaded_file($filetmp, $filedestination)){
                echo $filename;
            }
            else{
                echo '0';
            }
        } 
        else{
            echo '0';
        }
       
    }
}
else{
    echo "<script>";
    echo "alert('Access Denied');";
    echo "window.location.href = 'index.php';";
    echo "</script>";
}
?>