<?php
//if(@$complaints){
  //foreach ($complaints as $complaint) {
    echo "<div id='complaint".$complaint->id."' class='well well-md'>";
      echo "<div class='complaintBody'>".$complaint->complaint.'</div>';
      echo "<div class='pull-right'>Create Date: ".$complaint->created_date."</div>";
    echo "</div>";
  //}
//}
?>