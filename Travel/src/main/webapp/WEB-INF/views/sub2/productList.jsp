<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>

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
				<div class="box-body">
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

						<div class="table-responsive no-padding">
							<table class="table table-striped table-responsive tbl_narrow">
								<thead>
									<tr>
										<th>No.</th>
										<th>Categoty Name</th>
										<th>Product Name</th>
										<th>Product Cost</th>
										<th>Detail</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="pdt" items="${pdtList }">
										<tr>
											<td>${pdt.pdt_id}</td>
											<c:choose>
												<c:when test="${pdt.ctg_id eq 1 }">
													<td>커피</td>
												</c:when>
												<c:when test="${pdt.ctg_id eq 2 }">
													<td>음료</td>
												</c:when>
												<c:when test="${pdt.ctg_id eq 3 }">
													<td>디저트</td>
												</c:when>
												<c:otherwise>
													<td>기타</td>
												</c:otherwise>
											</c:choose>
											<td>${pdt.pdt_name }</td>
											<td>${pdt.pdt_cost }</td>
											<td><a href="<c:url value='/pdt/list/${pdt.pdt_id }' />">상세페이지</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<div style="display: block; text-align: center;">
								<c:if test="${pdtPage.startPage != 1 && pdtPage.startPage > 0}">
									<a href="<c:url value='/pdt/list?nowPage=${pdtPage.startPage - 1 }' />">&lt;</a>
								</c:if>
								<c:forEach begin="${pdtPage.startPage }"
									end="${pdtPage.endPage }" var="p">
									<c:choose>
										<c:when test="${p == pdtPage.nowPage }">
											<b>${p }</b>
										</c:when>
										<c:when test="${p != pdtPage.nowPage && p > 0}">
											<a href="<c:url value='/pdt/list?nowPage=${p }' />">${p }</a>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${pdtPage.endPage != pdtPage.lastPage}">
									<a href="<c:url value='/pdt/list?nowPage=${pdtPage.endPage+1 }' />">&gt;</a>
								</c:if>
							</div>

						</div>
					</div>

				</div>
			</div>
			<!-- /.box -->
	</section>
	<!-- /.content -->
</div>
<div class="modal fade bs-modal-lg" id="my-ajax-modal" role="basic"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content"></div>
	</div>
</div>


<%@ include file="../include/footer.jsp"%>


<script>
// 검색
$(document).on('click', '#btnSearch', function(e) {
	e.preventDefault();

	$('#frmSearch').submit();
});

// 정렬
</script>
</body>
</html>