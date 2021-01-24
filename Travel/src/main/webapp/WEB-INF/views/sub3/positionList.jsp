<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/header"/>
<link rel="stylesheet" href="<c:url value="/resources/css/staff.css"/>">

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>직급관리</h1>
      <ol class="breadcrumb">
        <li><a href="<c:url value='main'/>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">직급관리</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	      <!-- Default box -->
      <div class="box">
	  	<div class="box-header with-border">
          <h3 class="box-title"></h3>
          <div class="box-tools pull-right">
          	<a href="javascript:;" class="btn btn-success btn-sm " data-target="#my-ajax-modal" data-toggle="modal"><i class="fa fa-plus"></i> 직급추가</a>
       	  </div>
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
	        <div class="table-responsive no-padding mg_t15">
	          <table class="table table-striped table-responsive tbl_narrow" id="pst_table">
	          	<colgroup>
	          		<col style="width:10.3%;">
	          		<col style="width:38.3%;">
	          		<col style="width:38.3%;">
	          		<col style="width:10%;">
	          	</colgroup>
	            <thead>
	                <tr>
	                	<th class="tac">#</th>
	                    <th class="tac">직급코드</th>
	                    <th class="tac">직급명</th>
	                    <th></th>
	                </tr>
	  				</thead>
	  				<tbody id="pst_table_tb">
	  				<c:choose>
					    <c:when test="${fn:length(positionList) == 0}">
				        <tr>
					        <td colspan="11"  class="tac">직급을 등록해주세요.</td>
							</tr>
					    </c:when>
					    <c:otherwise>
					        <c:forEach var="pst" items="${positionList}" varStatus="status">
					        	<tr>
					        		<td class="tac">${status.index+1}</td>
					        		<td class="tac">${pst.pst_id} <!-- 직급ID 출력 --></td>
					        		<td class="tac">${pst.pst_name} <!-- 직급명 출력 --></td>
					        		<td class="text-right">
					        			<c:url value="/positionModify" var="modi">
										  <c:param name="pst_id" value="${pst.pst_id}" />						
										</c:url>
										 <a href="${modi}" class="btn btn-default btn-xs" title="Update Detail">
					        			 	<span class="glyphicon glyphicon-pencil"></span>
					        			 </a> 
					        			 <a href="<c:url value='positionDelete?pst_id=${pst.pst_id}'/>" class="btn btn-warning btn-xs" onclick="javascript:return confirm('삭제하시겠습니까?');" title="Remove Position">
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
				<form method="post" action="<c:url value='positionRegist'/>" class="form-horizontal" name="frm_new" id="frm_new">
					
					<div class="modal-body">
					  <div class="form-group">
						  <label class="col-md-2 control-label">직급 Code :</label>
						  <div class="col-md-4">
						  	<input type="text" name="pst_id" id="pst_id" class="form-control required" required="required" value="pst">
						  </div>
					  </div>
					  <div class="form-group">
						  <label class="col-md-2 control-label">직급 명 :</label>
						  <div class="col-md-10"><input type="text" name="pst_name" id="pst_name" class="form-control" required="required"></div>
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
<c:import url="/footer"/>