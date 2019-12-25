 <div id="tmpDiv"></div>

  <footer class="main-footer">
    <a id="back-to-top" href="#" class="btn btn-danger btn-lg back-to-top" role="button"><i class="fa fa-chevron-up"></i></a>
    <div class="pull-right hidden-xs">
      <b>Version</b> 0.1.0
    </div>
    <strong>Copyright &copy; 2018-<?php echo date('Y') ?>.</strong> All rights reserved.
  </footer>

  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

</body>
</html>

<script type="text/javascript">
	$(document).ready(function(){

  $(window).scroll(function () {
      if ($(this).scrollTop() > 50) {
        $('#back-to-top').fadeIn();
      } else {
        $('#back-to-top').fadeOut();
      }
    });
    // scroll body to 0px on click
    $('#back-to-top').click(function () {
      $('body,html').animate({
        scrollTop: 0
      }, 400);
      return false;
});
	})
</script>
