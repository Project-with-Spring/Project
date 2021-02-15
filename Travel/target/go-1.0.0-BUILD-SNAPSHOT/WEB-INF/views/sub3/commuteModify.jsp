<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/header"/>
<div class="content-wrapper" style="min-height: 805px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>근태시간수정</h1>
      <ol class="breadcrumb">
        <li><a href="<c:url value='main'/>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">근태시간수정</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
	  	<div class="box-header with-border">
          <h3 class="box-title"></h3>
          <div class="box-tools pull-right"><a href="<c:url value='/getCommuteListAll'/>" class="btn btn-success btn-sm"><i class="fa fa-angle-left"></i> 이전</a></div>
        </div>
        <div class="box-body">
      
	      <div id="add_new" class="col-sm-12 col-md-12 col-lg-12">
	      	<form <%-- action="<c:url value='/commuteModifyPro'/>"  --%> method="POST" class="form-horizontal" id="commuteModyForm" name="commuteModyForm" style="width: 50%;margin: 0 auto;">
	      			
		          	<div class="form-group">
		          		  <input type="hidden" name="stf_id" value="${commuteBean.stf_id}">
		          		  <input type="hidden" name="cmt_id" value="${commuteBean.cmt_id}">
						  <label class="col-md-2 control-label tal">출근시간 :</label>
						  <div class="col-md-6">
						  	<input type="text" name="cmt_goS" id="cmt_go" value="<fmt:formatDate value="${commuteBean.cmt_go}" pattern="yyyy-MM-dd HH:mm"/>" class="form-control required"></div>
					  </div>
					  <div class="form-group">
						  <label class="col-md-2 control-label tal">퇴근시간 :</label>
						  
						  <div class="col-md-6">
						  <c:set var="cmt_leave" value="${commuteBean.cmt_leave}" />
						  <c:choose>							

							    <c:when test="${not empty cmt_leave}">
						        	<input type="text" name="cmt_leaveS" id="cmt_leave" value="<fmt:formatDate value="${commuteBean.cmt_leave}" pattern="yyyy-MM-dd HH:mm"/>" class="form-control required" >
							    </c:when>							
							    <c:otherwise>
						        	<input type="text" name="cmt_leaveS" id="cmt_leave" class="form-control required" value="" disabled="disabled">
							    </c:otherwise>
							
							
							</c:choose>

						  
						  </div>
					  </div>
		            <div class="form-group">
		                <label for="expiry_date" class="col-sm-2 control-label"></label>
		                <div class="col-xs-6 col-sm-6">
		                  <input type="button"  onclick="modify(); return false;" class="form-control btn btn-success btn-sm btn-update" id="sub_mit" value="수정하기">
		                </div>
		            </div>
		          </form>
			</div>

        </div>
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
  <script type="text/javascript">

		//출퇴근 수정 
    	function modify(){
    	    var formData = $("#commuteModyForm").serialize();
			$.ajax({
				url : "commuteModifyPro",
				type : "POST",
				data : formData, 
				success:function(data){
					if(data == "cmtM01"){
						alert("출근시간이 퇴근시간을 이후로 될 수 없습니다. 또는 퇴근시간이 출근시간 이전이 될수 없습니다.");
						return false;
					}else{
						alert("수정되었습니다.");
						location.href="getCommuteListAll";
					}	 
				}				
			})
		}

  </script>
  
  <c:import url="/footer"/>