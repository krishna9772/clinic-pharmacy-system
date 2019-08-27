

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Manage
        <small>Groups</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<?php echo base_url('groups/') ?>">Groups</a></li>
        <li class="active">Edit</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-md-12 col-xs-12">
          
          <?php if($this->session->flashdata('success')): ?>
            <div class="alert alert-success alert-dismissible" role="alert">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <?php echo $this->session->flashdata('success'); ?>
            </div>
          <?php elseif($this->session->flashdata('error')): ?>
            <div class="alert alert-error alert-dismissible" role="alert">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <?php echo $this->session->flashdata('error'); ?>
            </div>
          <?php endif; ?>

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Edit Group</h3>
            </div>
            <form role="form" action="<?php base_url('groups/update') ?>" method="post">
              <div class="box-body">

                <?php echo validation_errors(); ?>

                <div class="form-group">
                  <label for="group_name">Group Name</label>
                  <input type="text" class="form-control" id="group_name" name="group_name" placeholder="Enter group name" value="<?php echo $group_data['groupname']; ?>">
                </div>
                <div class="form-group">
                  <label for="permission">Permission</label>

                  <?php $serialize_permission = unserialize($group_data['permission']); ?>
                  
                  <table class="table table-responsive">
                    <thead>
                      <tr>
                        <th></th>
                        <th>Create</th>
                        <th>Update</th>
                        <th>View</th>
                        <th>Delete</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>Users</td>
                        <td><input type="checkbox" class="minimal" name="permission[]" id="permission" class="minimal" value="createUser" <?php if($serialize_permission) {
                          if(in_array('createUser', $serialize_permission)) { echo "checked"; } 
                        } ?> ></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateUser" <?php 
                        if($serialize_permission) {
                          if(in_array('updateUser', $serialize_permission)) { echo "checked"; } 
                        }
                        ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewUser" <?php 
                        if($serialize_permission) {
                          if(in_array('viewUser', $serialize_permission)) { echo "checked"; }   
                        }
                        ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteUser" <?php 
                        if($serialize_permission) {
                          if(in_array('deleteUser', $serialize_permission)) { echo "checked"; }  
                        }
                         ?>></td>
                      </tr>
                      <tr>
                        <td>Groups</td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createGroup" <?php 
                        if($serialize_permission) {
                          if(in_array('createGroup', $serialize_permission)) { echo "checked"; }  
                        }
                         ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateGroup" <?php 
                        if($serialize_permission) {
                          if(in_array('updateGroup', $serialize_permission)) { echo "checked"; }  
                        }
                         ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewGroup" <?php 
                        if($serialize_permission) {
                          if(in_array('viewGroup', $serialize_permission)) { echo "checked"; }  
                        }
                         ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteGroup" <?php 
                        if($serialize_permission) {
                          if(in_array('deleteGroup', $serialize_permission)) { echo "checked"; }  
                        }
                         ?>></td>
                      </tr>
                      <tr>
                        <td>Patient</td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createPatient" <?php if($serialize_permission) {
                          if(in_array('createPatient', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updatePatient" <?php if($serialize_permission) {
                          if(in_array('updatePatient', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewPatient" <?php if($serialize_permission) {
                          if(in_array('viewPatient', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deletePatient" <?php if($serialize_permission) {
                          if(in_array('deletePatient', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                      </tr>
                      <tr>
                        <td>Pharmacy</td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createPharmacy" <?php if($serialize_permission) {
                          if(in_array('createPharmacy', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updatePharmacy" <?php if($serialize_permission) {
                          if(in_array('updatePharmacy', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewPharmacy" <?php if($serialize_permission) {
                          if(in_array('viewPharmacy', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deletePharmacy" <?php if($serialize_permission) {
                          if(in_array('deletePharmacy', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                      </tr>
                      <tr>
                        <td>Laboratory Investigation</td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createLab" <?php if($serialize_permission) {
                          if(in_array('createLab', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateLab" <?php if($serialize_permission) {
                          if(in_array('updateLab', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewLab" <?php if($serialize_permission) {
                          if(in_array('viewLab', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteLab" <?php if($serialize_permission) {
                          if(in_array('deleteLab', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                      </tr>
                      <tr>
                        <td>Radiological Investigation</td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createRadio" <?php if($serialize_permission) {
                          if(in_array('createRadio', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateRadio" <?php if($serialize_permission) {
                          if(in_array('updateRadio', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewRadio" <?php if($serialize_permission) {
                          if(in_array('viewRadio', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteRadio" <?php if($serialize_permission) {
                          if(in_array('deleteRadio', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                      </tr>
                      <tr>
                        <td>Products</td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createProduct" <?php if($serialize_permission) {
                          if(in_array('createProduct', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateProduct" <?php if($serialize_permission) {
                          if(in_array('updateProduct', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewProduct" <?php if($serialize_permission) {
                          if(in_array('viewProduct', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteProduct" <?php if($serialize_permission) {
                          if(in_array('deleteProduct', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                      </tr>
                      <tr>
                        <td>Orders</td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createOrder" <?php if($serialize_permission) {
                          if(in_array('createOrder', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateOrder" <?php if($serialize_permission) {
                          if(in_array('updateOrder', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewOrder" <?php if($serialize_permission) {
                          if(in_array('viewOrder', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteOrder" <?php if($serialize_permission) {
                          if(in_array('deleteOrder', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                      </tr>
                      <tr>
                        <td>Reports</td>
                        <td> - </td>
                        <td> - </td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewReports" <?php if($serialize_permission) {
                          if(in_array('viewReports', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td> - </td>
                      </tr>
                      <tr>
                        <td>Company</td>
                        <td> - </td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateCompany" <?php if($serialize_permission) {
                          if(in_array('updateCompany', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td> - </td>
                        <td> - </td>
                      </tr>
                      <tr>
                        <td>Profile</td>
                        <td> - </td>
                        <td> - </td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewProfile" <?php if($serialize_permission) {
                          if(in_array('viewProfile', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td> - </td>
                      </tr>
                      <tr>
                        <td>Setting</td>
                        <td>-</td>
                        <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateSetting" <?php if($serialize_permission) {
                          if(in_array('updateSetting', $serialize_permission)) { echo "checked"; } 
                        } ?>></td>
                        <td> - </td>
                        <td> - </td>
                      </tr>
                    </tbody>
                  </table>
                  
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Update Changes</button>
                <a href="<?php echo base_url('groups/') ?>" class="btn btn-warning">Back</a>
              </div>
            </form>
          </div>
          <!-- /.box -->
        </div>
        <!-- col-md-12 -->
      </div>
      <!-- /.row -->
      

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<script type="text/javascript">
  $(document).ready(function() {
    $("#mainGroupNav").addClass('active');
    $("#manageGroupNav").addClass('active');

    $('input[type="checkbox"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass   : 'iradio_minimal-blue'
    });
  });
</script>
