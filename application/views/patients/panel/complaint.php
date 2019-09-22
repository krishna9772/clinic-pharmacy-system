
<div class="tab-pane" id="complaint" style="padding-top: 10px;">

   <script>
    $(document).ready(function(){
      //script of this section
      $('#savecomplaint').click(function(){

          $.post($('#commentBox').attr('action'),$('#commentBox').serialize(),
            function(data){
              $('#commentGroup').prepend(data);
              $('#comment').val('');
            });
          return false;
        
      });

      $("#commentGroup span > i >  a").on('click',complaintAction);
         
      function complaintAction(e)
      {
        e.preventDefault();
        var csrfVal=$('form input[name="csrf_test_name"]').val();
        var cid    =$(this).attr('cid');
        var pi     =$(this).attr('pi');
        if($(this).attr('action')=='delete'){
      
            $.post('<?php echo site_url("complaints/delete")."/";?>'+cid,'csrf_test_name='+csrfVal+'&complaint_id='+cid+'&patient_id='+pi,function(data){
            if(data=='ok'){
              $('#comment'+cid).fadeOut();
            }else if(data=='mismatch'){
              alert('Delete data mismatch');
            }else if(data=='invalid'){
              alert('Invalid data');
            }
          });
        }
      }
    });
  </script>

  <div class="">

	<?php if($patient_data['id'] == TRUE){
       
       echo form_open('complaints/create/'.$patient_data['id'],array('id'=>'commentBox'));
	   echo form_hidden('patient_id',$patient_data['id']);
      echo form_textarea('complaint','','class="form-control" id="comment"  placeholder="Write your complaint about this patient..." required')."<br>";
      echo form_submit('Save','Save','class="btn btn-primary ml-3" id="savecomplaint"');
      echo form_close();
      echo "<p></p>"; 

  }
  echo "<div id='commentGroup'>";
  foreach($complaint as $com) {

      echo "<div id='comment".$com->id."' class='well well-md'>"; 
          echo "<div class='commentBody'>
          <span class='badge badge-warning pull-right'><i class='fa fa-trash'>
           ".anchor('#', 'Del ',array('cid'=>$com->id,'pi'=>$com->patient_id,'action'=>'delete'))."</i></span>"
          .$com->complaint.'</div>';
          echo "<div class='pull-right'>Create Date: ".$com->created_date."</div>";//<span class='close'>&times;</span>
        echo "</div>";
  }
   echo "</div>";
		?>
		</div>
</div>
