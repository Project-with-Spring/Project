<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/header"/>
<link rel="stylesheet" href="<c:url value="/resources/css/salesHistory.css"/>">
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>판매내역</h1>
      <ol class="breadcrumb">
        <li><a href="https://activepos.net/active/index.php"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">판매내역</li>
      </ol>
    </section>    
    
    <!-- Main content -->
    <section class="content">
    	      <!-- Default box -->
      <div id="detailBox" class="box">
      <c:choose>
      <c:when test="${ordInfo != null }">
      	<div class="box-header with-border">
          <h3 class="box-title">판매 상세내역</h3>
          <div class="box-tools pull-right"><a href="<c:url value="salesHistory"/>" class="btn btn-success btn-sm"><i class="fa fa-list"></i> 판매내역 리스트</a></div>
          <hr>
          <div class="form-group" style="font-size: 14px;">
          <p class="text-info">판매일자 : ${ordInfo.ord_date }</p>
          <p class="text-info">총 할인 : ${ordInfo.ord_discount }</p>
          <p class="text-info">결제타입 : ${ordInfo.pmt_name }</p>
          <p class="text-info">판매자 : ${ordInfo.stf_name }</p>
          <p class="text-info">상태 : <c:choose><c:when test="${ordInfo.ord_cancel == 1 }">판매취소</c:when><c:otherwise>판매완료</c:otherwise></c:choose></p>
          <p class="text-info">총금액 : <span id="total">${ordInfo.ord_total }</span>원</p>
          <p id="isSetpoint" class="<c:choose><c:when test="${ordInfo.pot_id != null}">text-info</c:when><c:otherwise>text-warning</c:otherwise></c:choose>"
          ><c:choose><c:when test="${ordInfo.pot_id != null}">포인트 적립 완료</c:when><c:otherwise>포인트 적립 가능</c:otherwise></c:choose></p>
          </div>
        </div>
      
      <div class="table-responsive main_sale_table" style="padding: 5px; min-height: 550px; max-height: 550px;" id="sales_items">
			<table class="table tbl_narrow table-responsive" id="inv_detail">
			<thead>
				<tr>
					<th width="50%" style="min-width:200px;">메뉴 이름</th>
					<th style="min-width:40px;">수량</th>
					<th style="min-width:50px;">가격</th>
					<th style="min-width:60px;">상품 총액</th>
					<th style="min-width:60px;">추가</th>
					<th style="min-width:40px;">추가금액</th>
				</tr>
			</thead>	
					
			<tbody id="order_list">
			<c:forEach var="odt" items="${odtList }">
				<tr>
					<td>${odt.pdt_name }</td>
					<td>${odt.odt_count }</td>
					<td>${odt.pdt_cost }</td>
					<td>${odt.pdt_cost * odt.odt_count}</td>
					<td>${odt.odt_memo }</td>
					<td>${odt.dt_price }</td>
				</tr>
			</c:forEach>
				
			</tbody>
						
			</table>
		</div>
      </c:when>
      <c:otherwise>
      	<p>판매 내역이 없습니다.</p>
      </c:otherwise>
      </c:choose>
	  	
      
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

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/js/DataTables/datatables.min.css?ver=1"/>"/>
<c:import url="/footer"/>