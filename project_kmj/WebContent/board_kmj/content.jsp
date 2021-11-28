<%@page import="com.kmj.board.BoardBean"%>
<%@page import="com.kmj.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
* {
	text-align: center;
}

th {
	border-bottom-style: solid;
	border-bottom-width: 2px;
	height: 40px; 
}

td {
	border-bottom-style: solid;
	border-bottom-width: 1px;
	height: 40px;
}

table {
	margin: 80px auto;
    border: none;
    box-shadow: black 10px 10px 10px;
    width: 600px;
}

h1 {
    text-shadow: black 10px 10px 10px;
}
</style>
</head>
<body>
<!-- 헤더들어가는 곳 -->
  <jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->
	<%
	int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
	    // BoardDAO 객체 생성
	    BoardDAO bdao = new BoardDAO();
	    
		// 글 조회수를 1증가  (DB 처리)
		bdao.updateReadcount(num); 
		
		// DB에서 글번호(num)에 해당하 글정보를 모두 가져와서 출력	
		BoardBean bb = bdao.getBoard(num); 
	%>
	
	<%
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
		}
	%>
<script>
function delck(){
	var delck = confirm('정말 글을 삭제하시겠습니까?');
	if(delck==true)
		{
			location.href="delete.jsp?num=<%=bb.getNum() %>&pageNum=<%=pageNum %>&id=<%=bb.getId()%>";
		}
	else
		{
			return;
		}
}
</script>

<script type="text/javascript">
function loginck2() {
	var id="<%=id%>";


	if(id == "null")
		{
			alert("수정 권한이없습니다. 로그인을 해주세요!");
			location.href="/project_kmj/user_kmj/loginForm.jsp";
		}
	else if(id == "<%=bb.getId()%>") {
		location.href="updateForm.jsp?num=<%=bb.getNum() %>&pageNum=<%=pageNum %>";
	}
	else
		{
			alert("수정 권한이없습니다.");
			return false;
		}
		
}

function loginck3() {
	var id="<%=id%>"; 

	if(id == "null")
		{
			alert("답글쓰기 권한이없습니다. 로그인을 해주세요!");
			location.href="/project_kmj/user_kmj/loginForm.jsp";
		}
	else
		{
			location.href= "reWriteForm.jsp?num=<%=bb.getNum()%>&re_ref=<%=bb.getRe_ref()%>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>";
		}
}
</script>
    <table border="1">
      <tr>
        <td>글번호</td>
        <td><%=bb.getNum() %></td>
        <td>조회수</td>
        <td><%=bb.getReadcount() %></td>
      </tr>
      <tr>
        <td>글쓴이</td>
        <td><%=bb.getId() %></td> 
        <td>작성일</td>
        <td><%=bb.getDate() %></td>
      </tr>
      <tr>
        <td>글 제목</td>
        <td colspan="3"><%=bb.getSubject() %></td>
      </tr>
      <%if(bb.getFile()!=null){%>
      <tr>
        <td>첨부파일</td>
        <td colspan="3"><img src="../upload/<%=bb.getFile()%>" width="400" height="300" alt="<%=bb.getFile()%>"></td>
      </tr>
      <%}%>
       <%if(bb.getFile()!=null){%>
      <tr>
        <td>파일 다운로드</td>
        <td colspan="3"><input type="button" value="파일 다운로드" 
                 onclick="location.href='file_down.jsp?filename=<%=bb.getFile()%>';"></td>
      </tr>
       <%}%>
      <tr>
        <td>글내용</td>
        <td colspan="3"><%=bb.getContent() %></td>
      </tr>
      
      <tr>
        <td colspan="4">
          <input type="button" value="수정하기" 
                 onclick="loginck2()">
                 
          <input type="button" value="삭제하기" 
                onclick="delck()" >
                 
          <input type="button" value="답글쓰기"
          onclick="loginck3();">
          
          <input type="button" value="목록으로" 
                 onclick="location.href='boardList.jsp?pageNum=<%=pageNum %>';" >        
        </td>
      </tr>
    </table>
   <!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->

</body>
</html>