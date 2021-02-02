<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>Product List</h1>
      <ol class="breadcrumb">
        <li><a href="<c:url value='/main' />"><i class="fa fa-dashboard"></i> Home</a></li>
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
		  <a href="<c:url value='/stc/list' />" class="btn btn-success btn-sm">Stock List</a>
		  <br>
        </div>
		  <div>* 상품, 재고의 추가는 <strong>카테고리 목록</strong>에서 가능합니다.</div>
        <div class="box-body">
  	    <div id="my_all">
		<form name="frm_filter" id="frm_filter" method="get" action="/active/products/items.php" class="form-horizontal">
          <div class="form-group">
              <div class="col-md-3">
              <select name="ctg_show" id="ctg_show" class="form-control select2">
				<option value="">카테고리 모두 보기</option>
				<option value="1">커피</option>
				<option value="2">음료</option>
				<option value="3">디저트</option>
				<option value="4">기타</option>
			  </select></div>
			  <div class="col-md-3">
				<select name="branch_id" id="branch_id" class="form-control">
					<option value="" selected> 정렬 기준 </option>
					<option value="new">최신 등록순</option>
					<option value="cost">가격순</option>
					<option value="like">판매순</option>
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
				<c:set var="num" value="1" />
				<c:forEach var="pdt" items="${pdtList }">
					<tr>
		        	<td><c:out value="${num }" /></td>
		            <c:choose>
		            	<c:when test="${pdt.ctg_id eq 1 }"> <td>커피</td> </c:when>
		            	<c:when test="${pdt.ctg_id eq 2 }"> <td>음료</td> </c:when>
		            	<c:when test="${pdt.ctg_id eq 3 }"> <td>디저트</td> </c:when>
					  	<c:otherwise> <td>기타</td> </c:otherwise>
		            </c:choose>
		            <td>${pdt.pdt_name }</td>
		            <td>${pdt.pdt_cost }</td>
		            <td><a href="<c:url value='/pdt/list/${pdt.pdt_id }' />">상세페이지</a></td>
		            </tr>
		        	<c:set var="num" value="${num+1 }"/>
                </c:forEach>
<!-- 				<tr> -->
<!-- 					<td colspan="12"> -->
<!-- 			<div style="float:left;margin-right:10px;"> -->
<!-- 			<ul class="pagination" style="padding:0px;margin:0px;"> -->
<!-- 			<li><a href="javascript:void(0);" title="First Page"><span class="glyphicon glyphicon-fast-backward"></span></a></li> -->
<!-- 			<li><a href="javascript:void(0);" title="Previous Page"><span class="glyphicon glyphicon-backward"></span></a></li><li><a href="javascript:void(0);">Page: 1 of 1</a></li><li><a href="javascript:void(0);" title="Next Page"><span class="glyphicon glyphicon-forward"></span></a></li><li><a href="javascript:void(0);" title="Last Page"><span class="glyphicon glyphicon-fast-forward"></span></a></li> -->
<!-- 			</ul> -->
<!-- 			</div></td> -->
<!-- 				</tr> -->
				</tbody>
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


<!-- <script> -->
<!-- // 페이징 (무한 스크롤) -->
<!-- var page = 1; -->

<!-- $(function() { -->
<!-- 	getList(page); -->
<!-- 	page++; -->
<!-- }); -->

<!-- $(window).scroll(function() { -->
<!-- 	if($(window).scrollTop() == $(document).height() - $(window).height()) { -->
<!-- 		getList(page); -->
<!-- 		page++; -->
<!-- 	} -->
<!-- }); -->

<!-- var start = 0; -->
<!-- var list = 5; -->

<!-- function getList(page) { -->
<!-- 	$.ajax({ -->
<!-- 		type: 'POST', -->
<!-- 		dataType: 'json', -->
<!-- 		data: {"page" : page}, -->
<!-- 		url: 'url,,' -->
<!-- 	}).done(function(returnData) { -->
<!-- 		var data = returnData.rows; -->
<!-- 		var html = ""; -->

<!-- 		if(page == 1) { -->
<!-- 			$('tbody').html(""); -->
<!-- 		} -->

<!-- 		if(returnData.startNum <= returnData.totCnt) { -->
<!-- 			if(data.length > 0) { -->
<!-- 				for(var i=0; i<data.length; i++) { -->
<%-- 					html = "<tr>" +  --%>
<!-- 							"<td>" -->
<!-- 				} -->
<!-- 			} -->
<!-- 		} -->
<!-- 	}); -->
<!-- } -->
<!-- </script> -->
</body>
</html>