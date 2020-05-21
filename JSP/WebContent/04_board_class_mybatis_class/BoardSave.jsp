<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mybatis.guest.model2.*,mybatis.guest.service2.*" %>

<%
	// 0. 넘겨받는 한글 깨지지 않도록 지정
	request.setCharacterEncoding("UTF-8");
%>

<!--  1. 전 화면 입력값을 넘겨받아 BoardRec 클래스의 각 멤버필드에 지정 -->
<jsp:useBean id="board" class="mybatis.guest.model2.BoardRec">
	<jsp:setProperty name="board" property="*"/>
</jsp:useBean>
<%
	// 2. Service클래스에 write() 함수호출
	BoardService service = BoardService.getInstance();
	int articleId = service.write(board);//service.write(rec)안에 dao.insert()가 있어 F5를 누르면 db에 계속 들어감 
	
	// 3. 페이지 전환(이동) F5를 쓰면 중복으로 데이터 생성되어서
	response.sendRedirect("BoardView.jsp?articleId=" + articleId);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판글저장</title>
</head>
<body>
입력되었는지 확인해보시구염...<br/>
만일 안되어도..환장하지 맙시다 !!! ^^<br/><br/>
</body>
</html>