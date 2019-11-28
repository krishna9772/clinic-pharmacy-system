 <style type="text/css">

a {
  cursor: pointer;
}

#editor {
  box-shadow: 0 0 2px #CCC;
  min-height: 150px;
  overflow: auto;
  padding: 1em;
  margin-top: 20px;
  resize: vertical;
  outline: none;
  background: #fff;
}

.toolbar {
  text-align: center;
}

.toolbar a,
.fore-wrapper,
.back-wrapper {
  border: 1px solid #AAA;
  background: #FFF;
  font-family: 'Candal';
  border-radius: 1px;
  color: black;
  padding: 2px;
  width: 1.5em;
  margin: 1px;
  margin-top: 10px;
  display: inline-block;
  text-decoration: none;
  box-shadow: 0px 1px 0px #CCC;
}

.toolbar a:hover,
.fore-wrapper:hover,
.back-wrapper:hover {
  background: #f2f2f2;
  border-color: #8c8c8c;
}

a[data-command='redo'],
a[data-command='strikeThrough'],
a[data-command='justifyFull'],
a[data-command='insertOrderedList'],
a[data-command='outdent'],
a[data-command='p'],
a[data-command='superscript'] {
  margin-right: 5px;
  border-radius: 0 3px 3px 0;
}

a[data-command='undo'],
.fore-wrapper,
a[data-command='justifyLeft'],
a[data-command='insertUnorderedList'],
a[data-command='indent'],
a[data-command='h1'],
a[data-command='subscript'] {
  border-radius: 3px 0 0 3px;
}

a.palette-item {
  height: 1em;
  border-radius: 3px;
  margin: 2px;
  width: 1em;
  border: 1px solid #CCC;
}

a.palette-item:hover {
  border: 1px solid #CCC;
  box-shadow: 0 0 3px #333;
}

.fore-palette,
.back-palette {
  display: none;
}

.fore-wrapper,
.back-wrapper {
  display: inline-block;
  cursor: pointer;
}

.fore-wrapper:hover .fore-palette,
.back-wrapper:hover .back-palette {
  display: block;
  float: left;
  position: absolute;
  padding: 3px;
  width: 160px;
  background: #FFF;
  border: 1px solid #DDD;
  box-shadow: 0 0 5px #CCC;
  height: 70px;
}

.fore-palette a,
.back-palette a {
  background: #FFF;
  margin-bottom: 2px;
}

a[aria-expanded=true] .fa-plus {
   display: none;
}
a[aria-expanded=false] .fa-minus {
   display: none;
}
</style>
<div class="tab-pane" id="complaint" style="padding-top: 10px;">

   <script>
    $(document).ready(function(){
      //script of this section
      $('#savecomplaint').click(function(){

          $.post($('#commentBox').attr('action'),$('#commentBox').serialize(),
            function(data){
              $('#commentGroup').prepend(data);
              $('#comment').val('');
            });
          return false;
        
      });

      $("#commentGroup span > i >  a").on('click',complaintAction);
         
      function complaintAction(e)
      {
        e.preventDefault();
        var csrfVal=$('form input[name="csrf_test_name"]').val();
        var cid    =$(this).attr('cid');
        var pi     =$(this).attr('pi');
        if($(this).attr('action')=='delete'){
      
            $.post('<?php echo site_url("complaints/delete")."/";?>'+cid,'csrf_test_name='+csrfVal+'&complaint_id='+cid+'&patient_id='+pi,function(data){
            if(data=='ok'){
              $('#comment'+cid).fadeOut();
            }else if(data=='mismatch'){
              alert('Delete data mismatch');
            }else if(data=='invalid'){
              alert('Invalid data');
            }
          });
        }
      }
    });
  </script>

  <div>
  <a data-toggle="collapse" href="#collapseExample" 
      aria-expanded="false" aria-controls="collapseExample" id="collapse">
       
        <i class="fa fa-plus btn btn-primary"></i>
        <i class="fa fa-minus btn btn-primary"></i>
    </a>
  </div><br>

	<?php if($patient_data['id'] == TRUE){

    echo "<div class='collapse' id='collapseExample'>";

       
      echo form_open('complaints/create/'.$patient_data['id'],array('id'=>'commentBox'));
	    echo form_hidden('patient_id',$patient_data['id']);
      echo form_textarea('complaint','','class="form-control" id="editor" placeholder="Write your complaint about this patient..." required')."<br>";
      echo form_submit('Save','Save','class="btn btn-primary ml-3" id="savecomplaint"');
      echo form_close();
      echo "<p></p>"; 

      echo "</div>";


  }

  echo "<div id='commentGroup'>";
  foreach($complaint as $com) {

      echo "<div id='comment".$com->id."' class='well well-md'>"; 
          echo "<div class='commentBody'>
          <span class='badge badge-warning pull-right'><i class='fa fa-trash'>
           ".anchor('#', 'Del ',array('cid'=>$com->id,'pi'=>$com->patient_id,'action'=>'delete'))."</i></span>"
          .$com->complaint.'</div>';
          echo "<div class='pull-right'>Create Date: ".$com->created_date."</div>";//<span class='close'>&times;</span>
        echo "</div>";
  }
   echo "</div>";
		?>

</div>


<script type="text/javascript">

// $.ajax({
//   url: '<?php echo base_url()?>complaints/getComplaintHint',
//   async: false 
// }).then(function(data) {
//   window.emojis = JSON.parse(data);

// });;



$("#editor").summernote({
  height: 150,
  placeholder: '',
  hint: { 
    words: ['fever', 'chills' ,'cough', 'toc' ,'doy', 'sneezing', 'nausea','vomitting','times','1','2','3','4','5','6','7','loss of appetite','allergic to'],
    match: /\b(\w{1,})$/,
    search: function (keyword, callback) {
      callback($.grep(this.words, function (item) {
        return item.indexOf(keyword)  === 0;
      }));
    },
  }
});

$("#editor").summernote('insertUnorderedList');

$(".fa fa-minus").click(function(){

})

// $(".fa-plus").click(function(){

//   $("#collapseicon").addClass('fa-user-o').removeClass('fa-plus');
   
// });

$('#collapseExample').on('.in',function() {


  alert("Hello world");


});


$(document).ready(function(){

if($("#commentGroup").is(':empty')){
  
   $('#collapse').trigger('click');

}


});

</script>
