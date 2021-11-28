<%@page import="com.kmj.user.userDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">

</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String prePage = request.getParameter("prePage");
	System.out.println(prePage);
	%>
	<jsp:useBean id="ub" class="com.kmj.user.userBean"/>
	<jsp:setProperty property="*" name="ub"/>
	
	<% 
  
	 // 메서드 생성 -> 호출
	 userDAO udao = new userDAO();
	int flag = udao.login(ub);
		
	if(flag == 1){	
		session.setAttribute("id", ub.getId());
		if(prePage == ""){
			%>
			<script type="text/javascript">
			alert("환영합니다!");
			location.href="main.jsp";
			</script>
		<%
		}else{
			
			%>
			<script type="text/javascript">
			alert("환영합니다!");
			location.href="<%=prePage%>";
			</script>
		<% 
		}
		
	  }else if(flag == 0){
		 //비밀번호 다름(+회원이다)
		  %>
		  <script type="text/javascript">
		  alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
		  history.back();
		  </script>
		  <% 
	 }else{
	  //비회원이다.
	  %>
	  <script type="text/javascript">
	  //confirm("회원정보가 없습니다.회원가입하겠습니까?");
	 var result = confirm("회원정보가 없습니다.회원가입하겠습니까?");
	  
	  if(result){
		  alert("회원가입 페이지로 이동합니다");
		  location.href = "joinForm.jsp";
		  
	  }else{
		  history.back();
	  } 
	  </script>
	  <%  
  }  
	%>
	
</body>
</html>