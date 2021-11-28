<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.kmj.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글작성하기</title>
<link href="../css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
		
     String path = request.getRealPath("/upload");
     
     System.out.println("파일저장되는 실제 경로 : "+path);
     
     int maxSize = 10 * 1024 * 1024;
     
     // 파일 업로드 => Multipart객체를 생성
     MultipartRequest multi 
        = new MultipartRequest(
      		  request,
      		  path,
      		  maxSize,
      		  "UTF-8",
      		  new DefaultFileRenamePolicy()
      		  );	
   
     System.out.println(" 파일 업로드 완료! ");
   
     String id = multi.getParameter("id");
     String subject = multi.getParameter("subject");
   	 String content = multi.getParameter("content");
     
     String filename = multi.getFilesystemName("filename");
 	%> 
	<jsp:useBean id="bb" class="com.kmj.board.BoardBean"/>
	<%
		bb.setId(id);
	 	bb.setSubject(subject);
	 	bb.setContent(content);
	 	bb.setFile(filename);
	%>

 	<% 
 	System.out.println("글쓰기 정보 : " + bb.toString());
	
	bb.setIp(request.getRemoteAddr());
	
	System.out.println("글쓰기 정보 : " + bb);	

	BoardDAO bdao = new BoardDAO();
	
	bdao.insertBoard(bb); 
		//페이지 이동
	response.sendRedirect("boardList.jsp");  
    %>
    아이디 : <%=id %><br>
    제목 : <%=subject %><br>
    내용 : <%=content %><br>
    파일 : <%=filename %><br>
</body>
</html>