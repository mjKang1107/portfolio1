<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../funweb/css/default.css" rel="stylesheet" type="text/css">
<link href="../funweb/css/front.css" rel="stylesheet" type="text/css">
</head>
<body>
	
	<%
	
		//세션 초기화
		session.invalidate();
		
	
	%>
	
	<script type="text/javascript">
	alert("정상적으로 로그아웃 되었습니다.");
	location.href= document.referrer;
	</script>
	
</body>
</html>