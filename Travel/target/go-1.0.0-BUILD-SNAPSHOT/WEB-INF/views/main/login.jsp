<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>POS</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/glyphicons.less"/>">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
  <link rel="stylesheet" href="<c:url value="/resources/css/AdminLTE.min.css"/>">
  <link rel="stylesheet" href="<c:url value="/resources/css/_all-skins.min.css"/>">
  <script src="<c:url value="/resources/js/jquery-2.2.3.min.js"/>"></script>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <b>로그인</b> 
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">사용자를 선택해 주세요.</p>

    <form action="<c:url value='/loginPro'/>" method="get">
		<input type="hidden" name="csrf_token" id="csrf_token" value="7A488147A6B31057B45FA050B" />
		<input type="hidden" name="frm_action" id="frm_action" value="LOGIN" />
	      <div class="form-group has-feedback">
	      	<select  class="form-control" name="u_login" id="u_login">
	      		<option value="">아이디를 선택해 주세요.</option>
	      		<c:forEach var="stl" items="${staffList}" varStatus="status">
	      			<option value="${stl.stf_id }" data-name="${stl.stf_name}">${stl.stf_id}</option>
	      		</c:forEach>
	      		
	      	</select>
	       <!--  <input type="email" class="form-control" name="u_login" id="u_login" placeholder="Email">
	        <span class="glyphicon glyphicon-envelope form-control-feedback"></span> -->
      	</div>
      	<div class="form-group has-feedback">
        	<input type="text" class="form-control" name="u_name" id="u_name" placeholder="사용자 명" readonly="readonly" value="">
        	<span class="glyphicon glyphicon-lock form-control-feedback"></span>
      	</div>    
      	<div class="row">
	        
	        <div class="col-xs-12">
	          	<input type="submit" class="btn btn-primary btn-block btn-flat" value="확인">
	        </div>
	    </div>
    </form>
	
    
  </div>
  <div class="text-right"><small>POS</small></div>
  <!-- /.login-box-body -->
</div>
<script type="text/javascript">
	  //아이디 선택에 따른 이름값 
  	  $(function() {
	      $(document).on("change", "#u_login", function() {
		        var stf_name = $("#u_login option:selected").data("name");
		        document.getElementById('u_name').value = stf_name;
		  });
  	   });
</script>
<!-- /.login-box -->
<script src="<c:url value="/resources/js/jquery-2.2.3.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
</body>
</html>