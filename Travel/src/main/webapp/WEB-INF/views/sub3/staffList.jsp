<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/header"/>
<link rel="stylesheet" href="<c:url value="/resources/css/staff.css"/>">

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>직원관리</h1>
      <ol class="breadcrumb">
        <li><a href="<c:url value='main'/>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">직원관리</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	      <!-- Default box -->
      <div class="box">
	  	<div class="box-header with-border">
          <h3 class="box-title"></h3>
          <div class="box-tools pull-right">
	          <a href="javascript:print_opt();" class="btn btn-success btn-sm">엑셀파일다운로드</a>
	          <a href="<c:url value='staffInsert'/>" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> 직원등록</a></div>
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
			<div class="form-group clearfix">
				<div class="col-md-2">
					<select name="position_id" id="position_id" class="form-control">
						<option value="pst00" selected>직급을 선택해주세요. </option>
						<option value="pst01">점장</option>
						<option value="pst02">매니저</option>
						<option value="pst03">정직원</option>
						<option value="pst04">아르바이트</option>
					</select>
			  	</div>
				<div class="col-md-2"><input type="text" name="from" id="from" value="" class="form-control txtdate" readonly="Yes"></div>
			  	<div class="col-md-2"><input type="text" name="to" id="to" value="" class="form-control txtdate" readonly="Yes"></div>
				<form  method="get" action="<c:url value='staffList'/>" class="float_right clearfix" style="width: 14.5%;">
					<div class="col-md-9">
						<input type="text"  class="form-control" name="stf_name" placeholder="직원명검색">
					</div>
					<input type="submit" class="btn btn-success btn-xxs" value="검색" style="width: 25%;">
				</form>
 			</div>
			
		
	        <div class="table-responsive no-padding mg_t15">
	          <table class="table table-striped table-responsive tbl_narrow">
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
	                    <th class="tac">직원이름</th>
	                    <th class="tac">직원ID</th>
						<th class="tac">직급</th>
						<th class="tac">직원폰번호</th>
						<th class="tac">근로일수</th>
						<th class="tac">근로시간</th> 
						<th class="tac"></th> 
	                </tr>
	  				</thead>
	  				<tbody id="stf_tb">
	  				<c:choose>
					    <c:when test="${fn:length(staffList) == 0}">
				        <tr>
					        <td colspan="11"  class="tac">조회된 직원이 없습니다.</td>
						</tr>
					    </c:when>
					    <c:otherwise>
					        <c:forEach var="stl" items="${staffList}" varStatus="status">
					        	<tr>
					        		<td class="tac">${status.index+1}</td>
					        		<td class="tac">${stl.stf_name} <!-- 직원이름 출력 --></td>
					        		<td class="tac">${stl.stf_id} <!-- 직원ID 출력 --></td>
					        		<td class="tac pst_name">${stl.pst_name} <!-- 직급 출력 --></td>
					        		<td class="tac">${stl.stf_phone} <!-- 직원폰번호 출력 --></td>
					        		<td class="tac">${stl.stf_phone} <!-- 직원이름 출력 --></td>
					        		<td class="tac">${stl.stf_phone} <!-- 직원이름 출력 --></td>
					        		<td class="text-right">					        			
										 <a href="<c:url value='staffModify?stf_id=${stl.stf_id}'/>"  class="btn btn-default btn-xs"  title="Update Detail">
					        			 	<span class="glyphicon glyphicon-pencil"></span>
					        			 </a> 
					        			 <a href="<c:url value='staffDelete?stf_id=${stl.stf_id}'/>" class="btn btn-warning btn-xs" onclick="javascript:return confirm('해당 직원을 삭제하시겠습니까?');" title="Remove Position">
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
  	<div class="modal fade bs-modal-lg" id="my-ajax-modal" role="basic" aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	        <div class="modal-content">
	        	<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					<h4 class="modal-title" id="gridSystemModalLabel">직급추가</h4>
				</div>
				<form method="post" action="<c:url value='staffnRegist'/>" class="form-horizontal" name="frm_new" id="frm_new">
					
					<div class="modal-body">
					  <div class="form-group">
						  <label class="col-md-2 control-label">직원이름 :</label>
						  <div class="col-md-4">
						  	<input type="text" name="pst_id" id="pst_id" class="form-control required" required="required" value="pst">
						  </div>
					  </div>
					  <div class="form-group">
						  <label class="col-md-2 control-label">직급 : </label>
						  <select class="col-md-10" name="pst_name" id="pst_name" >
						  	<option value="">직급을 선택해 주세요.</option>
						  	<option value=""></option>
						  	<option value=""></option>
						  	<option value=""></option>
						  </select>
					  </div>
					</div>
					<div class="modal-footer">
					        <button type="submit" class="btn btn-success btn-light-submit">추가하기&nbsp;&nbsp;<i class="fa fa-arrow-circle-right"></i></button>
							<button type="button" class="btn default" data-dismiss="modal">닫기</button>
					</div>
				</form>
			
			</div>
		</div>
	</div>
	
	<script type="text/javascript">

	$(function() {
		//직급별 리스트만 띄우기 
	    $(document).on("change", "#position_id", function() {
		    
	        var pst_val = $(this).val();
	        var stf_tb = $("#stf_tb tr");
	       	if(pst_val == "pst01"){
		       
	       		for(i=0; i< stf_tb.length; i++){
	       			if(stf_tb.eq(i).children('.pst_name').text()  != "점장"){
	       				stf_tb.eq(i).hide();
	       			}                           			
	       		}
	       		return 	
	       	}else if(pst_val == "pst02"){
	       		for(i=0; i< stf_tb.length; i++){
	       			if(stf_tb.eq(i).children('.pst_name').text() != "매니저"){
	       				stf_tb.eq(i).hide();
	       			}                           			
	       		}
	       		return 	
	       	}else if(pst_val == "pst03"){
		       	alert(stf_tb.length);
	       		for(i=0; i< stf_tb.length; i++){
	       			if(stf_tb.eq(i).children('.pst_name').text() != "정직원"){
	       				stf_tb.eq(i).hide();
	       			}                           			
	       		}
	       		return 	
	       	}else if(pst_val == "pst04"){
	       		for(i=0; i< stf_tb.length; i++){
	       			if(stf_tb.eq(i).children('.pst_name').text() != "아르바이트"){
	       				stf_tb.eq(i).hide();
	       			}                        			
	       		}
	       		return 	
	       	}else{
	       		stf_tb.show();                           			
	       	}                           
	    });
	});
	</script>
  
<script src="<c:url value="/resources/js/salesHistory.js"/>"></script>
<c:import url="/footer"/>