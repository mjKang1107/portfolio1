<%@page import="com.kmj.board.BoardBean"%>
<%@page import="com.kmj.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글 수정 </title>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
fieldset {
    float: left;
    text-align: left;
    width: 40%;
    font-size: 1.3em;
    box-shadow: black 10px 10px 100px;
    margin: 70px;
}
</style>
</head>
<body>

	<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	// DB에서 글번호에 해당하는 정보를 가져와서 출력

	//DAO 객체 생성
	BoardDAO bdao = new BoardDAO();
	//글번호에 해당하는 정보를 가져오는 메서드
	BoardBean bb = bdao.getBoard(num);
	
	%>
	<fieldset>
		<form action="updatePro.jsp?pageNum=<%=pageNum %>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="<%=bb.getNum()%>">
		글쓴이 : <input type="text" id="id" name="id" value="<%=(String)session.getAttribute("id") %>"readonly><br>  
		제목 : <input type="text" name="subject" value="<%=bb.getSubject()%>"><br>
		내용 : <textarea rows="10" cols="30" name="content"><%=bb.getContent()%></textarea><br><br>		
		<%if(bb.getRe_lev()==0){%>
		<input type="file" name="filename">	
		<%}%>
		<hr>
		<br>
		<input type="submit" value="글 수정하기">
		<input type="reset" value="취소">
		<input type="button" value="목록으로" 
                 onclick="location.href='boardList.jsp?pageNum=<%=pageNum %>';" > 
		</form>
	</fieldset>
	
	
</body>
</html>