<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>

<div class="content-wrapper">
	<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>Product Detail</h1>
      <ol class="breadcrumb">
        <li><a href="<c:url value='/main' />"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="<c:url value='/pdt/list' />"><i class="fa fa-dashboard"></i> Product List</a></li>
        <li class="active">Product Detail</li>
      </ol>
    </section>
	<!-- Default box -->
	<div class="box">
		<div id="my_all">
			<div class="table-responsive no-padding">
				<form action="<c:url value='/pdt/update/${pdt_id }/post'/>" method="POST" id="updateForm">
				<br><br>
					<table class="table table-striped table-responsive tbl_narrow" id="table">
						<!-- 테이블에 들어갈 행 추가 -->
						
						<input type="hidden" value="${pdt.pdt_name }" name="pdt_name">
						<input type="hidden" value="${pdt.pdt_id }" name="pdt_id">
						<tr>
							<td><label>상품명</label></td>
							<td>${pdt.pdt_name }</td>
						</tr>
						<tr>
							<td><label>상품 가격</label></td>
							<td><input type="text" value="${pdt.pdt_cost }" name="pdt_cost" id="pdt_cost"> 원</td>
						</tr>
						<tr>
							<td><label>상품 판매 상태</label></td>
							<td>
								<select id="pdt_status">
								<c:choose>
									<c:when test="${pdt.pdt_status == 1}">
										<option value="1" selected>판매중</option>
										<option value="2">판매 완료 (품절)</option>
									</c:when>
									<c:otherwise>
										<option value="1">판매중</option>
										<option value="2" selected>판매 완료 (품절)</option>
									</c:otherwise>
								</c:choose>
								</select>
							</td>
						</tr>

					</table>
					<br><br>
					<div id="add-new-btn">
						<label for="expiry_date" class="col-sm-2 control-label"></label>
						<div class="col-xs-6 col-sm-2">
							<input type="button" class="form-control btn btn-success btn-sm btn-submit"
								value="UPDATE" onclick = "update()">
						</div>
						<div class="col-xs-6 col-sm-2">
							<input type="button" class="form-control btn btn-danger btn-sm"
								value="CANCEL" onclick="href='history.back()'" >
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>

<script>
function update() {
	var statusVal = $("#pdt_status option:selected").val();
	var pdt_status = 0;
	
	if(statusVal == 2) {
		pdt_status = 2;
	} else {
		pdt_status = 1;
	}

	console.log(pdt_status);
	
	var html = "<input type='hidden' value='" + pdt_status + "' name='pdt_status'>";
	$("#add-new-btn").append(html);

	$('#updateForm').submit();
}
</script>

</body>
</html>