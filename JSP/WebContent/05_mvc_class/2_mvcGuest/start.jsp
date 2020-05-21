<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% String projectName = "/JSP"; %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title h
ere</title>
</head>
<body>

<a href = '<%=projectName%>/05_mvc_class/1_mvcSimple/simpleView.jsp'>기본방식</a><hr/>
<a href = '/JSP/05_mvc_class/1_mvcSimple/simpleView.jsp'>기본방식</a><hr/>

<a href = '<%=projectName%>/SimpleControl'>MVC방식</a><hr/>
<a href = '<%=projectName%>/sc'>MVC방식</a><hr/>
<a href = '<%=projectName%>/kosmo.ksm'>MVC방식</a><hr/>
<a href = '<%=projectName%>/kosmo.do'>MVC방식</a><hr/>
</body>
</html>