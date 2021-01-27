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
      <div class="box">
	  	<div class="box-header with-border">
          <h3 class="box-title"></h3>
          <div class="box-tools pull-right"><a id="csvDownloadButton" class="btn btn-success btn-sm">CSV 내보내기</a> <a href="<c:url value="sales"/>" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> 주문받기</a></div>
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
			<form name="frm_filter" id="frm_filter" method="get" action="<c:url value="/salesHistory"/>" class="form-horizontal">
			<input type="hidden" name="search" value="on">
			<div class="form-group">
				<div class="col-md-2"><input type="date" name="begin_date" id="begin_date" value="" class="form-control txtdate" ></div>
			  	<div class="col-md-2"><input type="date" name="end_date" id="end_date" value="" class="form-control txtdate" ></div>
			  	<div class="col-md-2"><input type="number" name="min_price" id="min_price" value="" min="0" class="form-control" placeholder="최소금액"></div>
			  	<div class="col-md-2"><input type="number" name="max_price" id="max_price" value="" min="0" class="form-control" placeholder="최대금액"></div>
			  	<div class="col-md-2"><input type="text" name="memo_search" id="memo_search" value="" class="form-control" placeholder="메모를 입력하세요"></div>
			</div>
			
			<div class="form-group">
              <div class="col-md-3">
              <input type="text" name="phone_search" id="phone_search" value="" class="form-control" placeholder="고객 전화번호 '-' 빼고 입력하세요"></div>
			  <div class="col-md-3">
			  	<select name="pmt_search" id="pmt_search" class="form-control select2" style="width:100%;">
					<option value="">결제타입</option>
					<option value="현금">현금</option>
					<option value="카드">카드</option>
				</select>
			  </div>
              <div class="col-md-2">
				<select name="staff_search" id="staff_search" class="form-control">
					<option value="">판매자</option>
					<c:forEach var="list" items="${staffList }">
					<option value="${list.stf_id }">${list.stf_name}</option>
					</c:forEach>
				</select>
			  </div>
			  <div class="col-md-2">
				<select name="cancel_search" id="cancel_search" class="form-control">
					<option value="">상태</option>
					<option value="0">판매완료</option>
					<option value="1">판매취소</option>
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
					<th width="10%">결제타입</th>
					<th width="10%">할인</th>
					<th width="10%">전화번호</th>
					<th width="10%">상태</th>
                    <th width="10%">상세보기</th>
                    <th class="text-right" width="10%">메모</th>
                </tr>
  				</thead>
  				<tbody>
  				<c:choose>
	  				<c:when test="${list != null}">
		  				<c:forEach var="list" items="${list }">
		  				<tr>
						<td>${list.ord_id }</td>
						<td><fmt:formatDate value="${list.ord_date }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>${list.stf_name }</td>
						<td>${list.ord_total }</td>
						<td>${list.pmt_name }</td>
						<td>${ord_discount }</td>
						<td>${list.pot_id }</td>
						<td><c:choose><c:when test="${list.ord_cancel == 0}">판매완료</c:when><c:otherwise>판매취소</c:otherwise></c:choose></td>
						<td>상세보기</td>
						<td class="text-right" width="10%">${list.ord_memo }</td>
						</tr>
		  				</c:forEach>
	  				</c:when>
	  				<c:otherwise>
			  			<tr>
						<td colspan="10">
							판매내역이 없습니다				
						</td>
						</tr>
	  				</c:otherwise>
  				</c:choose>
  				</tbody>
				</table>
             </div>
             
             <div style="float: left; margin-right: 10px;">
             <c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
				<ul class="pagination" style="padding: 0px; margin: 0px;">
					
					<c:if test="${pageBean.pageNum > 1 }">
					<li><a href="<c:url value="${path }?page=1"/><c:if test="${param.search eq 'on' }">
					&search=on&begin_date=${param.begin_date}&end_date=${param.end_date}&memo_search=${param.memo_search}&phone_search=${param.phone_search}&pmt_search=${param.pmt_search}&staff_search=${param.staff_search}&cancel_search=${param.cancel_search}&btn_filter=
					</c:if>" title="First Page">
						<span class="glyphicon glyphicon-fast-backward"></span></a></li>
					</c:if>
					
					<c:if test="${pageBean.pageNum > 1 }">
					<li><a href="<c:url value="${path }?page=${pageBean.pageNum - 1 }"/><c:if test="${param.search eq 'on' }">
					&search=on&begin_date=${param.begin_date}&end_date=${param.end_date}&memo_search=${param.memo_search}&phone_search=${param.phone_search}&pmt_search=${param.pmt_search}&staff_search=${param.staff_search}&cancel_search=${param.cancel_search}&btn_filter=
					</c:if>" title="Previous Page">
						<span class="glyphicon glyphicon-backward"></span></a></li>
					</c:if>
					
					<li><select onchange="location.href='<c:url value="${path }?page="/>'+this.value+'<c:if test="${param.search eq 'on' }">&search=on&begin_date=${param.begin_date}&end_date=${param.end_date}&memo_search=${param.memo_search}&phone_search=${param.phone_search}&pmt_search=${param.pmt_search}&staff_search=${param.staff_search}&cancel_search=${param.cancel_search}&btn_filter=</c:if>'">
					<option value=${pageBean.pageNum }>Page: ${pageBean.pageNum } of ${pageBean.endPage }</option>
					<c:forEach var="count" begin="1" end="${pageBean.endPage }" step="1">
					<option value="${count }">Page: ${count }</option>
					</c:forEach>
					</select></li>
					
					<c:if test="${pageBean.pageNum < pageBean.endPage }">
					<li><a href="<c:url value="${path }?page=${pageBean.pageNum + 1 }"/><c:if test="${param.search eq 'on' }">
					&search=on&begin_date=${param.begin_date}&end_date=${param.end_date}&memo_search=${param.memo_search}&phone_search=${param.phone_search}&pmt_search=${param.pmt_search}&staff_search=${param.staff_search}&cancel_search=${param.cancel_search}&btn_filter=
					</c:if>" title="Next Page">
						<span class="glyphicon glyphicon-forward"></span></a></li>
					</c:if>
					
					<c:if test="${pageBean.pageNum < pageBean.endPage }">
					<li><a href="<c:url value="${path }?page=${pageBean.endPage }"/><c:if test="${param.search eq 'on' }">
					&search=on&begin_date=${param.begin_date}&end_date=${param.end_date}&memo_search=${param.memo_search}&phone_search=${param.phone_search}&pmt_search=${param.pmt_search}&staff_search=${param.staff_search}&cancel_search=${param.cancel_search}&btn_filter=
					</c:if>" title="Last Page">
						<span class="glyphicon glyphicon-fast-forward"></span></a></li>
					</c:if>
				</ul>
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
//다운로드 하이퍼링크에 클릭 이벤트 발생시 saveCSV 함수를 호출하도록 이벤트 리스너를 추가
document.addEventListener('DOMContentLoaded', function(){
  document.getElementById('csvDownloadButton').addEventListener('click', function(){
    saveCSV('data.csv'); // CSV파일 다운로드 함수 호출
    return false;
  })
});

//CSV 생성 함수
function saveCSV(fileName){
    //CSV 문자열 생성
    let downLink = document.getElementById('csvDownloadButton');
    let csv = ''; //CSV최종 문자열을 저장하는 변수
    let rows = document.querySelectorAll("#historyTable tr"); // 테이블에서 행 요소들을 모두 선택

    
    //행단위 루핑
    for (var i = 0; i < rows.length; i++) {
        let cells = rows[i].querySelectorAll("td, th");
        let row = [];
        //행의 셀 값을 배열로 얻기
        cells.forEach(function(cell){
          row.push(cell.innerHTML);
        });

        csv += row.join(',') + (i != rows.length-1 ? '\n':''); // 배열을 문자열+줄바꿈으로 변환
    }
    
 	// 한글 처리를 해주기 위해 BOM 추가하기
    const BOM = "\uFEFF";
    csv = BOM + csv
    
    //CSV 파일 저장
    csvFile = new Blob([csv], {type: "text/csv"}); // 생성한 CSV 문자열을 Blob 데이터로 생성
    downLink.href = window.URL.createObjectURL(csvFile); // Blob 데이터를 URL 객체로 감싸 다운로드 하이퍼링크에 붙임.
    downLink.download = fileName; // 인자로 받은 다운로드 파일명을 지정
}

</script>
