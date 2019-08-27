

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Patient
      <small>Info</small>
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
      <div class="col-md-12 col-xs-12">

        <div id="messages"></div>
       
        <?php if($this->session->flashdata('error')): ?>
          <div class="alert alert-error alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <?php echo $this->session->flashdata('error'); ?>
          </div>
        <?php endif; ?>

      <div class="panel-group" id="pInfo">
        <div class="panel panel-default">
          <div class="panel-heading">
              <h5>Edit Patient Infomation</h5>
          </div>
           <div id="pInfoBody" class="panel-collapse collapse in">
            <form role="form" action="<?php base_url('patients/create') ?>" method="post" >
      <div class="panel-body">
        <div class='col col-xs-6'>
          <label>Name: </label><input type="text" name="name" class="form-control" id="name" value="<?php echo $patient_data['name'];?>"> <br/>
          <label>Age: </label><input type="text" name="age" class="form-control" id="age" value="<?php echo $patient_data['age'];?>">  <br/>
        </div>
        <div class="col col-xs-6">
          <label>Gender:</label><br>
           <label class="radio-inline">
                      <input type="radio" name="gender" id="male" value="1" <?php if($patient_data['gender'] == 1) {
                        echo "checked";
                      } ?>>
                      Male
                    </label>
                <label class="radio-inline">
                      <input type="radio" name="gender" id="female" value="0" <?php if($patient_data['gender'] == 0) {
                        echo "checked";
                      } ?>>
                      Female
                    </label><br><br>
          <label>Address:</label><textarea name="address" class="form-control" id="address"><?php echo $patient_data['address'];?></textarea><br>
          <div class="pull-right">
          <a href="<?php echo base_url('patients/index')?>" class="btn btn-warning">Back</a>
          <input type="submit" value="save" id="save" class="btn btn-primary">
        </div>
        </div>
      </div>
    </form>
         </div>
        </div>
      </div>

      </div>
      <!-- col-md-12 -->
    </div>
    <!-- /.row -->
    

  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->