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
					<a href="<c:url value='/pdt/list' />" class="btn btn-success btn-sm">Product List</a>
					<a href="<c:url value='/stc/list' />" class="btn btn-success btn-sm">Stock List</a> &nbsp;&nbsp;&nbsp;
					<a href="javascript:add_ctg_new();" id="addNewCtgBtn" class="btn btn-success btn-sm"> <i class="fa fa-plus"></i> Add New Category </a>
					<a href="javascript:add_new();" id="addNewBtn" class="btn btn-success btn-sm"> <i class="fa fa-plus"></i> Add New ( 상품 / 재고 ) </a>
				</div>
			</div>
			
			
			<div class="box-body">
			
				<div id="addNewCtg" class="col-sm-12 col-md-12 col-lg-12" style="display: none;">
				<form method="POST" class="form-horizontal" name="ctgNewForm" id="ctgNewForm" 
					action="<c:url value='/ctg/add'/>">
					<h2>Category Insert</h2>
					<br>
					<div class="form-group">
						<label class="col-md-2 control-label">Category Type: </label>
						<div class="col-md-4">
							<select name="ctg_type" id="new_ctg_type" class="form-control">
								<option value="0">카테고리 타입을 선택하세요 </option>
								<option value="1">상품</option>
								<option value="2">재고 </option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-2 control-label">Category:</label>
						<div class="col-md-4">
							<input type="text" name="ctg_name" id="new_ctg_name" placeholder="카테고리 이름을 입력하세요">
						</div>
					</div>

					<label for="expiry_date" class="col-sm-2 control-label"></label>
					<div class="col-xs-6 col-sm-2">
						<input type="button" class="form-control btn btn-success btn-sm btn-submit" id="addNewCtgSubmit" value="ADD NEW">
					</div>
					<div class="col-xs-6 col-sm-2">
						<input type="button" class="form-control btn btn-danger btn-sm" value="CANCEL" onclick="javascript:add_ctg_new()">
					</div>
				</form>
			</div>

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
						
				<!-- 상품 입력 -->
				<div class="form-group" id="pdt_insert" style="display: none;">
				<hr>
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
				<hr>
				</div>
				
				<!-- 재고 입력 -->
				<div class="form-group" id="stc_insert" style="display: none;">
				<hr>
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
				<hr>
				</div>
				
				<hr>

				<!-- add new, cancel 그룹 -->
				<div id="add-new-btn" style="display: none;">
					<label for="expiry_date" class="col-sm-2 control-label"></label>
					<div class="col-xs-6 col-sm-2">
						<input type="button" class="form-control btn btn-success btn-sm btn-submit"
							id="sub_mit" value="ADD NEW">
					</div>
					<div class="col-xs-6 col-sm-2">
						<input type="button" class="form-control btn btn-danger btn-sm"
							value="CANCEL" onclick="javascript:add_new();">
					</div>
				</div>
				</form>
			</div>
			
			
			<div id="my_all">
			<!-- 검색창 -->
				<form name="frmSearch" id="frmSearch" method="post"
					action="<c:url value='/ctg/list'/>" class="form-horizontal">
					<div class="form-group">
						<div class="col-md-2">
							
							<select name="searchType" id="searchType" class="form-control">
								<option value="ctg_name">Category Name</option>
								<option value="ctg_type">Category Type</option>
								<option value="pdt_name">Product Name</option>
								<option value="stc_name">Stock Name</option>
							</select>
						</div>
						<div class="col-md-4">
							<input type="text" name="searchText" id="searchText" class="form-control"
								placeholder="검색할 단어를 입력하세요">
						</div>
						<div class="col-md-1">
							<button name="btnSearch" class="btn btn-primary form-control">Search</button>
						</div>
					</div>
				</form>
			<!-- 검색창 -->
			
				<div class="table-responsive no-padding">
				
				<div id="tabs">
					<ul>
						<li><a href="#tabs-1">Category List</a></li>
						<li><a href="#tabs-2">Product List</a></li>
						<li><a href="#tabs-3">Stock List</a></li>
					</ul>
					
					<div id="tabs-1"> <!-- 카테고리 리스트 탭 -->
					
					<table class="table table-striped table-responsive tbl_narrow">
						<thead>
						<tr>
							<th>Category No.</th>
							<th>Category Name</th>
							<th>Category Type</th>
							<th>Update</th>
							<th>Delete</th>
						</tr>
						</thead>
						<tbody id="ctg-tbody">
						
						<!-- 테이블에 들어갈 행 추가 -->
						
						<c:forEach items="${ctgList }" var="ctg">
						
						<!-- 카테고리타입에 따른 상품/재고 이름 출력 -->
						<tr>
							<td>${ctg.ctg_id}</td>
							<td>${ctg.ctg_name}</td>
							<c:choose>
								<c:when test="${ctg.ctg_type eq 1 }">
									<td>상품</td>
								</c:when>
								<c:otherwise>
									<td>재고</td>
								</c:otherwise>
							</c:choose>
							<td>
								<input type="button" class="form-control btn btn-success btn-sm btn-submit" value="UPDATE" onclick="update($(this).parent())" >
							</td>
							<td>
								<input type="button" class="form-control btn btn-danger btn-sm" value="DELETE" onclick="del($(this).parent())" >
							</td>
						</tr>
						
						</c:forEach> <!-- ctgList 반복 닫음 -->

						</tbody>
					</table>
					
					<div style="display: block; text-align: center;">
					<ul class="pagination" style="padding: 0px; margin: 0px;">
						<c:if test="${ctgPage.startPage != 1 && ctgPage.startPage > 0}">
							<li><a href="<c:url value='/ctg/list?nowPage=${ctgPage.startPage - 1 }' />"><span class="glyphicon glyphicon-fast-backward"></span></a></li>
						</c:if>
						<c:forEach begin="${ctgPage.startPage+1 }" end="${ctgPage.endPage }" var="c">
						<li><a href="<c:url value='/ctg/list?nowPage=${c }' />">${c }</a></li>
						</c:forEach>
						<c:if test="${ctgPage.endPage != ctgPage.lastPage}">
							<li><a href="<c:url value='/ctg/list?nowPage=${ctgPage.endPage+1 }' />"><span class="glyphicon glyphicon-forward"></span></a></li>
						</c:if>
					</ul>
					</div>
	
					</div>
				
					<div id="tabs-2"> <!-- 상품 리스트 탭 -->
					
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
					<ul class="pagination" style="padding: 0px; margin: 0px;">
						<c:if test="${pdtPage.startPage != 1 && pdtPage.startPage > 0}">
							<li><a href="<c:url value='/ctg/list?nowPage=${pdtPage.startPage - 1 }' />"><span class="glyphicon glyphicon-fast-backward"></span></a></li>
						</c:if>
						<c:forEach begin="${pdtPage.startPage+1 }" end="${pdtPage.endPage }" var="p">
						<li><a href="<c:url value='/ctg/list?nowPage=${p }' />">${p }</a></li>
						</c:forEach>
						<c:if test="${pdtPage.endPage != pdtPage.lastPage}">
							<li><a href="<c:url value='/ctg/list?nowPage=${pdtPage.endPage+1 }' />"><span class="glyphicon glyphicon-forward"></span></a></li>
						</c:if>
					</ul>
					</div>
	
					</div>
					
					<div id="tabs-3"> <!-- 재고 리스트 탭 -->
					
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
					<ul class="pagination" style="padding: 0px; margin: 0px;">
						<c:if test="${stcPage.startPage != 1 && stcPage.startPage > 0}">
							<li><a href="<c:url value='/ctg/list?nowPage=${stcPage.startPage - 1 }' />"><span class="glyphicon glyphicon-fast-backward"></span></a></li>
						</c:if>
						<c:forEach begin="${stcPage.startPage+1 }" end="${stcPage.endPage }" var="p">
						<li><a href="<c:url value='/ctg/list?nowPage=${p }' />">${p }</a></li>
						</c:forEach>
						<c:if test="${stcPage.endPage != stcPage.lastPage}">
							<li><a href="<c:url value='/ctg/list?nowPage=${paging.endPage+1 }' />"><span class="glyphicon glyphicon-forward"></span></a></li>
						</c:if>
					</ul>
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

// 카테고리 추가 form 전송
$('#addNewCtgSubmit').on('click', function() {
	$('#ctgNewForm').submit();
})


// 검색
$('#searchType').on('click', function() {

	if($('#searchType option:selected').val() == 'ctg_type') {
		$('#searchText').attr('placeholder', '상품 / 재고 중 하나를 입력하세요');
	} else {
		$('#searchText').attr('placeholder', '검색할 단어를 입력하세요');
	}
})
$(document).on('click', '#btnSearch', function(e) {
	e.preventDefault();

	$('#frmSearch').submit();
});



//탭 화면 전환
$(function() {
	$('#tabs').tabs();
});


// 카테고리 수정 입력 폼으로 변경
function update(tdObj) {
	var td = tdObj.parent().children();
	
	var ctg_name = td.eq(1).text();
	var ctg_type = td.eq(2).text();
	
	td.eq(1).html("<input type='text' value='" + ctg_name + "' id='editName'>");
	td.eq(2).html("<input type='text' value='" + ctg_type + "' id='editType'>");
	td.eq(3).html("<input type='button' id='btnDo' value='수정하기' > &nbsp;" + 
			"<input type='button' id='btnCancel' value='취소' >");
}

// 카테고리 수정 ajax
$(document).on('click', '#btnDo', function() {
	var td = $(this).parent().parent().children();
	
	var ctg_id = td.eq(0).text();
	var ctg_name = td.eq(1).find('input').val();
	var ctg_type = td.eq(2).find('input').val();

	if(ctg_name == '') {
		alert('카테고리 이름을 입력해야 합니다.');
		td.eq(1).focus();
		return false;
	} else if(ctg_type == '') {
		alert('카테고리 타입을 입력해야 합니다.');
		td.eq(2).focus();
		return false;
	} else {
		 if(ctg_type != '' || ctg_type != null) 
			 ctg_type = ctg_type == '재고'? 2 : 1;

		 $.ajax({
			url: '/go/ctg/update/' + ctg_id,
			type: 'post',
			data: {
				ctg_name: ctg_name,
				ctg_type: ctg_type
			},
			success: function() {
				location.reload(true);
			}
		});
	}

})

// 카테고리 수정 취소
$(document).on('click', '#btnCancel', function() {
	var td = $(this).parent().parent().children();
	var html = "<input type='button' value='UPDATE' class='form-control btn btn-success btn-sm btn-submit' onclick='update($(this).parent())' />";

	var ctg_name = 
	
	td.eq(1).text($("#editName").val());
	td.eq(2).text($("#editType").val());
	td.eq(3).html(html);
})



// 카테고리 삭제
function del(tdObj) {
	var td = tdObj.parent().children();
	
	var ctg_id = td.eq(0).text();

	if(confirm('카테고리를 정말 삭제하시겠습니까?') == true) {
		location.href = "/go/ctg/delete/" + ctg_id;
	} else {
		return false;
	}
}



</script>

</body>
</html>