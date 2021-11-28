<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>top</title>
</head>
<body>
<header>

<%
			String id = (String) session.getAttribute("id");
			
			%>
		<!-- 로그인 하지 않은 상태 -->
			<% if(id == null){
			
				%>
			<div id="login">
				<a href="/project_kmj/user_kmj/loginForm.jsp">login</a>  |  <a href="/project_kmj/user_kmj/joinForm.jsp">join</a> 
			</div>
			<% 
			}else{
			%>
		<!-- 로그인한 상태 -->	
			<div id="login">
				<a href="/project_kmj/user_kmj/logout.jsp">logout</a>  |  <a href="/project_kmj/user_kmj/myPage.jsp">mypage</a>
			
			</div>
			<% 
			%>
			<br><br>
			<h2 style="color:grey; text-align: center;"><%=id%>님 이스케이프룸에 오신 것을 환영합니다!!</h2>
			<% 
			}
			%>
	
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><a href="/project_kmj/user_kmj/main.jsp"><img src="../images/logo.jpg" width="200" height="100" alt="logo"></a></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
				<ul>
					<li><a href="/project_kmj/user_kmj/main.jsp">HOME</a></li>
					<li><a href="/project_kmj/rooms_kmj/roomList.jsp">ROOMS</a></li>
					<li><a href="/project_kmj/board_kmj/boardList.jsp">BOARD</a></li>
					<li><a href="/project_kmj/contact_kmj/emailForm.jsp">CONTACT US</a></li>
					<li><a href="/project_kmj/contact_kmj/location.jsp">LOCATION</a></li>
				</ul>
</nav>
</header>
</body>
</html>