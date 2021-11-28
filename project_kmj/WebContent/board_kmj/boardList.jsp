<%@page import="com.kmj.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kmj.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방문후기게시판</title>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
th {
	border-bottom-style: solid;
	border-bottom-width: 2px;
	height: 40px; 
	text-align: center;
}

td {
	border-bottom-style: solid;
	border-bottom-width: 1px;
	height: 40px;
	text-align: left;
}

table {
	margin: 80px auto;
    border: none;
    box-shadow: black 10px 10px 10px;
    width: 800px;
}

h1 {
    text-shadow: black 10px 10px 10px;
}
</style>
</head>
<head>
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
   // 디비에 저장된 글의 개수를 알기
   // BoardDAO 객체 생성
   BoardDAO bdao = new BoardDAO();
   // 디비에 글의 수를 계산하는 메서드 생성 -> 호출
   // getBoardCount();
   int cnt = bdao.getBoardCount();
   
   int pageSize = 5;
   
   String pageNum = request.getParameter("pageNum");
   
   if(pageNum == null){
	   pageNum = "1";
	   
   }
  int currentPage = Integer.parseInt(pageNum);
  int startRow = (currentPage-1)*pageSize+1;
  int endRow = currentPage*pageSize;
  
  ArrayList boardList = bdao.getBoardList(startRow,pageSize);
  %>
  <h2 style="margin-top: 50px;"> 방문 후기 게시판 </h2>
  <table border="1">
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>아이디</th>
      <th>작성일</th>
      <th>조회수</th>
      <th>파일</th>
      <th>IP</th>
    </tr>
    <%
    for(int i=0; i<boardList.size(); i++){
    	 BoardBean bb = (BoardBean) boardList.get(i); 
    %>
     <tr>
      <th><%=bb.getNum() %></th>
      
      <td>
      <% 
    //답글일때만 이미지 보여주기
      int wid = 0;
      if(bb.getRe_lev()>0){
    	  wid = 15 * bb.getRe_lev();
      %>
      <img src="level.gif" height="15" width="<%=wid%>">
      <img src="notes.png" height="20" width="20">
      <%
      }
      %>
      <a href="content.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>"><%=bb.getSubject() %></a>
      </td>
      <td><%=bb.getId() %></td>
      <td><%=bb.getDate() %></td>
      <td><%=bb.getReadcount() %></td>
      <%if(bb.getFile()!=null){ %>
      <td><%=bb.getFile() %></td>
      <%}else{%>
      <td></td>
      <%}%>
      <td><%=bb.getIp() %></td>
    </tr>
    <%
    }
    %>
  </table>
<script type="text/javascript">
function loginck()
{
	var id="<%=id%>"; 

	if(id == "null")
		{
			alert("글쓰기 권한이없습니다. 로그인을 해주세요!");
			location.href="/project_kmj/user_kmj/loginForm.jsp";
		}
	else
		{
			location.href="writeForm.jsp";
		}
}
</script>
  <input type="button" value="글쓰기" onclick="loginck()">
  <%
  //페이징 처리- 하단부 페이지 링크 
  if(cnt != 0){//글이 있을때 표시
		//전체 페이지수 계산
		//ex) 총 50개 -> 한페이지당 10개 출력, 5개
		//    총 57개 -> 		"		  , 6개
		int pageCount = cnt/pageSize+(cnt % pageSize == 0? 0:1);
	 
		//한 화면에 보여줄 페이지 번호의 개수 (페이지 블럭)
	  	int pageBlock = 2;
		
		// 페이지 블럭의 시작페이지 번호
		// ex) 1~10페이지 : 1, 11~20페이지 : 11 , 21~30페이지 : 21
		int startPage = ((currentPage-1)/pageBlock)* pageBlock + 1; //외워라.. 
		
		// 페이지 블럭의 끝 페이지 번호
		int endPage = startPage + pageBlock -1;
		
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		//이전버튼(해당 페이지블럭의 첫번째 페이지 호출)
		if(startPage > pageBlock){
			%>
			<a href="boardList.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
			<%
		}
		//숫자1...5버튼
		for(int i=startPage; i<=endPage; i++){
			%>
			<a href="boardList.jsp?pageNum=<%=i %>">[<%=i %>]</a>
			<% 
		}		
		//다음버튼(기존의 페이지 블럭보다 페이지의 수가 많을때)
		if(endPage < pageCount){
			%>
			<a href="boardList.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
			<%
		}	
  }
  %>
	<!-- 푸터들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp"/>
	<!-- 푸터들어가는 곳 -->
</body>
</html>