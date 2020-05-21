<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>		


<%	
	// 1. Cookie 객체 생성
	Cookie c = new Cookie("jeong","asdf");
	// 2. 속성 부여
	c.setMaxAge(1*60*5); // 초단위
	// 3. 클라이언트에 쿠키 전송
	response.addCookie(c); // 웹서버에서 웹브라우저로 쿠키를 보낸다~
%>

<html>
<head><title>쿠키</title></head>
<body>

<b>Simple Cookie Example</b><hr>

<br><a href="01_GetCookie.jsp"> 쿠키검색 </a>

</body></html>