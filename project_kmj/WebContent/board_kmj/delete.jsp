<%@page import="com.kmj.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글 삭제</title>
</head>
<body>  
  
    <%
     // 전달정보 저장 - pageNum
     String pageNum = request.getParameter("pageNum");
     String id = (String)session.getAttribute("id");
    %>
    <jsp:useBean id="bb" class="com.kmj.board.BoardBean"/>
    <jsp:setProperty property="*" name="bb"/>
    
    <%
      //BoardDAO 객체 생성
      // -> 글정보를 사용해서 글 삭제 기능(메서드) deleteBoard(bb)
      	BoardDAO bdao = new BoardDAO();
      
     	bdao.deleteBoard(bb,id);
     	
      if(id.equals(bb.getId())){
     %>
    	 <script type="text/javascript">
    	    alert("정보 삭제완료! ");
    	    location.href="boardList.jsp?pageNum=<%=pageNum%>";
    	 </script>
    <%
      }else{
    %>
    	 <script type="text/javascript">
    	    alert("아이디가 일치하지않습니다! ");
    	  history.back();
    	 </script>
    <% 
      }
    %>
</body>
</html>