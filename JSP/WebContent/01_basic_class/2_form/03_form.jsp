<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#frm label {
		display:inline-block;
		color:blue;
		width:100px;
}
#frm #addr {
		width:300px;
}
</style>
</head>
<body>
<h5>회원가입서 작성하기</h5>

<form action="result.jsp" method="post" id='frm'>
	<div>
		<label for='id'>아이디</label>
		<input type='id' name='id' id='id' placeholder='5자~10자 영어와 숫자조합' width='150'>
		<button>중복확인</button>
		<br/>
	</div>
	<div>
		<label for='password'>비밀번호</label>
		<input type='password' name='password' id='password' placeholder='4자이상 영어와 숫자조합' width='150'>
		<br/>
	</div>
	<div>
		<label for='passconf'>비밀번호확인</label>
		<input type='password' name='passconf' id='passconf' width='150'>
		<br/>
	</div>
	<div>
		<label for='irum'>이름</label>
		<input type='name' name='irum' id='irum' placeholder='한글 5자 이내' width='150'>
		<br/>
	</div>
	<div>
		<label for='phone'>전화번호</label>
		<input type='tel' name='phone' id='phone' placeholder='-없이 숫자조합' width='150'>
		<br/>
	</div>
	<div>
		<label for='addr'>주소</label>
		<input type='text' name='addr' id='addr' placeholder='20자 이내' width='300'>
		<br/>
	</div>
	<div>
		<label><input type='submit' name='submit' id='submit' value='회원가입'></label>
		<input type='reset' name='reset' id='reset' value='취소'>
		<br/>
	</div>
</form>
</body>
</html>