<%@ page import="mybatis.guest.service2.*, mybatis.guest.model2.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="rec" class="mybatis.guest.model2.BoardRec">
	<jsp:setProperty name="rec" property="*"/>
</jsp:useBean>

<%
	// 1. 부모게시물의 게시번호를 넘겨받기
	String parentId = request.getParameter("parentId");	
	// 2. Service에 reply() 호출하여 답변글 등록하기
	BoardRec reRec = BoardService.getInstance().reply(parentId, rec);

%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 답변 글 저장하기 </title>
</head>
<body>

답변글을 등록하였습니다. <br/><br/>

<a href="BoardList.jsp"> 목록보기 </a> &nbsp;
<a href="BoardView.jsp?articleId=<%=reRec.getArticleId()%>"> 게시글 읽기 </a>

</body>
</html>