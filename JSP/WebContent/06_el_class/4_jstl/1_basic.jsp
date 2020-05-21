<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- directice tag @ 의 종류
	: page(import할 때 사용) / include(header랑 footer 사용할 때) / taglib -->    
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %> <!-- library 연결 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 변수 선언 -->
	<c:set var='gender' value='male'></c:set>
	
	<c:if test="${gender eq 'male' }"> 당신은 남정네</c:if>
	<c:if test="${gender eq 'female' }"> 당신은 여인네</c:if><br/>
	
	<c:set var='age'>17</c:set> <%-- c:tag안에 값을 넣어도 되고 value안에 값을 넣어도 됨 --%>
	<c:if test="${age ge 20}"> 당신은 성인맨</c:if><br/>
	
	<c:choose><%-- switch와 같은 역할 --%>
		<c:when test="${age lt 10 }">어린이</c:when>
		<c:when test="${age ge 10 and age lt 20}">청소년</c:when>
		<c:otherwise>어른</c:otherwise>
	</c:choose><br/>
	
<c:forEach var='i' begin="1" end='100'>
   <c:set var='sum' value='${sum+i}'></c:set>
</c:forEach>
1~100까지 합: ${sum} <hr/>

<c:forEach var='i' begin="1" end='100'>
   <c:if test="${i%2==1 }">
   		<c:set var='odd' value='${odd+i}'></c:set>	
	</c:if>
	<c:if test="${i%2==0 }">
   		<c:set var='even' value='${even+i}'></c:set>	
	</c:if>
</c:forEach>
1~100까지 홀수의 합: ${odd}<hr/>
1~100까지 짝수의 합: ${even}<hr/>
</body>
</html>