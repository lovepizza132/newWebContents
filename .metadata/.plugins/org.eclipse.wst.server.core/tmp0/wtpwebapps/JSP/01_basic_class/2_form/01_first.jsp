<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 클라이언트-> 서버: request(요청)
	  서버-> 클라이언트: response(응답) -->    

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title> 로그인창 </title>
<style type="text/css">
#frm label {
	display:inline-block;
	width:80px;
}
</style>
</head>
<body>

<h3>로그인 확인하기 </h3> 
<form action="01_second.jsp" method="post" id='frm'> <!-- method는 data 전송 방식 "get", "post" 사용(로그인, 파일전송 때 사용) -->
	<div>
		<label for='User'>사용자: </label>
		<input name='User' type='text'>
		<br/>
	</div>
	<div>
		<label for='Pass'>비밀번호: </label>
		<input name='Pass' type='password'>
		<br/>
	</div>
	<input type='submit' value='login'> 
</form>

</body>
</html>