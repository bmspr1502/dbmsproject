<?php
session_start();
include '../../dbconfig/config.php';

if(isset($_POST['courseid'])){
    ?>
<form class='card' id='notification'>
    <input type='submit' id='notifSend' name='submit' class='mt-2 btn btn-primary' value='Send Notification'>
    <div class='card-body'>
        <div class='form-group'>
        <textarea class='form-control' name='content' placeholder='Enter The Notification Content Here...'></textarea>
        <input type='hidden' name='file' id='fileName'>
        <input type='hidden' name='courseid' id='courseid' value='<?php echo $_POST['courseid']?>'>
        </div>
        <div class="custom-file">
            <input type="file" name='fileUpload' class="custom-file-input" onchange='upload_notif()' id="customFile">
            <label class="custom-file-label" for="customFile">Choose file (not mandatory)</label>
        </div>
    </div>
</form>

<?php
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

<script>
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});

$(document).ready(function(){
    $('#notification').submit(function(event){
            event.preventDefault();

            var formValues= $(this).serialize();
           
            console.log(formValues);
            $.post("api/send_notification.php", formValues, function(data){
                alert(data);
               
            });
        });
})

function upload_notif(){
    var fd = new FormData();
    var files = $('#customFile')[0].files[0];
            
        fd.append('file',files);
        $.ajax({
            url: 'api/upload_file.php?type=course_notif',
            type: 'post',
            data: fd,
            contentType: false,
            processData: false,
            cache: false,
            success: function(response){
            if(response!=0){
                //alert(response);
                $('#fileName').val(response);
            }else{
                alert("Upload failed");
            }
            },
        });
}
</script>
<?php
}else{
    echo "NOT VIEWABLE";
}