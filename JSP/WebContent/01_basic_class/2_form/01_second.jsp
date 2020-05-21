<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 클라이언트-> 서버: request(요청)
	  서버-> 클라이언트: response(응답) -->    
<%@ page import="temp.*" %>
<%
	String user = request.getParameter("User");
	String pass = request.getParameter("Pass");
	
	// 1. TempVO 객체에 멤버로 위의 값들을 지정
	TempVO vo = new TempVO();
	vo.setId(user);
	vo.setPassword(pass);
	// 2. TempDAO의 login()호출하기
	TempDAO dao = TempDAO.getInstance();
	boolean success = dao.login(vo);
	String str = "";
	if(success){
		str="일치합니다.";
	}else{
		response.sendRedirect("01_first.jsp");
	}
	
// 	if(!succcess){
// 		response.sendRedirect("01_first.jsp");
// 	}

%> 
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 폼의 입력값 처리 </title>
</head>
<body>
	<h2>폼의 입력값 넘겨받아 처리</h2>
	<!--  3. 결과에 의해 로그인 성공여부 출력 -->
	<div>아이디와 비밀번호가 <%= str%></div>
</body>
</html>