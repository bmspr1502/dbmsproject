<?php
session_start();
include '../../dbconfig/config.php';

if(isset($_POST['courseid'])){
    ?>

<input type="text" id="searchbox" placeholder="Search for previously asked questions" class="form-control" />
<div class='mt-3'>
    <form id='askNewQuestion'>
        <div class='row d-flex'>
            <div class='col-md-10 d-flex'>
                    <input type='hidden' name='courseid' value='<?php echo $_POST['courseid']; ?>'>
                    <input type='hidden' name='usertype' value='student'>
                    <input type='hidden' name='userid' value='<?php echo $_SESSION['sroll_no']; ?>'>
                <input class="form-control" id='description' name='description' type="text" placeholder="Add New Question">
            </div>

            <div class='col-md-2 d-flex'>
                <input type='submit' name='submit' class='btn btn-danger' value='Add Post'>
            </div>
        </div>
    </form>
</div>

    <?php
    $qnquery = $con->prepare('SELECT * FROM `course_forum_qn` WHERE courseid=?;');
    $qnquery->bind_param('s', $_POST['courseid']);
    $ansquery = $con->prepare('SELECT * FROM `course_forum_ans` WHERE qnid=?');
    $qnquery->execute();
    $result = $qnquery->get_result();
    while($qn = $result->fetch_assoc()){
        ?>

<div class="card mt-3">
  <div class="card-header">
  <blockquote class="blockquote mb-0 text-dark">
                <p class='card-title'><?php echo $qn['description'];?></p>
            <div class='row'>
            <footer class="blockquote-footer col-md-9"><?php
            $date = date_create($qn['time']);
            echo date_format($date, 'H:i - d F, Y') ;?>.<br>Posted by-- <a href='#' data-toggle="modal" data-target="#viewProfile" onclick='show_information_of_person("<?php echo $qn["usertype"]?>","<?php echo $qn["posted_by"]?>")'><?php echo $qn['usertype']." : ". $qn['posted_by'];?></a>
            </footer>
            <button class="btn btn-primary col-md-3 float-right" type="button" data-toggle="collapse" data-target="#answerforqn<?php echo $qn['qnid'] ?>" aria-expanded="false" aria-controls="answerforqn<?php echo $qn['qnid'] ?>">
                View Answers
            </button>
            </div>
    </blockquote>
  </div>
  <div class="card-body collapse" id='answerforqn<?php echo $qn['qnid'] ?>'>
  <div class='mb-3'>
        <form class='addAnswer'>
            <div class='row d-flex'>
                <div class='col-md-10 d-flex'>
                    <input type='hidden' name='qnid' value='<?php echo $qn['qnid'] ?>'>
                    <input type='hidden' name='usertype' value='student'>
                    <input type='hidden' name='userid' value='<?php echo $_SESSION['sroll_no']; ?>'>
                    <input class="form-control" name='answer' type="text" placeholder="Add a response">
                </div>

                <div class='col-md-2 d-flex'>
                    <input type='submit' name='submit' class='btn btn-dark' value='Add Answer'>
                </div>
            </div>
        </form>
    </div>
  <?php
            $ansquery->bind_param('i', $qn['qnid']);
            $ansquery->execute();
            $ansres = $ansquery->get_result();
            while($answers = $ansres->fetch_assoc()){
                ?>
                
            <div class='row container'>
                    <div class='col-md-3 bg-dark text-white'>
                        <p><a href='#' data-toggle="modal" data-target="#viewProfile" onclick='show_information_of_person("<?php echo $answers["usertype"]?>","<?php echo $answers["userid"]?>")'><b><?php echo $answers['usertype'] . " : " . $answers['userid'];?></b></a>
                        <br><?php
            $date = date_create($answers['time']);
            echo date_format($date, 'H:i - d F, Y') ;?></p>
                    </div>
                    <div class='col-md-9 bg-light text-dark' style='border-bottom: 1px solid black'>
                        <?php echo $answers['answer'];?>
                    </div>
            </div>
                <?php
            }
        ?>
  </div>
</div>
   

        <?php
    }
?>
<script>
function search_text(value){
        $('.card-header ').each(function(){
            var found = 'false';
            $(this).each(function(){
                if($(this).text().toLowerCase().indexOf(value.toLowerCase()) >= 0)
                {
                    found = 'true';
                }
            });
            if(found == 'true'){
                $(this).show()
            }
            else {
                $(this).hide();
            }
        })
    }

$(document).ready(function() {

    $('#askNewQuestion').submit(function(event){
        event.preventDefault();
            if($('#description').val()){
                
                var formValues= $(this).serialize();
                $.post("api/add_new_question.php", formValues, function(data){
                    alert(data);
                    show_course_discussion();
                });
            }else{
                alert('Add some text');
            }
            
        });


        $('.addAnswer').submit(function(event){
        event.preventDefault();
            
            var formValues= $(this).serialize();
            
            $.post("api/add_new_answer.php", formValues, function(data){
                alert(data);
                show_course_discussion();
            });
          
        });

    
    $('#searchbox').keyup(function(){
        search_text($(this).val());
    });
});


</script>
<?php
}else{
    echo "NOT VIEWABLE";
}
