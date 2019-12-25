<style type="text/css">

  .visiting-reports{

    padding: 5px;

  }
  
</style>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
      <!-- Content Header (Page header) -->

      <!-- Main content -->
      <section class="content">
        <!-- Small boxes (Stat box) -->
        

          <div class="row">
         
            <!-- ./col -->
            <div class="col-lg-8">
          
           <ul class="visiting-reports nav nav-tabs" id="panelTab">
           <li><a href="#todayvisit" data-toggle="tab">
                  Today <span class="badge badge-light"><?php echo $tvisitqty;?></span>
            </a></li>
            <li><a href="#weeklyvisit" data-toggle="tab">
                  Daily
            </a></li>
           </ul><br>
          
          <div class="tab-content">

            <div class="tab-pane" id="todayvisit">

              <table id="manageTable" class="table table-bordered table-striped">

                <thead>

                  <th>Name</th>
                  <th>Visiting Time</th>

                </thead>
                   <?php foreach($tvisits as $tvisit):?>
                <tr>
                  
                  <td><?php echo $tvisit['name']?></td>
                  <?php $time = strtotime($tvisit['date_time']);?>
                  <td><?php echo date('h : i : s',$time)?></td>
                </tr>

              <?php endforeach;?>

             </tr> 

            </table>

           </div>

           <div class="tab-pane" id="weeklyvisit">

           </div>
          </div>

              <!-- small box -->
              <!-- remove brand modal -->
            </div>
            <!-- ./col -->
          
            <!-- ./col -->
           
            <!-- ./col -->
          </div>
          <!-- /.row -->
        
      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <script type="text/javascript">
      $(document).ready(function() {
        $("#dashboardMainMenu").addClass('active');
        $('#panelTab a:first').tab('show');

        $("#manageTable").DataTable({

            "lengthMenu": [[10], [10]],
            "bInfo" : false,
            "dom": 'ftipr'

      }); 

      });
    </script>
