<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>

<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Stock List</h1>
		<ol class="breadcrumb">
			<li><a href="<c:url value='/main' />"><i
					class="fa fa-dashboard"></i> Home</a></li>
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
					<a href="<c:url value='/ctg/list' />"
						class="btn btn-success btn-sm">Category List</a> <a
						href="<c:url value='/pdt/list' />" class="btn btn-success btn-sm">Product
						List</a> <br>
				</div>
				<div>
					* 상품, 재고의 추가는 <strong>카테고리 목록</strong>에서 가능합니다.
				</div>
				<div class="box-body">
					<div id="my_all">
						<!-- 검색창 -->
						<form name="frmSearch" id="frmSearch" method="get"
							action="<c:url value='/stc/list'/>" class="form-horizontal">
							<div class="form-group">
								<div class="col-md-2">
									<label>Stock Name: </label>
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
							action="<c:url value='/stc/list'/>" class="form-horizontal">
							<div class="form-group">
								<div class="col-md-3">
									<select name="ctgSort" id="ctgSort" class="form-control select2">
										<option value="">카테고리 모두 보기</option>
										<option value="5">커피원두</option>
										<option value="6">냉장/냉동</option>
										<option value="7">시럽/소스</option>
										<option value="8">기타</option>
									</select>
								</div>
								<div class="col-md-3">
									<select name="stcSort" id="stcSort" class="form-control">
										<option value="" selected>정렬 기준</option>
										<option value="new">최신 등록순</option>
										<option value="cost">가격순</option>
<!-- 										<option value="like">사용 빈도순</option> -->
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
										<th>Stock No.</th>
										<th>Categoty Name</th>
										<th>Stock Name</th>
										<th>Stock Cost</th>
										<th>Stock In</th>
										<th>Detail</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="stc" items="${stcList }">
										<tr>
											<td>${stc.stc_id }</td>
											<c:choose>
												<c:when test="${stc.ctg_id eq 5 }">
													<td>커피원두</td>
												</c:when>
												<c:when test="${stc.ctg_id eq 6 }">
													<td>냉장/냉동</td>
												</c:when>
												<c:when test="${stc.ctg_id eq 7 }">
													<td>시럽/소스</td>
												</c:when>
												<c:otherwise>
													<td>기타</td>
												</c:otherwise>
											</c:choose>
											<td>${stc.stc_name }</td>
											<td>${stc.stc_cost }</td>
											<td>${stc.stc_in }</td>
											<td><a href="<c:url value='/stc/list/${stc.stc_id }' />">상세페이지</a></td>
										</tr>
										<c:set var="num" value="${num+1 }" />
									</c:forEach>
								</tbody>
							</table>



							<div style="display: block; text-align: center;">
							<ul class="pagination" style="padding: 0px; margin: 0px;">
								<c:if test="${stcPage.startPage != 1 && stcPage.startPage > 0}">
									<li><a href="<c:url value='/stc/list?nowPage=${stcPage.startPage - 1 }' />"><span class="glyphicon glyphicon-fast-backward"></span></a></li>
								</c:if>
								<c:forEach begin="${stcPage.startPage+1 }" end="${stcPage.endPage }" var="p">
								<li><a href="<c:url value='/stc/list?nowPage=${p }' />">${p }</a></li>
								</c:forEach>
								<c:if test="${stcPage.endPage != stcPage.lastPage}">
									<a href="<c:url value='/stc/list?nowPage=${paging.endPage+1 }' />"><span class="glyphicon glyphicon-forward"></span></a>
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
</script>

</body>
</html>