<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<!-- controller를 통해 경고창 띄워주는 뷰
	model.addAttribute("msg", "메세지"); 
	model.addAttribute("url", "링크"); 
 -->
<script type="text/javascript"> 
	var message = '${msg}'; 
	var returnUrl = '${url}'; 
	alert(mag); 
	document.location.href = url; 
</script>
</body>
</html>