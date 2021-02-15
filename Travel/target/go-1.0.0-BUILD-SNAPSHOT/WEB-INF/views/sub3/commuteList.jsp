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
      <h1>출퇴근등록</h1>
      <ol class="breadcrumb">
        <li><a href="<c:url value='main'/>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">출퇴근등록</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	      <!-- Default box -->
      <div class="box">
	  	<div class="box-header with-border">
          <h3 class="box-title"></h3>
          <div class="box-tools pull-right">
	          <a href="javascript:;" class="btn btn-success btn-sm" id="go_btn"><i class="fa fa-plus"></i> 출근</a>
	          <a href="javascript:;" class="btn btn-success btn-sm" id="leave_btn"><i class="fa fa-plus"></i>퇴근</a>
	          <a href="javascript:;" id="csvDownloadButton" class="btn btn-success btn-sm">엑셀파일다운로드</a>
	      </div>
        </div>
        <div class="box-body mg_t20">
  	       <div id="my_all">
			<form  method="get" action="<c:url value='/getCommuteList'/>" class=""> 
				<div class="form-group clearfix">
					 	<c:if test="${not empty param.from2}">
							<input type="hidden" name="from1" value="${param.from2}" >
					    </c:if>
				    	<c:if test="${not empty param.to2}">
							<input type="hidden" name="to1" id="to1" value="${param.to2}">
					    </c:if>
						
						<c:choose>
						    <c:when test="${not empty param.from1}">
								<div class="col-md-2"><input type="text" name="from1" id="from1" value="${param.from1}" class="from form-control txtdate" readonly="readonly"></div>
						    </c:when>
						    <c:otherwise>
								<div class="col-md-2"><input type="text" name="from1" id="from1" value="<c:out value="${date}"/>" class="from form-control txtdate" readonly="readonly"></div>
						    </c:otherwise>
					    </c:choose>
					    <c:choose>
						    <c:when test="${not empty param.to1}">
					  			<div class="col-md-2"><input type="text" name="to1" id="to1" value="<c:out value="${param.to1}" />" class="to form-control txtdate" readonly="readonly"></div>
						    </c:when>							
						    <c:otherwise>
								<div class="col-md-2"><input type="text" name="to1" id="to1" value="<c:out value="${date}" />" class="to form-control txtdate" readonly="readonly"></div>
							</c:otherwise>
					    </c:choose>
					    <div class="col-md-1">
			              	<button type="submit" name="btn_filter" class="btn btn-primary form-control dateBtn">조회하기</button>
			             </div>  		
				  	
	 			</div>
	       </form> 
			
		
	        <div class="table-responsive no-padding mg_t15">
	          <table class="table table-striped table-responsive tbl_narrow" class="commuteTb">
	          	<colgroup>
	          		<col style="width:5%;">
	          		<col style="width:12%;">
	          		<col style="width:8%;">
	          		<col style="width:15%;">
	          		<col style="width:18%;">
	          		<col style="width:26%;">
	          		<col style="width:26%;">
	          	</colgroup>
	            <thead>
	                <tr>
	                	<th class="tac">#</th>
	                    <th class="tac">직원ID</th>
	                    <th class="tac">직원이름</th>
						<th class="tac">직급</th>
						<th class="tac">출근시간</th>
						<th class="tac">퇴근시간</th> 
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
					        		<td class="tac"><fmt:formatDate value="${cmt.cmt_go}" pattern="yyyy-MM-dd hh:mm"/></td>
					        		<td class="tac"><fmt:formatDate value="${cmt.cmt_leave}" pattern="yyyy-MM-dd hh:mm"/> </td>
					        		
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
      
      <div class="box">
	  	<div class="box-header with-border">
          <h3 class="box-title"></h3>
          <div class="box-tools pull-right">
	          <a href="javascript:;" id="csvDownloadButton2" class="btn btn-success btn-sm">엑셀파일다운로드</a>
	      </div>
        </div>
        <div class="box-body mg_t20">
  	       <div id="my_all" style="overflow-y: auto;max-height: 539px;">
			<form  method="get" action="<c:url value='/getCommuteList'/>" class=""> 
				<c:if test="${not empty param.from1}">
					<input type="hidden" name="from1" value="${param.from1}">
			    </c:if>
		    	<c:if test="${not empty param.to1}">
					<input type="hidden" name="to1" value="${param.to1}">
			    </c:if>
				<div class="form-group clearfix">
				  	
									
	  				<c:choose>
					    <c:when test="${not empty param.from2}">
							<div class="col-md-2"><input type="text" name="from2" id="from2" value="${param.from2}" class="from form-control txtdate" readonly="readonly"></div>
					    </c:when>
					    <c:otherwise>
							<div class="col-md-2"><input type="text" name="from2" id="from2" value='' class="from form-control txtdate firstDay" readonly="readonly"></div>
					    </c:otherwise>
				    </c:choose>
				    <c:choose>
					    <c:when test="${not empty param.to2}">
				  			<div class="col-md-2"><input type="text" name="to2" id="to2" value="<c:out value="${param.to2}" />" class="to form-control txtdate" readonly="readonly"></div>
					    </c:when>							
					    <c:otherwise>
							<div class="col-md-2"><input type="text" name="to2" id="to2" value="<c:out value="${date}" />" class="to form-control txtdate " readonly="readonly"></div>
						</c:otherwise>
				    </c:choose>
				  	<div class="col-md-1">
		              	<button type="submit" name="btn_filter" class="btn btn-primary form-control">조회하기</button>
		              </div> 		
				  	
	 			</div>
 			</form>
			
		
	        <div class="table-responsive no-padding mg_t15">
	          <table class="table table-striped table-responsive tbl_narrow" class="commuteTb2">
	          	<colgroup>
	          		<col style="width:12%;">
	          		<col style="width:8%;">
	          		<col style="width:15%;">
	          		<col style="width:18%;">
	          		<col style="width:26%;">
	          		<col style="width:26%;">
	          	</colgroup>
	            <thead>
	                <tr>
	                    <th class="tac">직원이름</th>
						<th class="tac">직급</th>
						<th class="tac">총 근무일</th>
						<th class="tac">총 근무시간</th> 
	                </tr>
	  				</thead>
	  				<tbody>
	  				<c:choose>
					    <c:when test="${not empty stca}">
					    	<tr>
				        		<td class="tac">${stca.stf_name} <!-- 직원이름 출력 --></td>
				        		<td class="tac">${stca.pst_name} <!-- 직급 출력 --></td>
				        		<td class="tac">${stca.cnt_go} </td>
				        		<td class="tac">${stca.total_hour}</td>
			            	</tr>		
												        
					    </c:when>
					    <c:otherwise>
					    	<tr>
					        	<td colspan="11"  class="tac">조회된 근태리스트가 없습니다. </td>
							</tr>
					    </c:otherwise> 
					</c:choose>
				  				
  				
 				</tbody>	
              </table>
             </div>
          </div>
			  
        </div>
      </div>
	<!--// box2 -->
    </section>
    <!-- /.content -->
  </div>
  
  
  
  <script type="text/javascript">

			class ToCSV {
		        constructor() {
			        // CSV 버튼에 이벤트 등록
			        document.querySelector('#csvDownloadButton').addEventListener('click', e => {
			            e.preventDefault()
			            this.getCSV('mycommut.csv')
			        })

			        // CSV 버튼에 이벤트 등록
			        document.querySelector('#csvDownloadButton2').addEventListener('click', e => {
			            e.preventDefault()
			            this.getCSV('mycommut2.csv')
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
			        const rows = document.querySelectorAll(".commuteTb tr")
	
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

			/* $('.dateBtn').click(function(){

				var btn_p =$(this).parent();
				alert(btn_p.attr('class'));
				var to = btn_p.prev().children();
				alert(to.val());
				var from = btn_p.prev().prev().children();
				var from_id= from.attr("value");
				alert(from_id);

			}); */
			 
			$( ".from" ).datepicker({
				dateFormat: "yy-mm-dd",
				changeYear: true,
				yearRange: "2003:2021"
			});
			$( ".to" ).datepicker({
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
			//첫달1일 
			var date = new Date();
			var firstday = new Date(date.getFullYear(), date.getMonth(), "01");
			$(".firstDay").datepicker('setDate', firstday);

			
			// 출근
			$("#go_btn").click(function(){
				$.ajax({
					url : "cmt_go",
					type : "get",
					success:function(data){
						if(data == "cmt01"){
							alert("이미 출근하셨습니다.");
							window.location.href="getCommuteList";
						}else if(data == "cmt02"){
							alert("출근등록에 실패하였습니다.");
							window.location.href="getCommuteList";
						}else if(data == "cmt3"){
							alert("로그인 후 사용가능 합니다.");
							window.location.href="login";
						}else{
							alert("출근하셨습니다.");
							location.href="getCommuteList";
						}			 
					}				
				})
			});
			//퇴근
			$("#leave_btn").click(function(){
				$.ajax({
					url : "cmt_leave",
					type : "get",
					success:function(data){
						if(data == "cmt04"){
							alert("퇴근등록에 실패하였습니다. 오류사항 문의바랍니다.");
							location.href="getCommuteList";
						}else if(data == "cmt05"){
							alert("이미 퇴근하셨습니다.");
							location.href="getCommuteList";
						}else if(data == "cmt3"){
							alert("로그인 후 사용가능 합니다.");
							location.href="/login";
						}else{
							alert("퇴근하셨습니다.");
							location.href="getCommuteList";
						}	 
					}				
				})
			});
	});

  </script>
  
<c:import url="/footer"/>