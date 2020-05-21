<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.beans.*" %>
<%
	String id = request.getParameter("userId");
	MemberDao dao = MemberDao.getInstance();
	

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 아이디 중복 확인 </title>
</head>
<body>
<%
	if(dao.isDuplicatedId(id)) {
%>
		사용중인 아이디가 있습니다. 다시 입력하여 주십시오.
<%  }else { %>
		사용할 수 있는 아이디입니다.
<%  } %>

<form name='frm2' action=""> <!-- form action을 부여하지 않으면 자기자신이 실행 됨 -->
	<input type="text" name="userId" value='<%=id%>'>
	<input type="submit" value="중복확인">
	<input type="button" value="아이디채택">
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$("form input:eq(2)").click(function(){
		$(opener.document).find('form input:eq(0)').prop('value', $('form input:eq(0)').val()); //input은 원래 value가 있으므로 val 사용 나머지는 attr or prop사용
		window.close();
	});
// 	attr('바꾸고 싶은 속성', '바꿀 내용');
</script>
</body>
</html>