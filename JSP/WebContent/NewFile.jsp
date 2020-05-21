<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- 설정할 때는 @ -->
<% String name = "홍길동"; %>
<%! String msg = "안녕하세요"; %><!-- 자바 문법 마음데로 -->
<%-- <%! %>은 멤버변수이다 .jsp에서 .java로 변환시 적용 --%>
<%-- <% %>은 지역변수이다 .jsp에서 .java로 변환시 적용 --%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 첫 JSP</title>
</head>
<body>
	여기는 JSP 입니다. <%= name%>님 <%= msg %><!-- (표현식: 끝에 ;을 쓰지 않는다)결과를 출력할때 쓰는 기호=  -->
	
	<!-- HTML 주석: 클라이언트의 웹브라우저에서 실행하지 않음 -->
	<% // java 주석 %>
	<%
		/* 자바 주석: java에서 class 변환 때 실행하지 않음 */	
	%>
	<%-- JSP 주석 --%>
</body>
</html>