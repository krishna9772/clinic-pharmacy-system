
<div class="tap-pane active" id="comments" style="padding-top: 10px;">

   <script>
    $(document).ready(function(){
      //script of this section
      $('#comment').keypress(function(e){
        if(e.which==13)
        {
          $.post($('#commentBox').attr('action'),$('#commentBox').serialize(),
            function(data){
              $('#commentGroup').prepend(data);
              $('#comment').val('');
            });
          return false;
        }
      });
    });
  </script>

	<?php if($patient_data['id'] == TRUE){
       
       echo form_open('complaints/create/'.$patient_data['id'],array('id'=>'commentBox'));
	   echo form_hidden('patient_id',$patient_data['id']);
      echo form_textarea('complaint','','class="form-control" id="comment" style="height:100px;" placeholder="Write your complaint about this patient..." required');
      echo form_close();
      echo "<p></p>"; 

  }
  echo "<div id='commentGroup'>";
  foreach($complaint as $com) {

      echo "<div id='comment".$com->id."' class='well well-md'>";
          echo "<div class='commentBody'>".$com->complaint.'</div>';
          echo "<div class='pull-right'>Create Date: ".$com->created_date."</div>";//<span class='close'>&times;</span>
        echo "</div>";
  }
   echo "</div>";
		?>
		
</div>