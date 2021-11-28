<%@page import="com.kmj.user.userDAO"%>
<%@page import="com.kmj.user.userBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 조회</title>
<style type="text/css">
* {
	text-align: center;
}

th {
	border-bottom-style: solid;
	border-bottom-width: 2px;
	height: 30px;
}

td {
	border-bottom-style: solid;
	border-bottom-width: 1px;
	height: 30px;
}

table {
	margin: 80px auto;
    border: none;
    box-shadow: black 10px 10px 10px;
    width: 500px;
}

h1 {
    text-shadow: black 10px 10px 10px;
}
</style>
</head>
<body>
	<h1>회원 정보 조회</h1>
	<%
	String id = (String) session.getAttribute("id");
	
	if(id == null){
		response.sendRedirect("loginForm.jsp");
	}
	
	userDAO udao = new userDAO();
	
	userBean ub = udao.userInfo(id);
	
	
	%>
	<table>
		<tr>
			<td>아이디</td>
			<td><%=ub.getId() %></td>
		</tr>
		
		<tr>
			<td>비밀번호</td>
			<td><%=ub.getPw() %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=ub.getName() %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=ub.getEmail() %></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td><%=ub.getPhone() %></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=ub.getAddress() %></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><%=ub.getBirth() %></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><%=ub.getGender() %></td>
		</tr>
		<tr>
			<td>회원가입일</td>
			<td><%=ub.getRegdate() %></td>
		</tr>
	
	</table>
	
<a href='myPage.jsp'><img src="back.png" alt="back" width="100" height="50" ></a>

</body>
</html>