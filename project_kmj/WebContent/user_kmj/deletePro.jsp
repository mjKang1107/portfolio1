<%@page import="com.kmj.user.userDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴</title>
<link href="../funweb/css/default.css" rel="stylesheet" type="text/css">
<link href="../funweb/css/front.css" rel="stylesheet" type="text/css">
</head>
<body>
	<% 
	String id =(String) session.getAttribute("id");
	
		if(id == null){
		response.sendRedirect("loginForm.jsp");	
		}
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="ub" class="com.kmj.user.userBean"/>
	<jsp:setProperty property="*" name="ub"/>
	<%
	
		System.out.println("삭제 회원정보 : " + ub);
	
		// 메서드 생성 -> 호출
			userDAO udao = new userDAO();
			int flag = udao.delete(ub);
		
			if(flag == 1){
				session.invalidate();
				response.sendRedirect("main.jsp");
			}else if(flag == 0){
				//비밀번호 다름 => 오류(페이지 뒤로 이동)
				%>	
				<script type="text/javascript">
				alert("비밀번호가 맞지 않습니다.");
				history.back();
				</script>
				<% 
			}else{
			//아이디가 없는 경우 => 오류(페이지 뒤로 이동)
			%>
			<script type="text/javascript">
			alert("아이디 없음!");
			history.back();
			</script>
			<%
			}
			%>
	
</body>
</html>