<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>

<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Categories List</h1>
		<ol class="breadcrumb">
			<li><a href="<c:url value='/main' />"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Categories List</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">

		<!-- Default box -->
		<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title"></h3>
				<div class="box-tools pull-right">
					<!-- <a href="javascript:print_opt();" class="btn btn-success btn-sm">Print</a>  -->
					<a href="javascript:add_new();" class="btn btn-success btn-sm">
					<i class="fa fa-plus"></i> Add New ( 상품 / 재고 ) </a>
				</div>
				<!-- <script>
		function print_opt()
		{
			var txt_search = $('#txt_search').val();
			var branch_id = $('#branch_id').val();
			var URL = 'print_item_categories.php?txt_search='+txt_search+'&branch_id='+branch_id;
			print_sub(URL,800,600);
		}
		</script> -->
			</div>
			<div class="box-body">

				<div id="add_new" class="col-sm-12 col-md-12 col-lg-12" style="display: none;">
					<form method="POST" class="form-horizontal" name="frm_new" id="frm_new">
						<h2>Product / Stock Insert</h2>
						<br>
						<!-- <input type="hidden" name="csrf_token" id="csrf_token" value="297C9751E106E0F24E1B53A0E" /> -->
						<!-- <input type="hidden" name="csrf_url" id="csrf_url" value="/active/products/categories.php?" /> -->
						<!-- <input type="hidden" name="frm_action" id="frm_action" value="NEW" /> -->
						<div class="form-group">
							<label class="col-md-2 control-label">Category Type: </label>
							<div class="col-md-4">
								<select name="ctg_type" id="ctg_type" class="form-control">
									<option value="0">카테고리 타입을 선택하세요 </option>
									<option value="1">상품</option>
									<option value="2">재고 </option>
								</select>
							</div>
						</div>
						<!-- <script>
			  function chk_group_code()
			  {
			  		var parent = $('#parent').val();
					$.ajax({
						url: "get_item_code.php?frm_action=GROUP",
						type: "POST",
						data: { parent: parent },
						success: function(data) {
							$('#cat_code').val(data);
						}
					});
			  }
			</script> -->
				<script>
						
				$('#ctg_type').on('click', function() {
					var type = $('#ctg_type').val();
					var html = '';
					if(type == 1) {
						$('#pdt_insert').css('display', 'block');
						$('#stc_insert').css('display', 'none');
						
						// 입력된 내용 초기화
						$('input:text[name=pdt_name]').prop('value', '');
						$('input:text[name=pdt_cost]').prop('value', '');


						// 아래 category에 들어갈 내용 넣어주기
						<c:forEach var="ctg" items="${ctgList}">
// 							<c:choose>
								<c:when test="${ctg.ctg_type eq " + type + " }">
									html = '<option value=' + "${ctg.ctg_id}" + '>' + "${ctg.ctg_name}" + '</option>';
								</c:when>
// 							</c:choose>
							$('#category').html(html);
						</c:forEach>
						
						
					} else if(type == 2) {
						$('#pdt_insert').css('display', 'none');
						$('#stc_insert').css('display', 'block');
						
						// 입력된 내용 초기화
						$('input:text[name=stc_name]').prop('value', '');
						$('input:text[name=stc_cost]').prop('value', '');
						$('input:text[name=stc_count]').prop('value', '');
					} else {
						$('#pdt_insert').css('display', 'none');
						$('#stc_insert').css('display', 'none');
					}
				});
				</script>

						<!-- 상품(1) 선택시 커피, 음료, 디저트, 기타
			재고(2) 선택시 커피원두, 냉장/냉동, 차, 시럽/소스, 기타 -->

						<div class="form-group">
							<label class="col-md-2 control-label">Category:</label>
							<div class="col-md-4">
								<select name="category" id="category" class="form-control">
									<option value="0">카테고리를 선택하세요</option>
									
								</select>
							</div>
						</div>
						
				</div>

				<!-- 상품 입력 -->
				<div class="form-group" id="pdt_insert" style="display: none;">
					<label class="col-md-2 control-label">Product Name:</label>
					<div class="col-md-4">
						<input type="text" name="pdt_name" id="pdt_name"
							class="form-control required" required>
					</div>
					<label class="col-md-2 control-label">Product Cost:</label>
					<div class="col-md-4">
						<input type="text" name="pdt_cost" id="pdt_cost"
							class="form-control required" required>
					</div>
				</div>
				
				<!-- 재고 입력 -->
				<div class="form-group" id="stc_insert" style="display: none;">
					<label class="col-md-2 control-label">Stock Name:</label>
					<div class="col-md-4">
						<input type="text" name="stc_name" id="stc_name"
							class="form-control required" required>
					</div>
					<label class="col-md-2 control-label">Stock Cost:</label>
					<div class="col-md-4">
						<input type="text" name="stc_cost" id="stc_cost"
							class="form-control required" required>
					</div>
					<label class="col-md-2 control-label">Stock Count:</label>
					<div class="col-md-4">
						<input type="text" name="stc_count" id="stc_count"
							class="form-control required" required>
					</div>
				</div>

				<!-- add new, cancel 그룹 -->
				<div id="add-new-btn" style="display: none;">
					<label for="expiry_date" class="col-sm-2 control-label"></label>
					<div class="col-xs-6 col-sm-2">
						<input type="button" class="form-control btn btn-success btn-sm btn-submit"
							id="sub_mit" value="ADD NEW">
					</div>
					<div class="col-xs-6 col-sm-2">
						<input type="button" class="form-control btn btn-danger btn-sm"
							id="sub_mit" value="CANCEL" onclick="javascript:cancel_new();">
					</div>
				</div>
				<p class="alert alert-danger" id="err_msg" style="display: none;"></p>
				</form>
				
			<script>
			// form action 변경
			$('#add-new-btn').on('click', function() {
				var action_url = '';

				// 카테고리 타입에 따라 form action 경로 다르게 설정
				if($('#ctg_type').val() == 1) {
					action_url = '/ctg/add-pdt';
				} else if($('#ctg_type').val() == 2) {
					action_url = '/ctg/add-stc';
				}

				// form action 경로 변경
				$('#frm_new').attr('action', '<c:url value="' + action_url + '" />');
				// form submit
				$('#frm_new').submit();
			});
			</script>
			
			</div>

			<div id="my_all">
				<form name="frm_filter" id="frm_filter" method="get"
					action="/active/products/categories.php" class="form-horizontal">
					<div class="form-group">
						<div class="col-md-4">
							<input type="text" name="txt_search" id="txt_search" value=""
								class="form-control" placeholder="Search any Item">
						</div>
						<div class="col-md-2">
							<select name="branch_id" id="branch_id" class="form-control">
								<option value="94" selected>enter :</option>
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
							<th>Categoty ID</th>
							<th>Category Type</th>
							<th>Category Name</th>
							<th>Name</th>
							<th>Detail</th>
						</tr>
						</thead>
						
						<c:forEach items="${ctgList }" var="ctg">
						<c:forEach items="${pdtList }" var="pdt">
						<c:forEach items="${stcList }" var="stc">
						
						
						<tr onclick="href='${table_url }'">
							<td>${ctg.ctg_id }</td>
							<td>${ctg.ctg_type }</td>
							<td>${ctg.ctg_name }</td>
							
							<c:choose>
								<c:when test="${ctg.ctg_id == pdt.ctg_id}">
									<td>${pdt.pdt_name }</td>
								</c:when>
								<c:when test="${ctg.ctg_id == stc.ctg_id}">
									<td>${stc.stc_name }</td>
								</c:when>
							</c:choose>
							
							
							<!-- 카테고리타입에 따른 상세페이지 이동링크 변경 -->
							<c:choose>
								<c:when test="${ctg.ctg_type == 1}">
									<td><a href="<c:url value='/pdt/list/${pdt.pdt_id }'/>">상세페이지</a></td>
								</c:when>
								<c:otherwise>
									<td><a href="<c:url value='/stc/list/${stc.stc_id }'/>">상세페이지로 이동</a></td>
								</c:otherwise>
							</c:choose>
							
						</tr>
					
						</c:forEach> <!-- ctgList 반복 닫음 -->
						</c:forEach> <!-- pdtList 반복 닫음 -->
						</c:forEach> <!-- stcList 반복 닫음 -->
<!-- 						<tr> -->
<!-- 							<td>1</td> -->
<!-- 							<td>02</td> -->
<!-- 							<td>재고</td> -->
<!-- 							<td>원두</td> -->
<!-- 						</tr> -->
						<tr>
							<td colspan="5">

								<div style="float: left; margin-right: 10px;">
									<ul class="pagination" style="padding: 0px; margin: 0px;">
										<li><a href="javascript:void(0);" title="First Page">
											<span class="glyphicon glyphicon-fast-backward"></span></a></li>
										<li><a href="javascript:void(0);" title="Previous Page">
											<span class="glyphicon glyphicon-backward"></span></a></li>
										<li><a href="javascript:void(0);">Page: 1 of 1</a></li>
										<li><a href="javascript:void(0);" title="Next Page">
											<span class="glyphicon glyphicon-forward"></span></a></li>
										<li><a href="javascript:void(0);" title="Last Page">
											<span class="glyphicon glyphicon-fast-forward"></span></a></li>
									</ul>
								</div>
							</td>
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