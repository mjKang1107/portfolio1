<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이스케이프룸 : 로그인</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
 <script type="text/javascript">
 	var prePage = document.referrer;
 </script>
</head>
<body>
<%	
		String id = (String)session.getAttribute("id");
		if(id != null){
			response.sendRedirect("../user_kmj/main.jsp");
		}		
%>
	<div id="wrap">
		<!-- 헤더들어가는 곳 -->
		<header>
			<jsp:include page="../inc/top.jsp" />
		</header>


		<!-- 본문들어가는 곳 -->
		<!-- 본문메인이미지 -->
		<div id="sub_img_member"></div>
		<!-- 본문메인이미지 -->
		<!-- 왼쪽메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="/project_kmj/user_kmj/joinForm.jsp">Join us</a></li>
				<li><a href="/project_kmj/user_kmj/main.jsp">Home</a></li>
			</ul>
		</nav>
		<!-- 왼쪽메뉴 -->
		<!-- 본문내용 -->
		<article>
			<header>
				<h1>잊지 못할 추억을 만드세요!</h1>
			</header>
			<form action="loginPro.jsp" method="post" id="join" name="join">
				<fieldset>
					<legend>Login Info</legend>
					<label>User ID</label> 
					<input type="text" name="id" id="id" placeholder="아이디" required>
					<input type="hidden" name="prePage"> <br>
					<label>Password</label> 
					<input type="password" name="pw" id="pw" placeholder="비밀번호" required><br>
				</fieldset>
				<div class="clear"></div>
				<div id="buttons">
					<input type="submit" value="로그인"> 
					<input type="button" value="회원가입" onclick="location.href='joinForm.jsp';">
				</div>
			</form>
		</article>
		<!-- 본문내용 -->
		<!-- 본문들어가는 곳 -->

		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터들어가는 곳 -->
	</div>
<script type="text/javascript">
document.join.prePage.value = prePage;
</script>	

</body>
</html>