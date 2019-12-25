<style type="text/css">
  
  span a{

    color:#fff;
  }
  input#save{
    position: absolute;
    top: 10px;
    right: 80px;
    width: 60px;
    height: 50px;
    -webkit-transition: all 2s ease-in-out;
    transition: all 2s ease-in-out;
    z-index: 1;
    border-radius: 3px 0 0 3px;
    padding: 10px;
    background-color: #41a6d9;
    color: white;
    text-align: center;
    box-sizing: border-box;

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
          <div class="col col-xs-6">
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
          <div class="col col-xs-6">
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
      </div>  
    </div>
  </div>  
</div>
<ul class="nav nav-tabs" id="panelTab">
  <li><a href="#complaint" data-toggle="tab" id="one">Complaint</a></li>
<!--   <li><a href="#exam" data-toggle="tab" id="two">Examination</a></li>
 -->  <li><a href="#history" data-toggle="tab" id="three">History</a></li>
  <li><a href="#diagnosis" data-toggle="tab" id="four">Diagnosis</a></li>
  <li><a href="#investigation" data-toggle="tab" id="five">Investigation</a></li>
  <li><a href="#rx" data-toggle="tab"><img src="<?php echo base_url();?>/assets/images/rx_logo.png" width="20px" height="20px"></a></li> 
  <li><a href="#invoice" data-toggle="tab"  onclick="invoiceload(<?php echo $patient_data['id'] ?>)">Invoice</a></li>
</ul>

<input class="btn btn-primary pull-right ml-5" type="button" value="Save" id="save">

<section class='content'>

 <div class="tab-content">



  <?php
  
  include_once __DIR__ . '/panel/investigation.php';
  include_once __DIR__ . '/panel/diagnosis.php';
  include_once __DIR__ . '/panel/complaint.php';
  include_once __DIR__ . '/panel/history.php';
  include_once __DIR__ . '/panel/rx.php';   
  include_once __DIR__ . '/panel/exam.php';
  include_once __DIR__ . '/panel/invoice.php';
  
  ?>
</div>
</section>
	  <script>

   $(document).ready(function(){

     $("[id=comment]").summernote({

         height : 150,
     });

    $("[id=comment]").summernote('insertUnorderedList');


       $('#collapseCom,#collapseHis').trigger('click');

    })

       $(window).scroll(function() {
           var winScrollTop = $(window).scrollTop();
           var winHeight = $(window).height();
           var floaterHeight = $('#save').outerHeight(true);
           var fromBottom = 20;
           var top = winScrollTop + winHeight - floaterHeight - fromBottom;
       $('#save').css({'top': top + 'px'});

     });



        $("#save").on('click',function(){
              
              saveComplaint();
              saveExamination();
              saveHistory();

              alert('Compalint-success/Examination-success/History-success');

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

        function saveExamination()
        {

          $.post($('#examBox').attr('action'),$('#examBox').serialize(),
            function(data){
              $('#examGroup').prepend(data);
              $('#exam').val('');
            });
          return false; 

        }
	  </script>	
</div>
</section>
</div>
