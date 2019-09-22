<div class="tab-pane" id="rx" style="padding-top: 10px;">
    <script>
    $(document).ready(function(){
      //script of assign drug click
      $('#addDrug').click(function(){
        $.ajax($('#addDrug').attr('href')).done(function(data){
          $('#tmpDiv').html(data);
        });
        return false;
      });
      //script of payment click
      $('#drugGroup tr > td> a').on('click',drugItemsAction);
    });
  </script>
  <script>
    function drugItemsAction(e){
        e.preventDefault();
        var csrfVal=$('form input[name="csrf_test_name"]').val();
        var dpi=$(this).attr('dpi');
        var di=$(this).attr('di');
        var pi=$(this).attr('pi');
        var qu=$(this).attr('qu');
        var tc=$(this).attr('tc')*1;
      if($(this).attr('action')=='delete'){
          $.post('<?php echo site_url("pharmacy/deletedpi")."/";?>'+dpi,'csrf_test_name='+csrfVal+'&drug_patient_id='+dpi+'&drug_id='+di+'&quantity='+qu+'&patient_id='+pi,function(data){
            if(data=='ok'){
              $('#dpi'+dpi).fadeOut();
            }else if(data=='mismatch'){
              alert('Delete data mismatch');
            }else if(data=='invalid'){
              alert('Invalid data');
            }
          });
        }
      }
  </script>
 <?php 
    
    if(in_array('createPatient', $user_permission)){

     echo anchor('pharmacy/search','Assign',array('id'=>'addDrug','class'=>'btn btn-primary'));

     echo "<div class='hidden'>".form_open('pharmacy/assign',array('id'=>'addDrugForm'));
     echo form_input('patient_id',$patient_data['id'],'id="patient_id"');
     echo form_input('med_id','','id="drug_id"'); 
     echo form_input('quantity','','id="no_of_item"');
     echo form_input('total_cost','','id="total_cost"');
     echo form_close().'</div>';

    }

 ?><br>
  <div id='drugError'></div>
	<div id='drugGroup' class="responsive-table">
    <table class="table table-bordered table-striped">
    <thead>
      <tr>
          <th>#</th>
          <th>Name</th>
          <th>Expiry date</th>
          <th>Price</th>
          <th>QTY</th>
          <th>Total Cost</th>
          <th>Date</th> 
          <th></th>
      </tr>
    </thead>
    <tbody>
   
   <?php
    
  if($med_patient){
    $i=0;
   foreach($med_patient as $pat){
   
     $this->model_pharmacy->load($pat->med_id);
     echo '<tr id="dpi'.$pat->med_patient_id.'"><td class="id">'.++$i.'</td>'.
            '<td>'.$this->model_pharmacy->medicine_name.'</td>'.
            '<td>'.$this->model_pharmacy->expire_date.'</td>'.
            '<td>'.$this->model_pharmacy->selling_price.'</td>'.
            '<td>'.$pat->quantity.'</td>'.
            '<td>'.$pat->total_cost.'</td>'.
            '<td>'.date('d/m/Y',$pat->assign_date).'</td>';
             echo '<td class="actions">'.anchor('#', 'Delete ',array('dpi'=>$pat->med_patient_id,'di'=>$pat->med_id,'qu'=>$pat->quantity,'pi'=>$pat->patient_id,'action'=>'delete',/*'onclick'=>'drugItemsAction',*/'tc'=>$pat->total_cost)).'</td>';
    echo '</tr>';  
   }
  }
    ?>
   </tbody>
  </table>
 </div>
</div>
