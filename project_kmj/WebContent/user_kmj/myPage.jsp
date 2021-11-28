<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<link href="../css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- 헤더들어가는 곳 -->
  <jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<%
			String id = (String) session.getAttribute("id");
			
%>
<div style="margin-top: 130px;">
<h3><a href="/project_kmj/user_kmj/userInfo.jsp">회원 정보 조회</a></h3>

<h3><a href="/project_kmj/user_kmj/modifyForm.jsp">회원 정보 수정</a></h3>

<h3><a href="/project_kmj/user_kmj/deleteForm.jsp">회원 탈퇴</a></h3>

<a href='main.jsp'><img src="back.png" alt="back" width="100" height="50"></a>
</div>

<%
		if (id != null) {
			if (id.equals("admin")) {
				if (id != null && id.equals("admin"))
	%>
	<br><br>
	<input type="button" value="회원리스트(관리자메뉴)" onclick="location.href='list.jsp';">	
	<%
		}
	}
	%>
	
 <!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->

</body>
</html>