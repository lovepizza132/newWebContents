<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 1. 이전 화면에서의 폼의 입력값들을 얻어와라 -->    
<%
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String occupation = request.getParameter("occupation");
	String hobby[] = request.getParameterValues("hobby");
	String hstr = "";
	for(int i=0; hobby!=null && i<hobby.length; i++){ //&&연산시 앞에거가 충족되지 않으면 뒤에것은 작동되지 않음
		hstr += hobby[i] + "/";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 2. 얻어온 입력값들을 출력 -->    
	회원 이름: <%= name %>		<br/>
	성별: <%= gender %>		<br/>
	직업: <%= occupation %>	<br/>
	취미: <%= hstr %>			<br/>
	
	<%--  <% if(hobby!=null){%>
		<% for(int i=0; i<hobby.length; i++){%>
				<%= hobby[i]%>
		<% } //end of for%> 
	<% } // end of if %> <br/> --%>
</body>
</html>