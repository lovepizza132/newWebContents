<!-- 파일형식
	일반웹 용어: mime-type = jsp: contetnt type 
	mime은 클라이언트에게 보여주는 타입
-->

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> MIME 타입 </title>
</head>
<body>
	기본적으로 다른 응용 프로그램 실행하기<br><br>
	<a href="03_MimeSecond.jsp"> HTML 파일  </a><br><br><br>
	<a href="03_MimeSecond.jsp?type=word"> WORD  파일 </a><br><br><br>
	<a href="03_MimeSecond.jsp?type=excel"> EXCEL  파일 </a> <br><br><br>
</body>
</html>
