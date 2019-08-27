<div class="content-wrapper">
	<!-- (Content Heder) -->
	<section class="content-header">
	<h1>
      Manage
      <small>Patients</small>
    </h1>

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
              <h5>Patient Infomation</h5>
          </div>
           <div id="pInfoBody" class="panel-collapse collapse in">
      <div class="panel-body">
        <div class="col col-xs-6">
      <table>
        <tr>
          <th>Name</th>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $patient_data['name'];?></td>
         
        </tr>
        <tr>
          <th>Age</th>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $patient_data['age'];?></td>
         
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
    <li class="active"><a href="#comments" data-toggle="tab">Complaints</a></li>
    <li><a href="#drugs" data-toggle="tab">RX</a></li>
    <li><a href="#xrays" data-toggle="tab">X-Rays</a></li>
    <li><a href="#labs" data-toggle="tab">Laboratory Tests</a></li>
  </ul>

     <div class="tab-content">
     	
     	<?php

     	include_once __DIR__ . '/panel/complaint.php';

     	?>
     </div>
    </div>
  </section>
</div>