<?php
session_start();
include '../../dbconfig/config.php';

if(isset($_POST['courseid'])){
    ?>
<form class='card' id='notification'>
    <input type='submit' id='notifSend' name='submit' class='mt-2 btn btn-primary' value='Send Notification'>
    <div class='card-body'>
        <div class='form-group'>
        <textarea class='form-control' id='datatobeentered' name='content' placeholder='Enter The Notification Content Here...'></textarea>
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
        <div class='col-md-2 d-flex'>
        <button onclick='window.open("../uploads/course_notif/<?php echo $row["file"] ?>", "_blank")' target='_blank' style='width:100%, height:100%' class="btn btn-<?php echo $color[($i+2)%7]?>">Click here to view</button>
        </div>
        <?php
    }?>
        <div class='<?php if($row['file']!=NULL){echo "col-md-8";} else{echo "col-md-10";}?> d-flex'>
        <div class="card-body">
            <blockquote class="blockquote mb-0">
            <p><?php echo $row['content'];?></p>
            <footer class="blockquote-footer text-white"><?php
         $date = date_create($row['time']);
         echo 'Uploaded On: ' . date_format($date, 'H:i - d F, Y') ;?></footer>
            </blockquote>
         </div>
         </div>
        <div class='col-md-2 d-flex'>
            <button class='btn btn-<?php echo $color[($i+4)%7]?>' onclick='delete_notif(<?php echo $row["id"]?>, "<?php echo $row["file"]?>")' style='width:100%'>Delete</button>
        </div>
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
            if($('#datatobeentered').val()){
                var formValues= $(this).serialize();
            
                console.log(formValues);
                $.post("api/send_notification.php", formValues, function(data){
                    alert(data);
                    show_course_notifications();
                });
            }else{
                alert('Add some data');
            }
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

function delete_notif(notifid, file){
    if(confirm("Are you sure you want to delete this notification?")){
        $.post('api/delete_notif.php', {
            notifid: notifid,
            file: file
        }, function data(response){
            alert(response);
            show_course_notifications();
        })
    }
}
</script>
<?php
}else{
    echo "NOT VIEWABLE";
}