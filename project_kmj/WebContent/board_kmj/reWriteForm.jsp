<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>답글작성하기</title>
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
	int re_ref = Integer.parseInt(request.getParameter("re_ref"));
	int re_lev = Integer.parseInt(request.getParameter("re_lev"));
	int re_seq = Integer.parseInt(request.getParameter("re_seq"));
	
	%>
	<fieldset>
		<form action="reWritePro.jsp" method="post">
		<input type="hidden" name="num" value="<%=num%>">
		<input type="hidden" name="re_ref" value="<%=re_ref%>">
		<input type="hidden" name="re_lev" value="<%=re_lev%>">
		<input type="hidden" name="re_seq" value="<%=re_seq%>">
		글쓴이 : <input type="text" name="id" value="<%=session.getAttribute("id")%>" readonly="readonly"><br>
		제목 : <input type="text" name="subject" value="[답변]"><br>
		내용 : <textarea rows="10" cols="30" name="content"> </textarea>
		<hr>
		<input type="submit" value="답글쓰기">
		<input type="reset" value="취소">
		</form>
	</fieldset>
</body>
</html>