<%@page import="com.kmj.user.userDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		if (id == null) {
			response.sendRedirect("loginForm.jsp");
		}
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="ub" class="com.kmj.user.userBean"/>

	<jsp:setProperty property="*" name="ub" />
	<%
	// 메서드 생성 -> 호출
		userDAO udao = new userDAO();
		int flag = udao.modify(ub);
		
		if(flag == 1){
		response.sendRedirect("myPage.jsp");
			
		}else if(flag == 0){
				//비밀번호 다름 => 오류(페이지 뒤로 이동)
				%>
			<script type="text/javascript">
				alert("비밀번호를 다시 입력해주세요!");
				history.back();
			</script>
				<% 	
		}
	%>
</body>
</html>