
<div class="tab-pane" id="history" style="padding-top: 10px;">

	 <script>
    $(document).ready(function(){


      //script of this section
      $('#savehistory').click(function(){
        
          $.post($('#historyBox').attr('action'),$('#historyBox').serialize(),
            function(data){
              $('#historyGroup').prepend(data);
              $('#history').val('');
            });
          return false;
        
      });

      $("#historyGroup span > i >  a").on('click',historyAction);
         
      function historyAction(e)
      {
        e.preventDefault();
        var csrfVal=$('form input[name="csrf_test_name"]').val();
        var hid    =$(this).attr('hid');
        var pi     =$(this).attr('pi');
        if($(this).attr('action')=='delete'){
      
            $.post('<?php echo site_url("historys/delete")."/";?>'+hid,'csrf_test_name='+csrfVal+'&history_id='+hid+'&patient_id='+pi,function(data){
            if(data=='ok'){
              $('#history'+hid).fadeOut();
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
       
       echo form_open('historys/create/'.$patient_data['id'],array('id'=>'historyBox'));
	   echo form_hidden('patient_id',$patient_data['id']);
      echo form_textarea('history','','class="form-control" id="comment"  placeholder="Write your history about this patient..." required')."<br>";
      echo form_submit('Save','Save','class="btn btn-primary ml-3" id="savehistory"');
      echo form_close();
      echo "<p></p>"; 

  }
  echo "<div id='historyGroup'>";
  foreach($history as $his) {

      echo "<div id='history".$his->id."' class='well well-md'>"; 
          echo "<div class='historyBody'><span class='badge badge-warning pull-right'><i class='fa fa-trash'>
           ".anchor('#', 'Del ',array('hid'=>$his->id,'pi'=>$his->patient_id,'action'=>'delete'))."</i></span>".$his->history.'</div>';
          echo "<div class='pull-right'>Create Date: ".$his->created_date."</div>";//<span class='close'>&times;</span>
        echo "</div>";
  }
   echo "</div>";
		?>
		</div>

</div>

