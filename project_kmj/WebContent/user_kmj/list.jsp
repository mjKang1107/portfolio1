<%@page import="com.kmj.user.userBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kmj.user.userDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>목록 조회(관리자 모드)</title>
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

</style>

</head>
<body>

<h2> 회원 목록 (관리자 모드)</h2>

<%

String id =(String) session.getAttribute("id");

if(id == null || !id.equals("admin")){
	response.sendRedirect("loginForm.jsp");
	
}

request.setCharacterEncoding("utf-8");

userDAO udao = new userDAO();
ArrayList arr = udao.userList();

%>

<table style="margin: 0 auto; border: none;">
<tr>
	<th>아이디</th>
	<th>비밀번호</th>
	<th>이름</th>
	<th>이메일</th>
	<th>연락처</th>
	<th>주소</th>
	<th>생일</th>
	<th>성별</th>
	<th>가입날짜</th>
	
<% 
for(int i =0; i<arr.size(); i++){
	userBean ub = (userBean) arr.get(i);
	%>	
	<tr>
		<td><%=ub.getId() %></td>
		<td><%=ub.getPw() %></td>
		<td><%=ub.getName() %></td>
		<td><%=ub.getEmail()%></td>
		<td><%=ub.getPhone() %></td>
		<td><%=ub.getAddress() %></td>
		<td><%=ub.getBirth() %></td>
		<td><%=ub.getGender() %></td>
		<td><%=ub.getRegdate()%></td>
	</tr>
	<%
}

%>
</table>
<br>
<a href='myPage.jsp'><img src="back.png" alt="back" width="100" height="50"></a>

</body>
</html>