<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴</title>
 <link href="../css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function delck(){
	var con_test = confirm('정말 탈퇴하실건가요?');
	
	if(con_test == true){
	  return;
	}
	else if(con_test == false){
	  return false;
	}
}
</script>

</head>
<body>

  <%

    String id = (String)session.getAttribute("id");
  
    if(id == null){
    	response.sendRedirect("loginForm.jsp");
    }

  %>
   
  <h2> 회원 탈퇴 </h2>
  <form action="deletePro.jsp" method="post" onsubmit="return delck()">
    
   <%--  아이디 : <input type="text" name="id" value="<%=id%>" readonly><br> --%>
  <input type="hidden" name="id" value="<%=id%>">  
    비밀번호 : <input type="password" name="pw" placeholder="비밀번호를 입력하세요" required="required"><br>
    <br>
    <input type="submit" value="탈퇴하기">
    <input type="reset" value="취소" >
    <hr>
    <a href='myPage.jsp'><img src="back.png" alt="back" width="100" height="50"></a>
  </form>
  
 
  
 


  
  
  
  

  
  
  
  
  
  
  
  
  
  
  
  

</body>
</html>