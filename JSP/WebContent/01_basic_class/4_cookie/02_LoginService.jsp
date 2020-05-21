<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="temp.*" %>
<!DOCTYPE html>
<html>
<head>
<title> 로그인확인 </title>
</head>
<body>
<%

	
	// 이전화면 폼에서 넘겨받는 값
	String user = request.getParameter("User");
	String pass = request.getParameter("Pass");
	
	// 넘겨받은 값을 vo에 저장
	TempVO vo = new TempVO();
	vo.setId(user);
	vo.setPassword(pass);

	// DAO에 vo값을 넘김
	TempDAO dao = TempDAO.getInstance();
	boolean success = dao.login(vo);
	
	// 실제로는 DB에서 가져와야하는 값
// 	String saveUser = "lovepizza132";
// 	String savePass = "1234";
	
	// user, password가 같을 때 로그인 성공, 그렇지 않으면 로그인 실패
	if(success){
		
		//#############
		// 1. 쿠키생성
		Cookie c = new Cookie("login", user);
		
		// 2. 쿠키속성 지정 ( 선택 )
// 		c.setMaxAge(1*60*5);
		// 3. 응답으로 쿠키전송
		response.addCookie(c);
%>
					
	<h2> <%= user %>님, 성공적으로 로그인하셨슴다...</h2>
	<p> <a href="02_MainPage.jsp"> 들어가기 </a>

<%
	} else {

%>

	<h2> 로그인에 실패했슴다...</h2>
	<p> <a href="02_LoginForm.jsp"> 되돌아가기 </a>

<%
	}			
%>
	
</body>
</html>