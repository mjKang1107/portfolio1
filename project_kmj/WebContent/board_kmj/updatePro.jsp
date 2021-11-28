<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.kmj.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글 수정</title>
</head>
<body>
	
	<%
	//한글처리	
	request.setCharacterEncoding("utf-8");
	
	//주소줄에 전달되는 pageNum값 저장
	String pageNum = request.getParameter("pageNum");

    String path = "C:/Users/MJKang/workspace/project_kmj/WebContent/upload";
    
    System.out.println("파일저장되는 실제 경로 : "+path);
    
    int maxSize = 10 * 1024 * 1024;
    
    // 파일 업로드 => Multipart객체를 생성
    MultipartRequest multi 
       = new MultipartRequest(
     		  request,
     		  path,
     		  maxSize,
     		  "UTF-8",
     		  new DefaultFileRenamePolicy()
     		  );	
    
    System.out.println(" 파일 업로드 완료! ");
   
    String id = multi.getParameter("id");
    String subject = multi.getParameter("subject");
  	String content = multi.getParameter("content");
  	int num = Integer.parseInt(multi.getParameter("num"));
    
    String filename = multi.getFilesystemName("filename");
	%> 
	<jsp:useBean id="bb" class="com.kmj.board.BoardBean"/>
	<%
		bb.setId(id);
	 	bb.setSubject(subject);
	 	bb.setContent(content);
	 	bb.setFile(filename);
	 	bb.setNum(num);
	%>
	
	<%	
	System.out.println("수정할 정보: " +bb);
	
	BoardDAO bdao = new BoardDAO();
	if(filename!=null){
		bdao.updateFileBoard(bb); 
	}
	else
	{
		bdao.updateBoard(bb);
	}
	%>
		<script type="text/javascript">
			alert("정상적으로 수정이 되었습니다.");
			location.href="boardList.jsp?pageNum=<%=pageNum%>";
		</script>
</body>
</html>