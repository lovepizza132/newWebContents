<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc2.board.model.*" %>
<% String projectName = "/JSP"; %> 

<%
//Control에서 param에 저장한 mList 변수에 지정
	int aid = (int)request.getAttribute("aid"); //getAttribute는 object로 넘어와서 형변환을 해줘야한다.
%>

<%	
	// 3. 페이지 전환(이동) F5를 쓰면 중복으로 데이터 생성되어서
// 	response.sendRedirect("BoardViewMvc.jsp?id="+articleId);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판글저장</title>
</head>
<body>
<a href="<%=projectName%>/BoardControl?cmd=view-page&aid=<%=aid %>">눌러서 확인하세요</a>
</body>
</html>