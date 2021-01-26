<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>Stock List</h1>
      <ol class="breadcrumb">
        <li><a href="<c:url value='/main' />"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Stock List</li>
      </ol>
    </section>
	    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
	  	<div class="box-header with-border">
          <h3 class="box-title"></h3>
          <div class="box-tools pull-right">
		  <a href="categories.php" class="btn btn-success btn-sm">Categories</a>		  <a href="javascript:print_opt();" class="btn btn-success btn-sm">Print</a>
		  <a href="import_items.php" class="btn btn-success btn-sm" data-target="#my-ajax-modal" data-toggle="modal">Import Items</a>
		  <a href="items_price.php" class="btn btn-success btn-sm">Price List</a>		   <a href="new_item.php" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Add New</a></div>
		<script>
		function print_opt()
		{
			var pstatus = $('#pstatus').val();
			var txt_search = $('#txt_search').val();
			var branch_id = $('#branch_id').val();
			var cat_id = $('#cat_id').val();
			var URL = 'print_items.php?pstatus='+pstatus+'&txt_search='+txt_search+'&branch_id='+branch_id+'&cat_id='+cat_id;
			print_sub(URL,800,600);
		}
		</script>
        </div>
        <div class="box-body">
  	    <div id="my_all">
		<form name="frm_filter" id="frm_filter" method="get" action="/active/products/items.php" class="form-horizontal">
          <div class="form-group">
              <div class="col-md-3"><input type="text" name="txt_search" id="txt_search" value="" class="form-control" placeholder="Search any Item"></div>
              <div class="col-md-3"><select name="cat_id" id="cat_id" class="form-control select2">
				<option value="">~ Item Category ~</option>
								<option value="264">enter01 : coffee</option>
								</select></div>
			  			  <div class="col-md-3">
				<select name="branch_id" id="branch_id" class="form-control">
										<option value="94" selected>enter : </option>
									</select>
			  </div>
			  			  <div class="col-md-2">
				<select name="pstatus" id="pstatus" class="form-control">
					<option value="">~ Status ~</option>
					<option value="Draft">Draft</option>
					<option value="Approved">Approved</option>
				</select>
			  </div>
			  <div class="col-md-1">
              	<button name="btn_filter" class="btn btn-primary form-control">Filter</button>
              </div>
          </div>	
        </form>
		
        <div class="table-responsive no-padding">
          <table class="table table-striped table-responsive tbl_narrow">
            <thead>
                <tr>
                    <th>Sr#</th>
                    <th>Code</th>
					<th>Item Name</th>
					<th>Unit</th>
					<th>Barcode</th>
					<th>Variation</th>
					<th>Stock</th>
					<th>Cost Price</th>
					<th>Sale Price</th>
                    <th>Status</th>
                    <th></th>
                </tr>
  				</thead>
				                <tr>
                  <td>1</td>
                  <td><a href="view_item.php?mid=3642">coffee01</a></td>
                  <td>Americano</td>
				  <td>Botle</td>
				  <td>01010101</td>
				  <td></td>
				  <td><span>0</td>
				  <td>5,500.00</td>
				  <td>0.00</td>
                  <td>Draft</td>
                  <td class="text-right"><a href="item_process.php?frm_action=APP&mid=3642&csrf_token=7755A32B1343BBE804D9E23B0" class="btn btn-success btn-xs" title="Approve Now"><span class="glyphicon glyphicon-ok"></span></a> <a href="edit_item.php?mid=3642" class="btn btn-default btn-xs" title="Update Detail"><span class="glyphicon glyphicon-pencil"></span></a> <a href="item_process.php?frm_action=DEL&mid=3642&csrf_token=8E52E31FD9CF1E7796C20B053" class="btn btn-warning btn-xs" onclick="javascript:return confirm('Do you want to Remove?');" title="Remove Record"><span class="glyphicon glyphicon-remove"></span></a></td>
                </tr>
								<tr>
					<td colspan="12">
			<div style="float:left;margin-right:10px;">
			<ul class="pagination" style="padding:0px;margin:0px;">
			<li><a href="javascript:void(0);" title="First Page"><span class="glyphicon glyphicon-fast-backward"></span></a></li>
			<li><a href="javascript:void(0);" title="Previous Page"><span class="glyphicon glyphicon-backward"></span></a></li><li><a href="javascript:void(0);">Page: 1 of 1</a></li><li><a href="javascript:void(0);" title="Next Page"><span class="glyphicon glyphicon-forward"></span></a></li><li><a href="javascript:void(0);" title="Last Page"><span class="glyphicon glyphicon-fast-forward"></span></a></li>
			</ul>
			</div></td>
				</tr>
				              </table>
          </div>
          </div>
		  
        </div>
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
<div class="modal fade bs-modal-lg" id="my-ajax-modal" role="basic" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content"></div>
    </div>
</div>


<%@ include file="../include/footer.jsp"%>

<script>
$(function() {
	
	  $('.btn-submit').click(function(e){
	  		$(this).prop('disabled', true);
			var $formId = $(this).parents('form');
			var formAction = $formId.attr('action');
			var err = '';
			var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
			$('.required',$formId).each(function(){
				var inputVal = $(this).val();
				//var $parentTag = $(this).parent();
				if(inputVal == ''){
					$(this).addClass('error');
					err = 'error';
				}else{
					$(this).removeClass('error');
				}
				if($(this).hasClass('email') == true){
					if(!emailReg.test(inputVal)){
						$(this).addClass('error');
						err = 'error';
					}
				}
			});
			if (err == '')
			{
				if ($('#csrf_token'))
				{
					var csrf_token = $('#csrf_token').val();
					var csrf_url = $('#csrf_url').val();
					$.ajax({
					  method: "POST",
					  url: formAction,
					  headers: {'X-CSRF-TOKEN': csrf_token},
					  data: $formId.serialize()
					})
					.done(function( msg ) {
						//alert( "Data Saved: " + msg );
						if (msg == "OK" || Number(msg) > 0)
						{
							//window.location.reload(true);
							window.location.href = csrf_url;
						}else{
							$('#err_msg').html(msg);
							$("#err_msg").show().delay(10000).fadeOut();
							$('.btn-submit').prop('disabled', false);
						}
					  });
				}else{
					//alert( "Token Not Exist");
					$('#err_msg').html("Token Not Exist");
					$("#err_msg").show().delay(10000).fadeOut();
					$('.btn-submit').prop('disabled', false);
				}
			}else{
				$('.btn-submit').prop('disabled', false);
			}
			e.preventDefault();
		});

	  $('.btn-update').click(function(e){
	  		$(this).prop('disabled', true);
			var $formId = $(this).parents('form');
			var formAction = $formId.attr('action');
			var err = '';
			var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
			$('.required',$formId).each(function(){
				var inputVal = $(this).val();
				//var $parentTag = $(this).parent();
				if(inputVal == ''){
					$(this).addClass('error');
					err = 'error';
				}else{
					$(this).removeClass('error');
				}
				if($(this).hasClass('email') == true){
					if(!emailReg.test(inputVal)){
						$(this).addClass('error');
						err = 'error';
					}
				}
			});
			if (err == '')
			{
				if ($('#csrf_token'))
				{
					var csrf_token = $('#csrf_token').val();
					var csrf_url = $('#csrf_url').val();

					$.ajax({
					  method: "POST",
					  url: formAction,
					  headers: {'X-CSRF-TOKEN': csrf_token},
					  data: $formId.serialize()
					})
					.done(function( msg ) {
						//alert( "Data Saved: " + msg );
						if (msg == "OK" || Number(msg) > 0)
						{
							window.location.href = csrf_url;
						}else{
							$('#err_msg').html(msg);
							$("#err_msg").show().delay(10000).fadeOut();
							$('.btn-update').prop('disabled', false);
						}
					  });
				}else{
					//alert( "Token Not Exist");
					$('#err_msg').html("Token Not Exist");
					$("#err_msg").show().delay(10000).fadeOut();
					$('.btn-update').prop('disabled', false);
				}
			}else{
				$('.btn-update').prop('disabled', false);
			}
			e.preventDefault();
		});
	  $('.btn-update-up').click(function(e){
	  		$(this).prop('disabled', true);
			var $formId = $(this).parents('form');
			var formAction = $formId.attr('action');
			var formData = new FormData($formId[0]);
			var err = '';
			var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
			$('.required',$formId).each(function(){
				var inputVal = $(this).val();
				//var $parentTag = $(this).parent();
				if(inputVal == ''){
					$(this).addClass('error');
					err = 'error';
				}else{
					$(this).removeClass('error');
				}
				if($(this).hasClass('email') == true){
					if(!emailReg.test(inputVal)){
						$(this).addClass('error');
						err = 'error';
					}
				}
			});
			if (err == '')
			{
				if ($('#csrf_token'))
				{
					var csrf_token = $('#csrf_token').val();
					var csrf_url = $('#csrf_url').val();

					$.ajax({
					  method: "POST",
					  url: formAction,
					  headers: {'X-CSRF-TOKEN': csrf_token},
					  //data: $formId.serialize()
					  data: formData,
					  async: false,
					  cache: false,
					  contentType: false,
					  processData: false
					})
					.done(function( msg ) {
						//alert( "Data Saved: " + msg );
						if (msg == "OK" || Number(msg) > 0)
						{
							window.location.href = csrf_url;
						}else{
							$('#err_msg').html(msg);
							$("#err_msg").show().delay(10000).fadeOut();
							$('.btn-update-up').prop('disabled', false);
						}
					  });
				}else{
					//alert( "Token Not Exist");
					$('#err_msg').html("Token Not Exist");
					$("#err_msg").show().delay(10000).fadeOut();
					$('.btn-update-up').prop('disabled', false);
				}
			}else{
				$('.btn-update-up').prop('disabled', false);
			}
			e.preventDefault();
		});
		$( "#from" ).datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "2013:2021"
		});
		$( "#to" ).datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "2013:2022"
		});
		$( "#dob" ).datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "1940:2021"
		});
		$( "#date_join" ).datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "1970:2021"
		});
		$( "#open_date" ).datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "2013:2021"
		});
		$( "#pdate" ).datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "2013:2022"
		});
		$( "#leave_from" ).datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "2013:2022"
		});
		$( "#leave_to" ).datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "2013:2022"
		});
		$( "#holiday_date" ).datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "2013:2022"
		});
		$( "#v_date" ).datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "2013:2022"
		});
		$(".datefld").datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "2013:2022"
		});
		$(".date_box").datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "2013:2022"
		});
		
	});
function print_sub(url,wid,hht)
{
	leftw = (window.screen.width / 2) - ((wid / 2) + 10);
	microsite_window=window.open(url,'microsite_window','toolbar=no,location=no,borders=no,directories=no,status=yes,menubar=no,scrollbars=yes,top=50,left='+leftw+',resizable=no,width='+wid+',height='+hht+'');
	microsite_window.focus();
}
$().ready(function() {
	$(".select2").select2();
	//$('.p_time').mask('00:00');
});
$('#my-ajax-modal').on('hide.bs.modal', function () {
	$('#my-ajax-modal').removeData('bs.modal');                
});
</script>
</body>
</html>