<%@page import="com.kmj.user.userDAO"%>
<%@page import="com.kmj.user.userBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
<link href="../css/main.css" rel="stylesheet" type="text/css">
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
<script type="text/javascript">

function winopen2(){
	if(document.form.email.value == ""){
		alert("이메일을 입력하세요.");
		document.form.email.focus();
		return;
	}	
	var useremail = document.form.email.value;
	
	window.open("joinEmailCheck.jsp?useremail="+useremail,"","width=400,height=300");  	
}

</script>

</head>
<body>

<%
	String id =(String) session.getAttribute("id");

	if(id == null){
		response.sendRedirect("loginForm.jsp");
		
	}
	userDAO udao = new userDAO();
	userBean ub = udao.userInfo(id);
/* 
	String DRIVER ="com.mysql.jdbc.Driver";
	String DBURL = "jdbc:mysql://localhost:3306/project_kmj";
	String DBID = "root";
	String DBPW = "1234";
	
	Class.forName(DRIVER);
	System.out.println("드라이버 로드 성공");
	
	Connection conn = DriverManager.getConnection(DBURL, DBID, DBPW);
	
	String sql ="select * from user_kmj where id =? ";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, id);
	
	ResultSet rs = pstmt.executeQuery();
	
	userBean ub = null;
	if(rs.next()){
		ub = new userBean();
			ub.setId(rs.getString("id"));
			ub.setPw(rs.getString("pw"));
			ub.setName(rs.getString("name"));
			ub.setEmail(rs.getString("email"));
			ub.setPhone(rs.getString("phone"));
			ub.setAddress(rs.getString("address"));
			ub.setBirth(rs.getString("birth"));
			ub.setGender(rs.getString("gender"));
			ub.setRegdate(rs.getTimestamp("regdate"));
			
			System.out.println("저장된 회원정보 : " +ub);
	} */
	
%>
  <fieldset>
    <legend> 정보 수정하기 </legend>
    <% if(ub != null) {%>
    <form action="modifyPro.jsp" method="post" name="form">
   
      아이디 : <input type="text" name="id" value="<%=ub.getId()%>" readonly="readonly"><br>
      비밀번호 : <input type="password" name="pw" placeholder="비밀번호를 입력하세요." required="required"><br>
      <hr>
      이름 : <input type="text" name="name" value="<%=ub.getName()%>"><br>
      이메일  : <input type="email" name="email" value="<%=ub.getEmail()%>">
      <input type="button" value="중복체크" class="dup" onclick="winopen2();"><br>
      연락처 : <input type="text" name="phone" value="<%=ub.getPhone()%>"><br>
      주소 : <input type="text" name="address" value="<%=ub.getAddress()%>">
    <input type="button" class="btn btn-warning" value="수정하기" onclick="location.href='m_addressForm.jsp';"><br> 
      생일 : <input type="date" name="birth" value="<%=ub.getBirth()%>"><br>   
      성별 : <input type="radio" name="gender" value="남"
        <% 
         if(ub.getGender().equals("남")){
        	 %>
        	 checked="checked"
        	 <%
         }
        %>        
      > 남
      <input type="radio" name="gender" value="여"
         <% 
         if(ub.getGender().equals("여")){
        	 %>
        	 checked
        	 <%
         }
        %>   
      > 여  <br>    
     <hr>
     <input type="submit" value="수정 완료"> 
     <input type="reset" value="취소">    
     <input type="button" value="뒤로가기" 
                 onclick="location.href='myPage.jsp';" >      
    </form>  
    <% } %>
  </fieldset>
  


</body>
</html>