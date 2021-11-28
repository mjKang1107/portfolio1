<%@page import="com.kmj.user.userDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 중복 확인</title>
<script type="text/javascript">
    function emailfix(){
	//이메일 사용하기 버튼 클릭시 실행
	opener.document.form.email.value = document.ofr.useremail.value;
	opener.document.form.email.readOnly = true;
	opener.document.form.email2.value = "확인완료";
	window.close();	
}
 </script>
</head>
<body>
	<% 
	  String email = request.getParameter("useremail");
	  
	  userDAO mdao = new userDAO();
	  
	  int flag = mdao.emailCheck(email);
	
	  if(flag==1){
		  out.print("이미 사용중입니다.");
	  }else{//flag ==0
		  out.print("사용가능한 이메일입니다.");
		%>
		<input type="button" value="이메일 사용하기" onclick="emailfix()";>
		<%
	  }
	%>
	<hr>
	
	<form action="joinEmailCheck.jsp" method="post" name="ofr">
	  <input type="email" name="useremail" value="<%=email%>">
	  <input type="submit" value="중복체크">
	</form>
	
</body>
</html>