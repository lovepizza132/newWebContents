<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="temp.*" %>    
<!-- 1. 사용자의 입력값을 얻어오기
		(아이디, 비밀번호, 이름, 전화번호, 주소) -->
<%
	request.setCharacterEncoding("utf-8");//한글로 먼저 변환

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("irum");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	
	TempVO vo = new TempVO();// 메모리 상에 올려놓음
	vo.setId(id);
	vo.setPassword(password);
	vo.setName(name);
	vo.setPhone(phone);
	vo.setAddr(addr);
	
	TempDAO dao = TempDAO.getInstance(); // getInstance가 static이 아니면 원래 dao.getInstance();로 사용해야한다. static은 객체가 생성되기 전에 사용 가능
	dao.insert(vo);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 2. 얻어온 입력값을 출력 -->
<table>
	<tr>
		<td>아이디: <%= id %></td>
	</tr>
	<tr>
		<td>비밀번호: <%= password %></td>
	</tr>
	<tr>
		<td>이름: <%= name %></td>
	</tr>
	<tr>
		<td>전화번호: <%= phone %></td>
	</tr>
	<tr>
		<td>주소: <%= addr %></td>
	</tr>
</table>


</body>
</html>