<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:import url="/header"/>
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
      <div class="box">
	  	<div class="box-header with-border">
          <h3 class="box-title"></h3>
          <div class="box-tools pull-right"><a href="javascript:print_opt();" class="btn btn-success btn-sm">CSV 내보내기</a> <a href="<c:url value="sales"/>" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> 주문받기</a></div>
        </div>
		<script>
		function print_opt()
		{
			var URL = 'sales_print.php?txt_search='+$('#txt_search').val()+'&from='+$('#from').val()+'&to='+$('#to').val()+'&branch_id='+$('#branch_id').val()+'&cust_id='+$('#cust_id').val()+'&user_id='+$('#user_id').val()+'&pstatus='+$('#pstatus').val();
			print_sub(URL,800,600);
		}
		</script>
        <div class="box-body">
  	       <div id="my_all">
			<form name="frm_filter" id="frm_filter" method="get" action="/active/sales/sales.php" class="form-horizontal">
			<div class="form-group">
				<div class="col-md-2"><input type="date" name="from" id="from" value="" class="form-control txtdate" ></div>
			  	<div class="col-md-2"><input type="date" name="to" id="to" value="" class="form-control txtdate" ></div>
			  			</div>
			<div class="form-group">
              <div class="col-md-3"><input type="text" name="txt_search" id="txt_search" value="" class="form-control" placeholder="고객 전화번호 '-' 빼고 입력하세요"></div>
			  <div class="col-md-3">
			  	<select name="cust_id" id="cust_id" class="form-control select2" style="width:100%;">
				<option value="">주문번호</option>
								</select>
			  </div>
              <div class="col-md-2">
				<select name="user_id" id="user_id" class="form-control">
					<option value="">판매자</option>
										<option value="3785">jy12356@naver.com</option>
									</select>
			  </div>
			  <div class="col-md-2">
				<select name="pstatus" id="pstatus" class="form-control">
					<option value="">상태</option>
					<option value="Pending">판매완료</option>
					<option value="Paid">판매취소</option>
				</select>
			  </div>
			  <div class="col-md-1">
              	<button name="btn_filter" class="btn btn-primary form-control">필터</button>
              </div>
          </div>	
        </form>
		
        <div class="table-responsive no-padding">
          <table id="historyTable" class="table table-striped table-responsive tbl_narrow table-bordered">
            <thead>
                <tr id="tr_top">
                  <th width="5%">#</th>
                    <th width="10%">판매날짜</th>
					<th width="10%">판매자</th>
					<th width="10%">판매금액</th>
					<th width="10%">할인타입</th>
					<th width="10%">할인량</th>
					<th width="10%">고객전화번호</th>
					<th width="10%">상태</th>
                    <th width="10%">상세보기</th>
                    <th class="text-right" width="10%">메모</th>
                </tr>
  				</thead>
  				<tbody>
<!-- 				<tr> -->
<!-- 					<td colspan="11"> -->
<!-- 						판매내역이 없습니다				 -->
<!-- 					</td> -->
<!-- 				</tr> -->
				<tr>
				<td>1</td>
				<td>2021-01-24</td>
				<td>박진훈</td>
				<td>50500</td>
				<td>포인트</td>
				<td>2000</td>
				<td>010-4003-3892</td>
				<td>판매완료</td>
				<td>상세보기</td>
				<td class="text-right" width="10%">없음</td>
				</tr>
				<tr>
				<td>2</td>
				<td>2021-01-25</td>
				<td>한재욱</td>
				<td>55000</td>
				<td>포인트</td>
				<td>5000</td>
				<td>010-8483-7521</td>
				<td>판매완료</td>
				<td>상세보기</td>
				<td class="text-right" width="10%">없음</td>
				</tr>
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

<script src="<c:url value="/resources/js/salesHistory.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/js/DataTables/datatables.min.css?ver=1"/>"/>
<script type="text/javascript" src="<c:url value="/resources/js/DataTables/datatables.min.js"/>"></script>
<c:import url="/footer"/>
<script type="text/javascript">
$(document).ready(function(){
	$('#historyTable').DataTable({
		//표시 건수기능 숨기기
		lengthChange: false,
		// 검색 기능 숨기기
		searching: false,
		// 정보 표시 숨기기
		info: false,
		// 페이징 기능 숨기기
		paging: false
	});
})
</script>
