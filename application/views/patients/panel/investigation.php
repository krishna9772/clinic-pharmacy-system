
<div class="tab-pane" id="investigation" style="padding-top: 10px;">

	 <script>
    $(document).ready(function(){


      //script of this section
      $('#saveinvestigation').click(function(){
        
          $.post($('#investigationBox').attr('action'),$('#investigationBox').serialize(),
            function(data){
              $('#investigationGroup').prepend(data);
              $('#investigation').val('');
            });
          return false;
        
      });

      $("#investigationGroup span > i >  a").on('click',investigationAction);
         
      function investigationAction(e)
      {
        e.preventDefault();
        var csrfVal=$('form input[name="csrf_test_name"]').val();
        var iid    =$(this).attr('iid');
        var pi     =$(this).attr('pi');
        if($(this).attr('action')=='delete'){
      
            $.post('<?php echo site_url("investigations/delete")."/";?>'+iid,'csrf_test_name='+csrfVal+'&investigation_id='+iid+'&patient_id='+pi,function(data){
            if(data=='ok'){
              $('#investigation'+iid).fadeOut();
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
       
       echo form_open('investigations/create/'.$patient_data['id'],array('id'=>'investigationBox'));
	   echo form_hidden('patient_id',$patient_data['id']);
      echo form_textarea('investigation','','class="form-control" id="comment"  placeholder="Write your investigation about this patient..." required autofocus')."<br>";
      echo form_submit('Save','Save','class="btn btn-primary ml-3" id="saveinvestigation"');
      echo form_close();
      echo "<p></p>"; 

  }
  echo "<div id='investigationGroup'>";
  foreach($investigation as $inves) {

      echo "<div id='investigation".$inves->id."' class='well well-md'>"; 
          echo "<div class='investigationBody'><span class='badge badge-warning pull-right'><i class='fa fa-trash'>
           ".anchor('#', 'Del ',array('iid'=>$inves->id,'pi'=>$inves->patient_id,'action'=>'delete'))."</i></span>".$inves->investigation.'</div>';
          echo "<div class='pull-right'>Create Date: ".$inves->created_date."</div>";//<span class='close'>&times;</span>
        echo "</div>";
  }
   echo "</div>";
		?>
		</div>

</div>

