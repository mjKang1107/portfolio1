<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글작성하기</title>
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
<%
	request.setCharacterEncoding("utf-8");
%>
<body>
	<fieldset>
		<form action="writePro.jsp" method="post" enctype="multipart/form-data">
		글쓴이 : <input type="text" id="id" name="id" value="<%=(String)session.getAttribute("id") %>"readonly><br>  
		제목 : <input type="text" name="subject"><br>
		내용 : <textarea rows="10" cols="30" name="content"> </textarea><br><br>
		<input type="file" name="filename">
		<hr>
		<br>
		<input type="submit" value="글쓰기">
		<input type="reset" value="취소">     
		</form>
		</fieldset>
</body>
</html>