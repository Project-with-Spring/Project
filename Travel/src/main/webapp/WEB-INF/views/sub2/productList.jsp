<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/header"/>

<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Product List</h1>
		<ol class="breadcrumb">
			<li><a href="<c:url value='/main' />"><i
					class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Product List</li>
		</ol>
	</section>
	<!-- Main content -->
	<section class="content">

		<!-- Default box -->
		<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title"></h3>
				<div class="box-tools pull-right">
					<a href="<c:url value='/ctg/list' />" class="btn btn-success btn-sm">Category List</a>
					<a href="<c:url value='/stc/list' />" class="btn btn-success btn-sm">Stock List</a> <br>
				</div>
				<div>
					* 상품, 재고의 추가는 <strong>카테고리 목록</strong>에서 가능합니다.
				</div>
				<div class="box-body mg_t20">
					<div id="my_all">
						<!-- 검색창 -->
						<form name="frmSearch" id="frmSearch" method="get"
							action="<c:url value='/pdt/list'/>" class="form-horizontal">
							<div class="form-group">
								<div class="col-md-2">
									<label>Product Name: </label>
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
						
						<form name="frmFilter" id="frmFilter" method="post"
							action="<c:url value='/pdt/list'/>" class="form-horizontal">
							<div class="form-group">
								<div class="col-md-3">
									<select name="ctgSort" id="ctgSort" class="form-control select2">
										<option value="" selected>카테고리 모두 보기</option>
										<option value="1">커피</option>
										<option value="2">음료</option>
										<option value="3">디저트</option>
										<option value="4">기타</option>
									</select>
								</div>
								<div class="col-md-3">
									<select name="pdtSort" id="pdtSort" class="form-control">
										<option value="" selected>정렬 기준</option>
										<option value="new">최신 등록순</option>
										<option value="cost">가격순</option>
<!-- 										<option value="like">판매순</option> -->
									</select>
								</div>
								<div class="col-md-1">
									<button name="btn_filter" class="btn btn-primary form-control">Filter</button>
								</div>
							</div>
						</form>

						<div class="table-responsive no-padding mg_t15">
							<table class="table table-striped table-responsive tbl_narrow">
							<colgroup>
				          		<col style="width:10%;">
				          		<col style="width:18%;">
				          		<col style="width:20%;">
				          		<col style="width:20%;">
				          		<col style="width:20%;">
				          		<col style="width:11%;">
				          	</colgroup>
								<thead>
									<tr id="tr_top">
										<th class="tac" data-orderable="false">No.</th>
										<th class="tac">Categoty Name</th>
										<th class="tac">Product Name</th>
										<th class="tac">Product Cost</th>
										<th class="tac">Product Status</th>
										<th class="tac" data-orderable="false">Detail</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="pdt" items="${pdtList }">
										<tr>
											<td class="tac">${pdt.pdt_id}</td>
											<td class="tac">
											<c:choose>
												<c:when test="${pdt.ctg_id eq 1 }">커피</c:when>
												<c:when test="${pdt.ctg_id eq 2 }">음료</c:when>
												<c:when test="${pdt.ctg_id eq 3 }">디저트</c:when>
												<c:otherwise>기타</c:otherwise>
											</c:choose>
											</td>
											<td class="tac">${pdt.pdt_name }</td>
											<td class="tac">${pdt.pdt_cost }</td>
											<td class="tac">
											<c:choose>
												<c:when test="${pdt.pdt_status eq 1 }">판매중</c:when>
												<c:otherwise>판매 종료 (품절)</c:otherwise>
											</c:choose>
											</td>
											<td><a href="<c:url value='/pdt/list/${pdt.pdt_id }' />">상세페이지</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<div style="display: block; text-align: center;">
							<ul class="pagination" style="padding: 0px; margin: 0px;">
								<c:if test="${pdtPage.startPage != 1 && pdtPage.startPage > 0}">
									<li><a href="<c:url value='/pdt/list?nowPage=${pdtPage.startPage - 1 }' />"><span class="glyphicon glyphicon-fast-backward"></span></a></li>
								</c:if>
								<c:forEach begin="${pdtPage.startPage+1 }" end="${pdtPage.endPage }" var="p">
								<li><a href="<c:url value='/pdt/list?nowPage=${p }' />">${p }</a></li>
								</c:forEach>
								<c:if test="${pdtPage.endPage != pdtPage.lastPage}">
									<li><a href="<c:url value='/pdt/list?nowPage=${pdtPage.endPage+1 }' />"><span class="glyphicon glyphicon-forward"></span></a></li>
								</c:if>
							</ul>
							</div>

						</div>
					</div>

				</div>
			</div>
			<!-- /.box -->
	</section>
	<!-- /.content -->
</div>


<c:import url="/footer"/>


<script>
// 검색
$(document).on('click', '#btnSearch', function(e) {
	e.preventDefault();

	$('#frmSearch').submit();
});

</script>


</body>
</html>