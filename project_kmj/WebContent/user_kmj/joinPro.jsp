<%@page import="com.kmj.user.userBean"%>
<%@page import="com.kmj.user.userDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>회원가입</h1>
   <%
   
	String id = (String)session.getAttribute("id");
	if(id != null){
		response.sendRedirect("../user_kmj/main.jsp");
	}		
	
     // 회원가입정보를 전달받아서 저장 -> DB저장 (회원)
     
     // 한글처리 
     request.setCharacterEncoding("UTF-8");
     
    String addr = "(" + request.getParameter("post") + ")" + request.getParameter("address") + request.getParameter("address2");
     
     // 전달되는 데이터 (파라미터값 저장-자바빈(액션태그))
   %>  
   <!-- 자바빈 객체 생성 -->
   <jsp:useBean id="ub" class="com.kmj.user.userBean"/>
   <!-- 전달되는 파라미터값 저장 -->
   <jsp:setProperty property="*" name="ub"/>
  
   <% 
   // 추가적인 회원가입 날짜 저장
    ub.setRegdate(new Timestamp(System.currentTimeMillis()));
    ub.setAddress(addr);
   // 메서드 생성 -> 호출
   userDAO udao = new userDAO();
   udao.join(ub);
     
    System.out.println("객체 정보 : "+ub);
   
   %>  
   <script type="text/javascript">
     alert(" 환영합니다 ! ");
     location.href="loginForm.jsp";   
   </script>      
    
</body>
</html>