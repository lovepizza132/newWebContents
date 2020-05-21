<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>


<%	
// 	InfoBean bean = new InfoBean();
// 	bean.setName(request.getParameter("name"));
// 	bean.setId(request.getParameter("id"));
%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bean" class="info.beans.InfoBean">
	<jsp:setProperty name="bean" property="name"/> <!-- input태그에서의 name과 bean클래스의 property를 똑같이 해놓는다면 property="*"을 사용해 한번에 처리가능~  -->
	<jsp:setProperty name="bean" property="id"/>
</jsp:useBean>

<!DOCTYPE html>
<html>
<body>
	<h2>  당신의 신상명세서 확인 </h2>
	이   름  : <%= bean.getName() %><br/>
	주민번호 : <jsp:getProperty property="id" name="bean"/><br/>
	성  별   : <jsp:getProperty property="gender" name="bean"/><br/>  <!-- 이름을 맞춰놔서 gender에서 getGender를 가져옴 -->
	맞습니까????
</body>
</html>