<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mybatis.guest.service.*" %>    

<%
	// 0. 넘겨받는 데이타의 한글 처리
	request.setCharacterEncoding("UTF-8");
%>
    
<!--  이전 폼의 각각의 데이터를 빈즈의 멤버로 지정  -->
<jsp:useBean id="comment" class="mybatis.guest.model.Comment">
	<jsp:setProperty name="comment" property="*"/>
</jsp:useBean>

<%
	int result = CommentService.getInstance().update(comment);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
수정이 완료 되었습니다.<a href="listComment.jsp"> 목록으로 돌아가기</a>
</body>
</html>