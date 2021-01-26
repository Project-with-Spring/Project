<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/header"/>
<div class="content-wrapper" style="min-height: 805px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>직급수정</h1>
      <ol class="breadcrumb">
        <li><a href="<c:url value='main'/>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">직급수정</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
	  	<div class="box-header with-border">
          <h3 class="box-title"></h3>
          <div class="box-tools pull-right"><a href="<c:url value='positionList'/>" class="btn btn-success btn-sm"><i class="fa fa-angle-left"></i> Back</a></div>
        </div>
        <div class="box-body">
      
	      <div id="add_new" class="col-sm-12 col-md-12 col-lg-12">
	      	<form method="post" action="positionModifyPro" class="form-horizontal" name="positionModyForm" id="positionModyForm" style="width: 50%;margin: 0 auto;">
	      			
		          	<div class="form-group">
						  <label class="col-md-2 control-label tal">직급 Code :</label>
						  <div class="col-md-6"><input type="text" name="pst_id" id="pst_id" value="${pb.pst_id}" class="form-control required" readonly="readonly"></div>
						  
					  </div>
					  <div class="form-group">
						  <label class="col-md-2 control-label tal">직급 명 :</label>
						  <div class="col-md-6"><input type="text" name="pst_name" id="pst_name" value="${pb.pst_name} " class="form-control required" required=""></div>
						  
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