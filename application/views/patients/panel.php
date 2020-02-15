<style type="text/css">
  
  span a{

    color:#fff;
  }
  input#save{
  
    position: fixed;
    bottom: 25px;
    right: 90px; 
    display: inline;
    z-index: 1;
    width: 60px;
  }
j
  #detail{

    position: absolute;
    width: 100%;
    height: 70px;
    -webkit-transition: all 2s ease-in-out;
    transition: all 2s ease-in-out;
    border-radius: 3px 0 0 3px;
    padding: 15px;
    background-color: #41a6d9;
    color: white;
    text-align: center;
    box-sizing: border-box;


  }

  #historyeditor,#investigationeditor,#editor {
    display: block;
    box-sizing: padding-box;
    overflow: hidden;
    width: 350px;
    font-size: 14px;
    border-radius: 6px;
    box-shadow: 2px 2px 8px rgba(black, .3);
    border: 0;

  }

  .new {

     border: solid #c25b11;

  }

</style>
<div class="content-wrapper">
	<!-- (Content Heder) -->
  	<!-- <section class="content-header">
    <a href="<?php echo base_url();?>patients/" class="btn btn-warning"><i class="fa fa-arrow-left"></i></a>
  </section> -->

<!-- Main content -->
<section class="content">
  <!-- Small boxes (Stat box) --> 
  <div class="row">
   <div class="panel-group" id="pInfo">
    <div class="panel panel-default">
      <div id="pInfoBody" class="panel-collapse collapse in">
        <div class="panel-body">
          <div class="col col-xs-5">
            <table>
              <tr>
                <th>Name</th>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $patient_data['name'];?></td>
                
              </tr>
              <?php

              $year = ($patient_data['year'] != 0) ? $patient_data['year']." yr      ":'';
              $month = ($patient_data['month'] != 0) ? $patient_data['month']." mon   ":'';
              $day  = ($patient_data['day'] != 0) ? $patient_data['day']." d     ":'';
             ?>
              <tr>
                <th>Age</th>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $year.$month.$day?></td>
                
              </tr>
            </table>


          </div>     
          <div class="col col-xs-4">
           <table>
            <tr>
              <th>Gender</th>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo ($patient_data['gender'] ==1)?'Male':'Female';?></td>
              
            </tr>
            <tr>
              <th>Address</th>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $patient_data['address'];?></td>
              
            </tr>
          </table>
          
        </div>

        <div class="col col-xs-2">
            <?php

            $status = '';

            foreach($pres_patient as $prespat){
                
              $status = ($prespat->highlighted == 1) ? '<span class="label label-info" id="ppipanel'.$prespat->pres_patient_id.'">'.$prespat->pres_name.'</span> ' : '';

              echo $status;

            }

             ?>

            <?php

            foreach($med_patient as $medpat){

             $this->model_pharmacy->load($medpat->med_id);
                
              $status = ($medpat->highlighted == 1) ? '<span class="label label-info" id="dpipanel'.$medpat->med_patient_id.'">'.$this->model_pharmacy->medicine_name.'</span> ' : '';

              echo $status;

              
            }

            
             ?>

        </div>

        
      </div>  
    </div>
  </div>  
  <div class="col col-xs-1 pull-right" style="background: orange;border-radius: 3px;color: #000;">
            
            <a href="<?php echo base_url()?>patients/detail/<?php echo $patient_data['id']?>" class="" id="detail"><i class="fa fa-arrow-right">Details</i></a>
 </div>
</div>

<?php
       echo form_open('patients/count/',array('id'=>'visitbox'));

       echo form_hidden('patient_id',$patient_data['id']);

       // echo form_submit('Save','Save','class="btn btn-primary ml-3" id="savehistory"');
       echo form_close();
?>
<!-- <ul class="nav nav-tabs" id="panelTab">
 --><!--   <li><a href="#complaint" data-toggle="tab" id="one">Complaint</a></li>
 --><!--   <li><a href="#exam" data-toggle="tab" id="two">Examination</a></li>
 -->  <!-- <li><a href="#history" data-toggle="tab" id="three">History</a></li> -->
<!--   <li><a href="#diagnosis" data-toggle="tab" id="four">Diagnosis</a></li>
 --><!--   <li><a href="#investigation" data-toggle="tab" id="five">Investigation</a></li>
 -->  <!-- <li><a href="#rx" data-toggle="tab"><img src="<?php echo base_url();?>/assets/images/rx_logo.png" width="20px" height="20px"></a></li>  -->
  <!-- <li><a href="#invoice" data-toggle="tab"  onclick="invoiceload(<?php echo $patient_data['id'] ?>)">Invoice</a></li> -->
<!-- </ul>
 -->
<input class="btn btn-primary pull-right ml-5" type="button" value="Save" id="save">



<section class='content'>

 <div class="tab-content">

  <?php
  
  include_once __DIR__ . '/panel/complaint.php';
  include_once __DIR__ . '/panel/history.php';
  include_once __DIR__ . '/panel/investigation.php';
  include_once __DIR__ . '/panel/exam.php';
  include_once __DIR__ . '/panel/diagnosis.php';
  include_once __DIR__ . '/panel/rx.php';   
  // include_once __DIR__ . '/panel/invoice.php';
  
  ?>
</div>
</section>
	  <script>

   $(document).ready(function(){

    $('#collapseCom,#collapseHis,#collapseInv,#collapseEx,#collapseDia').trigger('click');

    });

   $(function () {
  var $textareas = $('textarea');

  $textareas.on('input', autosize);

  function autosize() {
    var $this = $(this);

    $this
      .css({height: 'auto'})
      .css({height: $this.prop('scrollHeight')});
  }
});


// initialize all expanding textareas
// $(function() {
//     $("textarea[class*=autoexpand]").TextAreaExpander();
// });

      // $(document).on('keyup','#s_bp', function() {
      // if ($.trim($(this).val()).length == 0) {
      //   $('#save').hide();
      // } else {
      //   $('#save').show();
      // }
      // });

      // $('[id="editor"]').summernote({
      //  }).on('summernote.keyup', function() {

      //    // alert(($(this).val()).length);
      //    if(($(this).val()).length == 22 || ($(this).val()).length == 0 ) {
      //      $('#save').hide();
      //    } else {

      //        $('#save').show();

      //    }
        
      // });

     //   $(window).scroll(function() {//For button scrollling
     //    $('#save').show();
     //       var winScrollTop = $(window).scrollTop();
     //       var winHeight = $(window).height();
     //       var floaterHeight = $('#save').outerHeight(true);
     //       var fromBottom = 20;
     //       var top = winScrollTop + winHeight - floaterHeight - fromBottom;
     //   $('#save').css({'top': top + 'px'});


     // });
   

        $("#save").on('click',function(){

        var checked =  $("input[name='diagnosis[]']").is(":checked");
            
            if(($("#editor").val()).length == 22 || ($("#editor").val()).length == 0) {
            
              
            }else{
                saveComplaint();
                $("#editor").val('');
                

            }
          
            if(($("#historyeditor").val()).length == 0){

            }else{
              saveHistory();
              $("#historyeditor").val('');

              
            }

            if(($("#investigationeditor").val()).length == 0){
               

            }else{

              saveInvestigation();
              $("#investigationeditor").val('');


            }
              
             if(($("#s_bp").val()).length == 0 || ($("#d_bp").val()).length == 0){
                  

             }else{

               saveExamination();
               $("input[type=text]").val('');
             }
             
             if(checked != false){
              
              saveDiagnosis();
              $("input[type=checkbox]").prop('checked',false);

             }else{

             }

             countVisit();

        })

        function saveComplaint()
        {

          $.post($('#commentBox').attr('action'),$('#commentBox').serialize(),
            function(data){
              $('#commentGroup').prepend(data);
              $('#comment').val('');
            });
          return false;

        }

        function saveHistory()
        {

           $.post($('#historyBox').attr('action'),$('#historyBox').serialize(),
            function(data){
              $('#historyGroup').prepend(data);
              $('#history').val('');
            });
          return false;

        }
        function saveInvestigation()
        {

           $.post($('#investigationBox').attr('action'),$('#investigationBox').serialize(),
            function(data){
              $('#investigationGroup').prepend(data);
              $('#investigation').val('');
            });
          return false;

        }

        function saveExamination()
        {

          $.post($('#examBox').attr('action'),$('#examBox').serialize(),
            function(data){
              $('#examGroup').prepend(data);
              $('#exam').val('');
            });
          return false; 

        }

        function saveDiagnosis()
        {
            $.post($('#diagbox').attr('action'),$('#diagbox').serialize(),
         function(data){

            $('#diagnosisGroup').prepend(data);
            $('#diagnosis').val('');
         });
         return false;
        }

        function countVisit()
        {

            $.post($('#visitbox').attr('action'),$('#visitbox').serialize());

        }
	  </script>	
</div>
</section>
</div>
