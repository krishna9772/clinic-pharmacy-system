<style type="text/css">
  
  span a{

    color:#fff;
  }

</style>
<div class="content-wrapper">
	<!-- (Content Heder) -->
	<section class="content-header">
   <h1>
    Manage
    <small>Patients</small>
  </h1>
  <a href="<?php echo base_url();?>patients/" class="btn btn-warning"><i class="fa fa-arrow-left"></i></a>

  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">Patients</li>
  </ol>


</section>

<!-- Main content -->
<section class="content">
  <!-- Small boxes (Stat box) -->
  <div class="row">
   <div class="panel-group" id="pInfo">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h2>Patient Infomation</h2>
      </div>
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
  <li><a href="#complaint" data-toggle="tab">Complaint</a></li>
  <li><a href="#exam" data-toggle="tab">Examination</a></li>
  <li><a href="#history" data-toggle="tab">History</a></li>
  <li><a href="#diagnosis" data-toggle="tab">Diagnosis</a></li>
  <li><a href="#investigation" data-toggle="tab">Investigation</a></li>
  <li><a href="#rx" data-toggle="tab"><img src="<?php echo base_url();?>/assets/images/rx_logo.png" width="20px" height="20px"></a></li> 
  <li><a href="#invoice" data-toggle="tab"  onclick="invoiceload(<?php echo $patient_data['id'] ?>)">Invoice</a></li>
</ul>

<section class='content'>

 <div class="tab-content">



  <?php
  
  include_once __DIR__ . '/panel/investigation.php';
  include_once __DIR__ . '/panel/diagnosis.php';
  include_once __DIR__ . '/panel/history.php';
  include_once __DIR__ . '/panel/complaint.php';
  include_once __DIR__ . '/panel/rx.php';   
  include_once __DIR__ . '/panel/exam.php';
  include_once __DIR__ . '/panel/invoice.php';
  
  ?>
</div>
</section>
<script>

  $(document.ready(function(){
    if(sessionStorage.getItem("init") == "init"){
      $('#panelTab a:first').tab('show')
      sessionStorage.setItem("init", "Notinit");
    }
    else{
      $('#panelTab a:last').tab('show')
    }
  });
  

  $(function () {
    $('#panelTab a:first').tab('show')
  })

  function invoiceload(id){
   window.location.reload();
 }

</script>
</div>
</section>
</div>
