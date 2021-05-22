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
        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Click Here to add
</button>
        </div>
    </div>
    <?php
    while($row = $result->fetch_assoc()){
     if($row['type']=='pdf'){
?>
<div class="card col-xl-3 col-lg-4 col-md-6 col-12" >
    <img class="card-img-top img-fluid" src="https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c3R1ZHl8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80" alt="Card image">
    <div class="card-body">
        <h4 class="card-title"><?php echo $row['title'] ?></h4>
        <p class="card-text"><?php echo $row['description'] ?></p>
        <a href="<?php echo $row['link'] ?>" target='_blank' class="btn btn-primary">Click here to view</a>
    </div>
</div>
<?php
    }else if($row['type']=='video'){
?>
<div class="card col-xl-3 col-lg-4 col-md-6 col-12" >
    <iframe height="250px" class="card-img-top" src="<?php echo $row['link']?>" 
            title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; 
            clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <div class="card-body">
        <h4 class="card-title"><?php echo $row['title'] ?></h4>
        <p class="card-text"><?php echo $row['description'] ?></p>
    </div>
</div>
<?php
    }else{
?>
<div class="card col-xl-3 col-lg-4 col-md-6 col-12" >
    <div class='card-img-top'><?php echo $row['link']?></div>
    <div class="card-body">
        <h4 class="card-title"><?php echo $row['title'] ?></h4>
        <p class="card-text"><?php echo $row['description'] ?></p>
    </div>
</div>
<?php
    }   

    }
?>
    </div>

    <!-- Button trigger modal -->

    

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <form id='addData'>
        <input type='hidden' name='courseid' value='<?php echo $_SESSION['p_course'];?>'>
        <div class="form-group">
            <label for="materialType" class="form-label">Type of Material:</label>
            <select class="form-select" id='materialType' aria-label="Default select example" name='type'>
                <option selected value='pdf'>PDF</option>
                <option value="video">YouTube Video</option>
                <option value="code">Embedding HTML code</option>
            </select>
            <div id="typeHelp" class="form-text">Select the type correctly as that will decide how the material looks like.</div>
        </div>

        <div class="form-group">
            <label for="link" class="form-label">Link / code to embed:</label>
            <textarea class='form-control' rows='4' id='link' name='link' style='width: 100%'></textarea>
        </div>

        <div class="form-group">
            <label for="title" class="form-label">Title of the material:</label>
            <input type='text' class='form-control' name='title' rows='4' id='title' style='width: 100%'>
        </div>

        <div class="form-group">
            <label for="description" class="form-label">Description of the material:</label>
            <textarea class='form-control' rows='4' name='description' id='description' style='width: 100%'></textarea>
        </div>
        </div>
        <div class="modal-footer">
            
            <input type="submit" name='submit' id='submit' class="btn btn-success" value='Save Changes'/>
            </form>
            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
        </div>

      
      
      
    </div>
  </div>
</div>

<script>
    $(document).ready(function(){
        $('#addData').submit(function(event){
                console.log('hello')
                event.preventDefault();

                var formValues= $(this).serialize();
                console.log(formValues);

                $.post("add_course_data.php", formValues, function(data){
                    // Display the returned data in browser
                    alert(data);
                });
            });
    });

    $('#submit').click(function(){
        $('#addData').submit();
    })
</script>
    <?php
}else{
    echo $con->error;
}