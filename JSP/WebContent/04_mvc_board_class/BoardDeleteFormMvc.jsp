<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc2.board.model.*" %>

<% String projectName = "/JSP"; %>
<%
	// 1. 삭제할 레코드의 게시글번호 넘겨받기
	String aid = request.getParameter("id");	
%>      
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 게시글 삭제하기 </title>
</head>
<body>

<form method="post" action="<%=projectName%>/BoardControl?cmd=delete-page">
	삭제할 글암호를 입력하세요 <br/>
	<input type="hidden" name="articleId" value="<%=aid%>">
	<input type="password" name="password">
	<!-- 게시글번호를 다음 페이지로 넘기기 위해 hidden 태그로 지정 -->
	<input type="submit" value="삭제하기">
</form>

</body>
</html>