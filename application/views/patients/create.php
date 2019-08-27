

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

         <?php echo ( !empty($error) ? $error : '' ); ?>


      <div class="panel-group" id="pInfo">
        <div class="panel panel-default">
          <div class="panel-heading">
              <h5>New Patient</h5>
          </div>
           <div id="pInfoBody" class="panel-collapse collapse in">
            <form role="form" action="<?php base_url('patients/create') ?>" method="post" >
      <div class="panel-body">
        <div class='col col-xs-6'>
          <label>Name: </label><input type="text" name="name" class="form-control" id="name"> <br/>
          <label>Age: </label><input type="text" name="age" class="form-control" id="age">  <br/>
        </div>
        <div class="col col-xs-6">
          <label>Gender:</label><br>
          <label class="radio-inline"><input type="radio" name='gender' value="1" title='Male' <?php echo isset($_POST['gender'])?($this->input->post('gender')?'checked':''):'';?> />Male</label>
              <label class="radio-inline"><input type="radio" name='gender' value="0" title='Female' <?php echo isset($_POST['gender'])?($this->input->post('gender')?'':'checked'):'';?> />Female</label><br><br>
          <label>Address:</label><textarea name="address" class="form-control" id="address"></textarea><br>
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