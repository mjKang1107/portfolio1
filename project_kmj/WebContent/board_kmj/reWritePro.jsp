<%@page import="com.kmj.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 답글</title>
</head>
<body>
	<%
	// 전달되는 파라미터값 저장
	request.setCharacterEncoding("utf-8");
	
	%>
	<jsp:useBean id="bb" class="com.kmj.board.BoardBean"/>
	<jsp:setProperty property="*" name="bb"/>
	
	<%
	System.out.println(bb);
	//글쓴이의 IP주소를 추가적으로 저장
	bb.setIp(request.getRemoteAddr());
	
	//BoardDAO 객체 생성
	BoardDAO bdao = new BoardDAO();
	
	//답글작성 메서드 - reInsertBoard(bb);
	bdao.reInsertBoard(bb);
	
	//페이지 이동 
	response.sendRedirect("boardList.jsp");	
	%>
	
</body>
</html>