<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mybatis.guest.model.*" %>  
<%@ page import="mybatis.guest.service.*" %>  
<%
	String cNo = request.getParameter("commentNo");
	int result = CommentService.getInstance().deleteComment(cNo);
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	방명록 삭제가 완료되었습니다.</br>
	<a href="listComment.jsp">목록으로 돌아가기</a>
</body>
</html>