<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소 수정하기</title>
</head>
<body>

<%

request.setCharacterEncoding("utf-8");
String addr = "(" + request.getParameter("post") + ")" + request.getParameter("address") + request.getParameter("address2");

String id = (String)session.getAttribute("id");



 // 디비연결 필요정보 
     String DRIVER = "com.mysql.jdbc.Driver";
     String DBURL = "jdbc:mysql://localhost:3306/project_kmj";
     String DBID ="root";
     String DBPW ="1234";
     
     // 1 드라이버로드
     Class.forName(DRIVER);
     System.out.println(" 드라이버 로드 성공 ! ");
     
     // 2 디비연결
     Connection conn = 
     DriverManager.getConnection(DBURL, DBID, DBPW);     
      
     // 3 sql, pstmt 
     String sql = "update user_kmj set address=? where id=?";
     
     PreparedStatement pstmt = conn.prepareStatement(sql);
     
     // ?
     pstmt.setString(1, addr);
     pstmt.setString(2, id);		 
    
     // 4 실행
     pstmt.executeUpdate();
     
     response.sendRedirect("modifyForm.jsp");
 %>

</body>
</html>