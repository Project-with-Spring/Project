<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/header"/>
<link rel="stylesheet" href="<c:url value="/resources/css/staff.css"/>">


<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></c:set> 


<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>근태관리</h1>
      <ol class="breadcrumb">
        <li><a href="<c:url value='main'/>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">근태관리</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	      <!-- Default box -->
      <div class="box">
	  	<div class="box-header with-border">
          <h3 class="box-title"></h3>
          <div class="box-tools pull-right">
	          <a href="javascript:;" id="csvDownloadButton" class="btn btn-success btn-sm">엑셀파일다운로드</a>
	      </div>
        </div>
		<script>
		function print_opt()
		{
			var URL = 'sales_print.php?txt_search='+$('#txt_search').val()+'&from='+$('#from').val()+'&to='+$('#to').val()+'&branch_id='+$('#branch_id').val()+'&cust_id='+$('#cust_id').val()+'&user_id='+$('#user_id').val()+'&pstatus='+$('#pstatus').val();
			print_sub(URL,800,600);
		}
		</script>
        <div class="box-body mg_t20">
  	       <div id="my_all">
  	       
			<form  method="get" action="<c:url value='/getCommuteListAll'/>" class=""> 
				<div class="form-group clearfix">
					<div class="col-md-2"><input type="text" name="from" id="from" value="<c:out value="${date}" />" class="form-control txtdate" readonly="readonly"></div>
				  	<div class="col-md-2"><input type="text" name="to" id="to" value="<c:out value="${date}" />" class="form-control txtdate" readonly="readonly"></div>
					<div class="col-md-1">
		              	<button type="submit" name="btn_filter" class="btn btn-primary form-control">조회하기</button>
	                </div>  		
				  	
	 			</div>		
 			</form>
		
	        <div class="table-responsive no-padding mg_t15">
	          <table class="table table-striped table-responsive tbl_narrow" id="commuteTb">
	          	<colgroup>
	          		<col style="width:5%;">
	          		<col style="width:12%;">
	          		<col style="width:8%;">
	          		<col style="width:15%;">
	          		<col style="width:18%;">
	          		<col style="width:15%;">
	          		<col style="width:16%;">
	          		<col style="width:11%;">
	          	</colgroup>
	            <thead>
	                <tr>
	                	<th class="tac">#</th>
	                    <th class="tac">직원ID</th>
	                    <th class="tac">직원이름</th>
						<th class="tac">직급</th>
						<th class="tac">출근시간</th>
						<th class="tac">퇴근시간</th> 
						<th class="tac"></th> 
	                </tr>
	  				</thead>
	  				<tbody>
	  				<c:choose>
					    <c:when test="${fn:length(cmtList) == 0}">
				        <tr>
					        <td colspan="11"  class="tac">조회된 근태리스트가 없습니다. </td>
							</tr>
					    </c:when>
					    <c:otherwise>
					        <c:forEach var="cmt" items="${cmtList}" varStatus="status">
					        	<tr>
					        		<td class="tac">${status.index+1}</td>
					        		<td class="tac">${cmt.stf_id} <!-- 직원ID 출력 --></td>
					        		<td class="tac">${cmt.stf_name} <!-- 직원이름 출력 --></td>
					        		<td class="tac">${cmt.pst_name} <!-- 직급 출력 --></td>
					        		<td class="tac"><fmt:formatDate value="${cmt.cmt_go}" pattern="yyyy-MM-dd HH:mm"/></td>
					        		<td class="tac"><fmt:formatDate value="${cmt.cmt_leave}" pattern="yyyy-MM-dd HH:mm"/> </td>
					        		<td class="text-right">					        			
										 <a href="<c:url value='commuteModify?stf_id=${cmt.stf_id}&cmt_id=${cmt.cmt_id}'/>"  class="btn btn-default btn-xs"  title="Update Detail">
					        			 	<span class="glyphicon glyphicon-pencil"></span>
					        			 </a> 
					        			 <a href="<c:url value='staffDelete?stf_id=${cmt.stf_id}&cmd_id=${cmt.cmt_id}'/>" class="btn btn-warning btn-xs" onclick="javascript:return confirm('해당 직원을 삭제하시겠습니까?');" title="Remove Position">
					        			 	<span class="glyphicon glyphicon-remove"></span>
				        			 	</a> 
					        		</td>
				            	</tr>		
									
					        </c:forEach>
					    </c:otherwise> 
					</c:choose>
				  				
  				
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
  
  
  
  <script type="text/javascript">

			class ToCSV {
		        constructor() {
			        // CSV 버튼에 이벤트 등록
			        document.querySelector('#csvDownloadButton').addEventListener('click', e => {
			            e.preventDefault()
			            this.getCSV('mycsv.csv')
			        })
			    }

	        downloadCSV(csv, filename) {
	            let csvFile;
	            let downloadLink;

	            // 한글 처리를 해주기 위해 BOM 추가하기
	            const BOM = "\uFEFF";
	            csv = BOM + csv

	            // CSV 파일을 위한 Blob 만들기
	            csvFile = new Blob([csv], {type: "text/csv"})

	            // Download link를 위한 a 엘리먼스 생성
	            downloadLink = document.createElement("a")

	            // 다운받을 csv 파일 이름 지정하기
	            downloadLink.download = filename;

	            // 위에서 만든 blob과 링크를 연결
	            downloadLink.href = window.URL.createObjectURL(csvFile)

	            // 링크가 눈에 보일 필요는 없으니 숨겨줍시다.
	            downloadLink.style.display = "none"

	            // HTML 가장 아래 부분에 링크를 붙여줍시다.
	            document.body.appendChild(downloadLink)

	            // 클릭 이벤트를 발생시켜 실제로 브라우저가 '다운로드'하도록 만들어줍시다.
	            downloadLink.click()
	        }

		    getCSV(filename) {
		        // csv를 담기 위한 빈 Array를 만듭시다.
		        const csv = []
		        const rows = document.querySelectorAll("#commuteTb tr")

		        for (let i = 0; i < rows.length; i++) {
		            const row = [], cols = rows[i].querySelectorAll("td, th")

		            for (let j = 0; j < cols.length; j++)
		                row.push(cols[j].innerText)

		            csv.push(row.join(","))
		        }

		        // Download CSV
		        this.downloadCSV(csv.join("\n"), filename)
		    }
		}

		document.addEventListener('DOMContentLoaded', e => {
		    new ToCSV()
		});	

		$(function() {
		$( "#from" ).datepicker({
			dateFormat: "yy-mm-dd",
			changeYear: true,
			yearRange: "2003:2021"
		});
		$( "#to" ).datepicker({
			dateFormat: "yy-mm-dd",
			changeYear: true,
			yearRange: "2003:2022"
		});
		$( "#dob" ).datepicker({
			dateFormat: "yy-mm-dd",
			changeYear: true,
			yearRange: "1940:2021"
		});
		$( "#date_join" ).datepicker({
			dateFormat: "yy-mm-dd",
			changeYear: true,
			yearRange: "1970:2021"
		});
		$( "#open_date" ).datepicker({
			dateFormat: "yy-mm-dd",
			changeYear: true,
			yearRange: "2003:2021"
		});
		$( "#pdate" ).datepicker({
			dateFormat: "yy-mm-dd",
			changeYear: true,
			yearRange: "2003:2022"
		});
		$( "#leave_from" ).datepicker({
			dateFormat: "yy-mm-dd",
			changeYear: true,
			yearRange: "2003:2022"
		});
		$( "#leave_to" ).datepicker({
			dateFormat: "yy-mm-dd",
			changeYear: true,
			yearRange: "2003:2022"
		});
		$( "#holiday_date" ).datepicker({
			dateFormat: "yy-mm-dd",
			changeYear: true,
			yearRange: "2003:2022"
		});
		$( "#v_date" ).datepicker({
			dateFormat: "yy-mm-dd",
			changeYear: true,
			yearRange: "2003:2022"
		});
		$(".datefld").datepicker({
			dateFormat: "yy-mm-dd",
			changeYear: true,
			yearRange: "2003:2022"
		});
		$(".date_box").datepicker({
			dateFormat: "yy-mm-dd",
			changeYear: true,
			yearRange: "2003:2022"
		});
		
	});



  </script>
  
<c:import url="/footer"/>