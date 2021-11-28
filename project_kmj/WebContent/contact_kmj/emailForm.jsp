<%@page import="com.kmj.user.userBean"%>
<%@page import="com.kmj.user.userDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의 메일</title>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>

 <!-- 헤더들어가는 곳 -->
  <jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->
<br><br><br><hr>

<%	
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
		}					
%>

<%
request.setCharacterEncoding("UTF-8");

userBean ub = new userBean();
ub.setId(id);
userDAO ud = new userDAO();
ud.email(ub);

%>
<!-- 로그인 확인 로직 -->
<script type="text/javascript">
function loginck4() {
	var id="<%=id%>"; 

	if(id == "null")
		{
			alert("로그인을 해주세요!");
			location.href="/project_kmj/user_kmj/loginForm.jsp";
		}
	else
		{
			document.email.submit();
		}
}

<!-- 로그인해서 들어가면 가입할때 작성한 이메일로 받을 수 있음 -->
</script>
   <div class="bd">
         <form name="email" method="post" action="/project_kmj/contact_kmj/emailPro.jsp"><br><br>
            <label>E-mail : </label>
               <input type="email" name="receiver" value="<%=ub.getEmail() %>" readonly="readonly"><br><br>
         <input type="button" onclick="loginck4()" value="메일받기">
      </form>
   </div>
   <!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</body>
</html>