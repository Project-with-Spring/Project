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
    
    <div class="box">
    	<div class="box-header with-border">
          <h3 class="box-title">판매 현황</h3>
          <div class="box-tools pull-right"><a href="<c:url value="salesHistory"/>" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> 판매내역 리스트</a> <a href="<c:url value="sale"/>" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> 주문받기</a></div>
        </div>
    
    </div>
    
    </section>
    <!-- /.content -->
  </div>
<div class="modal fade bs-modal-lg" id="my-ajax-modal" role="basic" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content"></div>
    </div>
</div>

<script src="<c:url value="/resources/js/salesHistory.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/js/DataTables/datatables.min.css?ver=1"/>"/>
<script type="text/javascript" src="<c:url value="/resources/js/DataTables/datatables.min.js"/>"></script>
<c:import url="/footer"/>