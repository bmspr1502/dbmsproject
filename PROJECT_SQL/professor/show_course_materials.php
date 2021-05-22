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
    ?>
    <div class="row">
    <div class="card col-xl-3 col-lg-4 col-md-6 col-12" >
        <img class='card-img-top img-fluid' src='https://lh3.googleusercontent.com/proxy/mNVDPAoZiu2_yJujR4Dz6_0Zbdw4SgS18CBVU7lDuzGEbCUJGQtq27CqF61ZANOfxbjoz_SzP7JEpfYoHOg8qVcHnyun090'>
        <div class='card-body'>
        <h4 class='card-title'>Add Course material</h4>
        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#addNewDataModal">
        
  Click Here to add
</button>

        </div>
    </div>
    <?php
    while($row = $result->fetch_assoc()){
        echo '<div class="card col-xl-3 col-lg-4 col-md-6 col-12" >';
     if($row['type']=='pdf'){
?>

    <img class="card-img-top img-fluid" src="https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c3R1ZHl8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80" alt="Card image">
    <div class="card-body">
        <h4 class="card-title"><?php echo $row['title'] ?></h4>
        <p class="card-text"><?php echo $row['description'] ?></p>
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
<?php
    }else{
?>
    <div class='card-img-top'><?php echo stripslashes($row['link'])?></div>
    <div class="card-body">
        <h4 class="card-title"><?php echo $row['title'] ?></h4>
        <p class="card-text"><?php echo stripslashes($row['description']) ?></p>
<?php
    }  
    ?>
        <button class='btn btn-info' onclick='load_update_data(<?php echo $row["dataid"];?>)' data-bs-toggle="modal" data-bs-target="#updateExistingModal"><i class="fa fa-edit"></i></button>
        <button class='btn btn-danger' onclick='delete_material(<?php echo $row["dataid"];?>)'><i class="fa fa-trash-alt"></i></button>
    </div>
</div>
    <?php 

    }
?>
    </div>

    <!-- Button trigger modal -->

    

<!-- addNewDataModal -->
<div class="modal fade" id="addNewDataModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Insert New Course Material</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <form id='addData'>
        <input type='hidden' name='courseid' value='<?php echo $_SESSION['p_course'];?>'>
        <div class="form-group">
            <label for="addmaterialType" class="form-label">Type of Material:</label>
            <select class="form-select" id='addmaterialType' aria-label="Default select example" name='type'>
                <option selected value='pdf'>PDF</option>
                <option value="video">YouTube Video</option>
                <option value="code">Embedding HTML code</option>
            </select>
            <div id="typeHelp" class="form-text">Select the type correctly as that will decide how the material looks like.</div>
        </div>

        <div class="form-group">
            <label for="addlink" class="form-label">Link / code to embed:</label>
            <textarea class='form-control' rows='4' id='addlink' name='link' style='width: 100%'></textarea>
        </div>

        <div class="form-group">
            <label for="addtitle" class="form-label">Title of the material:</label>
            <input type='text' class='form-control' name='title' rows='4' id='addtitle' style='width: 100%'>
        </div>

        <div class="form-group">
            <label for="adddescription" class="form-label">Description of the material:</label>
            <textarea class='form-control' rows='4' name='description' id='adddescription' style='width: 100%'></textarea>
        </div>
        </div>
        <div class="modal-footer">
            
            <input type="submit" name='submit' id='addsubmit' class="btn btn-success" value='Save Changes'/>
            </form>
            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
        </div>

      
      
      
    </div>
  </div>
</div>

<!-- updateExistingModal -->
<div class="modal fade" id="updateExistingModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Update Existing Course Material</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <form id='updateData'>
        <input type='hidden' name='dataid' id='updateDataId'>
        <input type='hidden' name='courseid' value='<?php echo $_SESSION['p_course'];?>'>
        <div class="form-group">
            <label for="updateMaterialType" class="form-label">Type of Material:</label>
            <select class="form-select" id='updateMaterialType' aria-label="Default select example" name='type'>
                <option selected value='pdf'>PDF</option>
                <option value="video">YouTube Video</option>
                <option value="code">Embedding HTML code</option>
            </select>
            <div id="typeHelp" class="form-text">Select the type correctly as that will decide how the material looks like.</div>
        </div>

        <div class="form-group">
            <label for="updateLink" class="form-label">Link / code to embed:</label>
            <textarea class='form-control' rows='4' id='updateLink' name='link' style='width: 100%'></textarea>
        </div>

        <div class="form-group">
            <label for="updateTitle" class="form-label">Title of the material:</label>
            <input type='text' class='form-control' name='title' rows='4' id='updateTitle' style='width: 100%'>
        </div>

        <div class="form-group">
            <label for="updateDescription" class="form-label">Description of the material:</label>
            <textarea class='form-control' rows='4' name='description' id='updateDescription' style='width: 100%'></textarea>
        </div>
        </div>
        <div class="modal-footer">
            
            <input type="submit" name='submit' id='updateSubmit' class="btn btn-success" value='Save Changes'/>
            </form>
            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
        </div>

      
      
      
    </div>
  </div>
</div>
<script>
    $(document).ready(function(){
        $('#addData').submit(function(event){
                event.preventDefault();

                var formValues= $(this).serialize();
                console.log(formValues);

                $.post("add_course_data.php", formValues, function(data){
                    // Display the returned data in browser
                    alert(data);
                });
            });

        $('#updateData').submit(function(event){
            event.preventDefault();

            var formValues= $(this).serialize();
            console.log(formValues);

            $.post("update_course_data.php", formValues, function(data){
                // Display the returned data in browser
                alert(data);
            });
        });
    });

    $('#addsubmit').click(function(){
        $('#addData').submit();
    })

    function load_update_data(dataid){
        $.post('load_update_data.php', {
            dataid: dataid
        }, function(data){
            let result = JSON.parse(data);
            $('#updateDataId').val(result.dataid);
            $('#updateMaterialType').val(result.type);
            $('#updateLink').html(result.link);
            $('#updateTitle').val(result.title);
            $('#updateDescription').html(result.description);
        })
    }

    $('#updateSubmit').click(function(){
        $('#updateData').submit();
    })

    function delete_material(dataid){
        if(confirm('Are you sure you want to delete this course material?')){
            $.post('delete_course_material.php', {
                dataid: dataid
            }, function(data){
                if(data!='DELETED')
                    alert(data);

                show_course_materials();
            })
        }
    }
</script>
    <?php
}else{
    echo $con->error;
}