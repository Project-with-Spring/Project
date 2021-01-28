<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/header"/>
<div class="content-wrapper" style="min-height: 805px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>직원수정</h1>
      <ol class="breadcrumb">
        <li><a href="<c:url value='main'/>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">직원수정</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
	  	<div class="box-header with-border">
          <h3 class="box-title"></h3>
          <c:set var="referURL" value="${header.referer}" />
          <div class="box-tools pull-right"><a href="<c:url value='${referURL}'/>" class="btn btn-success btn-sm"><i class="fa fa-angle-left"></i> 이전</a></div>
        </div>
        <div class="box-body">
      
	      <div id="add_new" class="col-sm-12 col-md-12 col-lg-12">
	      	<form method="POST" action="staffModifyPro" class="form-horizontal" name="positionModyForm" id="positionModyForm" style="width: 50%;margin: 0 auto;">
	      			<input type="hidden" name="stf_id" value="${sb.stf_id}">
		          	<div class="form-group">
					  <label class="col-md-2 control-label tal">직원이름 :</label>
					  <div class="col-md-6">
					  	<input type="text" name="stf_name" id="stf_name" value="${sb.stf_name}" class="form-control required" required="required">
				  	</div>
				  </div>
				  <div class="form-group">
					  <label class="col-md-2 control-label tal">직급 :</label>
					  <div class="col-md-6">
					  	<select name="pst_id" id="pst_id" required="required" class="col-md-6">						  
					  		<c:choose>
							    <c:when test="${fn:length(positionList) == 0}">
						        	<option value="">직급을 선택 해 주세요 </option>
							    </c:when>
							    <c:otherwise>
							        <c:forEach var="psl" items="${positionList}">
					  					<option value="${psl.pst_id}" <c:if test="${sb.pst_id eq psl.pst_id}">selected</c:if>>${psl.pst_name} </option>												
							        </c:forEach>
							    </c:otherwise> 
							</c:choose>
					  	</select>
				  	  </div>
				  	  </div>
				  	  <div class="form-group">
						  <label class="col-md-2 control-label tal">직원 폰번호 :</label>
						  <div class="col-md-6">
						  	<input type="text" name="stf_phone" id="stf_phone" value="${sb.stf_phone}" class="form-control required" required="required" placeholder="000-0000-0000">
					  	</div>
				  	</div>
						  
		            <div class="form-group">
		                <label for="expiry_date" class="col-sm-2 control-label"></label>
		                <div class="col-xs-6 col-sm-6">
		                  <input type="submit" class="form-control btn btn-success btn-sm btn-update" id="sub_mit" value="수정하기">
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
  
  
  <c:import url="/footer"/>