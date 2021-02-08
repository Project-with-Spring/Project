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
					<a href="javascript:add_new();" class="btn btn-success btn-sm">
					<i class="fa fa-plus"></i> Add New ( 상품 / 재고 ) </a>
				</div>
			</div>
			<div class="box-body">

				<div id="add_new" class="col-sm-12 col-md-12 col-lg-12" style="display: none;">
				<form method="POST" class="form-horizontal" name="frm_new" id="frm_new">
						<h2>Product / Stock Insert</h2>
						<br>
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

						<div class="form-group">
							<label class="col-md-2 control-label">Category:</label>
							<div class="col-md-4">
								<select name="category" id="category" class="form-control">

						<!-- 상품(1) 선택시 커피, 음료, 디저트, 기타
							 재고(2) 선택시 커피원두, 냉장/냉동, 차, 시럽/소스, 기타 -->

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
					<hr><hr>
<!-- 					view에만 입력하는 것 구현해놨습니당, 입력 코드랑 DB 수정해야 함 -->
					<div id="stc_in_pdt">
						<label class="col-md-2 control-label">Stock Name:</label>
						<div class="col-md-4">
							<select class="form-control" name="stc_pdt" id="stc_pdt">
								<option value="0">재료를 선택하세요</option>

								<c:set var="num" value="1"/>
								<c:forEach items="${stcList }" var="stc">
									<option value="${num }">${stc.stc_name }</option>
									<c:set var="num" value="${num+1 }"/>
								</c:forEach>
							</select>
						</div>
						
						<label class="col-md-2 control-label">Stock Usage:</label>
						<div class="col-md-4">
							<input type="text" name="stc_usage" id="stc_usage" class="form-control required" required>
							<input type="button" id="btn-stc-pdt" value="추가" class="form-control btn btn-success btn-sm btn-submit">
						</div>
						
						<div id="stc_input">
							
						</div>
					</div>
					<hr><hr>
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
				
				<div id="tabs">
					<ul>
						<li><a href="#tabs-1">Product List</a></li>
						<li><a href="#tabs-2">Stock List</a></li>
					</ul>
				
					<div id="tabs-1"> <!-- 상품 리스트 탭 -->
					
					<table class="table table-striped table-responsive tbl_narrow">
						<thead>
						<tr>
							<th>Product No.</th>
							<th>Category Name</th>
							<th>Name</th>
							<th>Status</th>
							<th>Detail</th>
						</tr>
						</thead>
						<tbody id="pdt-tbody">
						
						<!-- 테이블에 들어갈 행 추가 -->

						<c:forEach items="${pdtList }" var="pdt">
						
						<c:forEach items="${ctgList }" var="ctg">
						
						<!-- 카테고리타입에 따른 상품/재고 이름 출력 -->
							<c:if test="${ctg.ctg_id eq pdt.ctg_id }">
							<tr>
								<td>${pdt.pdt_id}</td>
								<td>${ctg.ctg_name}</td>
								<td>${pdt.pdt_name}</td>
								<td>${pdt.pdt_status}</td>
								<td><a href="<c:url value='/pdt/list/${pdt.pdt_id }' />">상세페이지</a></td>
							</tr>
							</c:if>
						
						</c:forEach> <!-- ctgList 반복 닫음 -->

						</c:forEach> <!-- pdtList 반복 닫음 -->

						</tbody>
					</table>
					
					<div style="display: block; text-align: center;">		
						<c:if test="${pdtPage.startPage != 1 }">
							<a href="<c:url value='/ctg/list?nowPage=${pdtPage.startPage - 1 }' />">&lt;</a>
						</c:if>
						<c:forEach begin="${pdtPage.startPage }" end="${pdtPage.endPage }" var="p">
							<c:choose>
								<c:when test="${p == pdtPage.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != pdtPage.nowPage }">
									<a href="<c:url value='/ctg/list?nowPage=${p }' />">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${pdtPage.endPage != pdtPage.lastPage}">
							<a href="<c:url value='/ctg/list?nowPage=${pdtPage.endPage+1 }' />">&gt;</a>
						</c:if>
					</div>
	
					</div>
					
					<div id="tabs-2"> <!-- 재고 리스트 탭 -->
					
					<table class="table table-striped table-responsive tbl_narrow">
						<thead>
						<tr>
							<th>Stock No.</th>
							<th>Category Name</th>
							<th>Name</th>
							<th>Detail</th>
						</tr>
						</thead>
						<tbody>

						<!-- 테이블에 들어갈 행 추가 -->
						<c:forEach items="${stcList }" var="stc">
						
						<c:forEach items="${ctgList }" var="ctg">
							<c:if test="${ctg.ctg_id eq stc.ctg_id }">
							<tr>
								<td>${stc.stc_id}</td> 
								<td>${ctg.ctg_name}</td>
								<td>${stc.stc_name}</td>
								<td><a href="<c:url value='/stc/list/${stc.stc_id }' />">상세페이지</a></td>
							</tr>
							
							
							</c:if>						
						</c:forEach> <!-- ctgList 반복 닫음 -->
						
						</c:forEach> <!-- stcList 반복 닫음 -->
						
						
						</tbody>
					</table>
					
					
					
					<div style="display: block; text-align: center;">		
						<c:if test="${stcPage.startPage != 1 }">
							<a href="<c:url value='/ctg/list?nowPage=${stcPage.startPage - 1 }' />">&lt;</a>
						</c:if>
						<c:forEach begin="${stcPage.startPage }" end="${stcPage.endPage }" var="p">
							<c:choose>
								<c:when test="${p == stcPage.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != stcPage.nowPage }">
									<a href="<c:url value='/ctg/list?nowPage=${p }' />">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${stcPage.endPage != stcPage.lastPage}">
							<a href="<c:url value='/ctg/list?nowPage=${paging.endPage+1 }' />">&gt;</a>
						</c:if>
					</div>
	
					
					
					</div>
					
				</div>
				</div>
			</div>

		</div>
</div>
<!-- /.box -->

</section>
<!-- /.content -->
</div>

<%@ include file="../include/footer.jsp"%>


<script src="<c:url value="/resources/js/sub2.js"/>"></script>

	
<!-- 	categoryList.jsp 탭 뷰 script -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="<c:url value="/resources/js/app.min.js" />"></script>
<!-- 	categoryList.jsp 탭 뷰 script 끝 -->


<script>

$('#ctg_type').on('click', function() {
	// json형태로 controller에서 받아온 list를 js에서 활용
	var ctgList = (${ctgListByJson});
	// select 안에 달릴 option 내용
	var option = "<option value='" + 0 + "'>카테고리 이름 선택하기 (카테고리 타입)</option>";
		

	if($('#ctg_type').val() == 1) {
		$('#pdt_insert').css('display', 'block');
		$('#stc_insert').css('display', 'none');
		
		// 입력된 내용, 카테고리 select 초기화
		$('#category').empty();
		$('#category').append(option);
		$('input:text[name=pdt_name]').prop('value', '');
		$('input:text[name=pdt_cost]').prop('value', '');
		
		for(var i=0; i<ctgList.length; i++) {
			var ctg = ctgList[i];

			if(ctg.ctg_type == 1) {
				option = "<option value='" + ctg.ctg_id + "'>" + 
					ctg.ctg_name + "(" + ctg.ctg_type + ", 상품)</option>";
				$('#category').append(option);
			}
		}
		
	} else if($('#ctg_type').val() == 2) {
		$('#pdt_insert').css('display', 'none');
		$('#stc_insert').css('display', 'block');

		// 입력된 내용, 카테고리 select 초기화
		$('#category').empty();
		$('#category').append(option);
		$('input:text[name=stc_name]').prop('value', '');
		$('input:text[name=stc_cost]').prop('value', '');
		$('input:text[name=stc_count]').prop('value', '');

		for(var i=0; i<ctgList.length; i++) {
			var ctg = ctgList[i];
			
			if(ctg.ctg_type == 2) {
				option = "<option value='" + ctg.ctg_id + "'>" + 
					ctg.ctg_name + "(" + ctg.ctg_type + ", 재고)</option>";
				$('#category').append(option);
			}
			
		}
	} else {
		$('#pdt_insert').css('display', 'none');
		$('#stc_insert').css('display', 'none');
	}
});




//한 상품에 대한 재고 사용량 입력
//$('#btn-stc-pdt').on('click', function() {
//	var stc = "재료명";
//	var usage = "사용량";
//	var html = "선택된 재료명&사용량 입력할 tag 저장 변수";
//
//	if($('#stc_pdt').val() == 0) {
//		alert('재료를 선택하세요');
//		return ;
//	} else if($('#stc_usage').val() == "") {
//		alert('사용량을 입력하세요');
//		return ;
//	} else {
//		stc = $('#stc_pdt option:selected').text();
//		usage = $('#stc_usage').val();
//
//		html = "<input type='text' value='" + stc + "' name='stc_pdt' readonly> " +
//			"<input type='text' value='" + usage + "' name='stc_usage' readonly> " + 
//			"<input type='button' value='선택 옵션 삭제' name='stc_pdt_del' class='form-control btn btn-danger btn-sm' > <br>";
//		
//		$('#stc_input').html(html);
//
//		$('#stc_pdt').prop('value', 0);
//		$('#stc_usage').prop('value', '');
//	}
//});
//
//function stc_del() {
////	구현하다맘..
//}


//form action 변경
var action = "";

$('#sub_mit').on('click', function() {
	// ctg_id 를 hidden으로 form안에 넣어서 보낼게용
	var ctg_id = $('#category option:selected').val();
	var html = "<input type='hidden' name='ctg_id' value='" + ctg_id + "' >";
	$('#frm_new').append(html);
	
	if($('#ctg_type').val() == 1) {
		action = "/go/pdt/add";
	} else if($('#ctg_type').val() == 2) {
		action = "/go/stc/add";
	}

	// action 값 변경
	$('#frm_new').attr('action', action);

	// form submit
	$('#frm_new').submit();
});


//탭 화면 전환
$(function() {
	$('#tabs').tabs();
});


</script>

</body>
</html>