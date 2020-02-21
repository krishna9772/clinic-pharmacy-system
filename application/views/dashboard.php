<!-- Content Wrapper. Contains page content --> 
   <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <?php if($is_admin == false):  ?>

        <div class="row">
          <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-aqua">
              <div class="inner">
                <h2><?php echo $total_medicines;?></h2>

                <p>Total Medicines</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              <a href="<?php echo base_url('pharmacy/') ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-green">
              <div class="inner">
                <h2><?php echo $total_todaypatients?></h2>

                <p>Total Visits Today</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <a href="#" data-toggle = "modal" data-target="#showModal" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
            <?php if(in_array('viewPatient', $user_permission)): ?>
<!-- remove brand modal -->
        <div class="modal fade" tabindex="-1" role="dialog" id="showModal">
          <div class="modal-dialog" role="document">
           <div class="modal-content">
            <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Patient List</h4>
           </div>

          <form role="form" action="" method="post" id="viewForm">
           <div class="modal-body">
            <p><?php 

             foreach($patient as $pat){

              $time = strtotime($pat['date_time']);

              echo  "<mark style='background:#16a895'>".$pat['name']."</mark>  visited at  <mark color='yellow'>".date('h : i : s',$time)."</mark><hr>";
             }

               ?>
              
            </p>
            </div>
          <div class="modal-footer">
            <a href="<?php echo base_url()?>reports/totalVisits/<?php echo mdate('%Y-%m-%d');?>" class="btn btn-default">See All</a>
          </div>
       </form>

    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<?php endif; ?>
          </div>
          <!-- ./col -->
        
          <!-- ./col -->
         
          <!-- ./col -->
        </div>
        <!-- /.row -->
      <?php endif; ?>

      <div class = "well">
          <canvas id="chartContainer" style="width: 100%; height: 400px"></canvas> 
      </div>
      
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <script>
  $(function(){
      //get the pie chart canvas
      var cData = JSON.parse(`<?php echo $chart_data; ?>`);
      var ctx = $("#chartContainer");
 
      //pie chart data
      var data = {
        labels: cData.label,
        datasets: [
          {
            label: "Users Count",
            data: cData.data,
            backgroundColor: [
              "#DEB887",
              "#A9A9A9",
              "#DC143C",
              "#F4A460",
              "#2E8B57",
              "#1D7A46",
              "#CDA776",
            ],
            borderColor: [
              "#CDA776",
              "#989898",
              "#CB252B",
              "#E39371",
              "#1D7A46",
              "#F4A460",
              "#CDA776",
            ],
            borderWidth: [1, 1, 1, 1, 1,1,1]
          }
        ]
      };
 
      //options
      var options = {
        responsive: true,
        title: {
          display: true,
          position: "top",
          text: "Diagnosis Paitent Quantity",
          fontSize: 18,
          fontColor: "#111"
        },
        legend: {
          display: true,
          position: "bottom",
          labels: {
            fontColor: "#333",
            fontSize: 16
          }
        }
      };
 
      //create Pie Chart class object
      var chart1 = new Chart(ctx, {
        type: "pie",
        data: data,
        options: options
      });
 
  });
</script>
