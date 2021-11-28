<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방 테마</title>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%	
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
		}		
%>
<!-- 로그인 했을 경우 예약 가능 -->
<script type="text/javascript">
function loginck3() {
	var id="<%=id%>"; 

	if(id == "null")
		{
			alert("로그인을 해주세요!");
			location.href="/project_kmj/user_kmj/loginForm.jsp";
		}
	else
		{
			location.href= "booking.jsp";
		}
}
</script>
 	<!-- 헤더들어가는 곳 -->
 	<jsp:include page="../inc/top.jsp"/>
	<!-- 헤더들어가는 곳 -->
<br><br><br><hr>

			<div id="rooms">
		<ul id="featured" class="wrapper clearfix">
			<li>
				<img src="../images/pharaoh.png" alt="Img" height="400" width="210">
				<h3><a href="#">고대박물관의 비밀</a></h3>
				<p>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nec mi tortor. Phasellus commodo semper vehicula.
				</p> 
				<input type="button" value="예약하기" class="btn" onclick="loginck3()";>
			</li>
			<li>
				<img src="../images/money.jpg" alt="Img" height="400" width="210">
				<h3><a href="#">코드네임 007</a></h3>
				<p>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nec mi tortor. Phasellus commodo semper vehicula.
				</p>
				<input type="button" value="예약하기" class="btn" onclick="loginck3()";>
			</li>
			<li>
				<img src="../images/steampunk.png" alt="Img" height="400" width="210">
				<h3><a href="#">타임머신 1990</a></h3>
				<p>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nec mi tortor. Phasellus commodo semper vehicula.
				</p>
				<input type="button" value="예약하기" class="btn" onclick="loginck3()";>
			</li>
			<li>
				<img src="../images/hand.jpg" alt="Img" height="400" width="210">
				<h3><a href="#">301호의 살인사건</a></h3>
				<p>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nec mi tortor. Phasellus commodo semper vehicula.
				</p>
				<input type="button" value="예약하기" class="btn" onclick="loginck3()";>
			</li>
		</ul>
		</div>
		
	<!-- 푸터들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp"/>
	<!-- 푸터들어가는 곳 -->

</body>
</html>