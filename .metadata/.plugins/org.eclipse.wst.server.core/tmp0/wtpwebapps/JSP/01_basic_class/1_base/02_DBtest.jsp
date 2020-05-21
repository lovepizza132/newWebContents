<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ page errorPage="02_NormalErrorPage.jsp" %> <%-- 이렇게 각 페이지 마다 지정하지 않고 탐캣의 설정파일에서 1번만 지정한다. 무언가가 잘못되면 저 페이지를 뜨게 해줌 --%>


<!-- 파일형식
	일반웹 용어: mime-type = jsp: contetnt type 
-->
<%
	// 1. 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@192.168.0.19:1521:orcl";
	String user = "scott";
	String pass = "tiger";
	// 2. 연결객체 얻어오기
	Connection con = DriverManager.getConnection(url, user, pass);
	// 3. sql 문장 만들기
	String sql = "SELECT * FROM emp2";
	// 4. 전송 객체 얻어오기
	PreparedStatement st = con.prepareStatement(sql);
	// 5. 전송
	ResultSet rs = st.executeQuery();
%>


<!DOCTYPE html>
<html><head><title> 디비 테스트 </title>
</head>
<body>
 
<div align=center>
<table border=2 cellSpacing=3>

  <tr class="title">
    <td>사번</td>
    <td>사원명</td>
    <td>업무</td>
    <td>관리자사번</td>
    <td>입사일</td></tr>

	<% while(rs.next()){ %>
	  <tr>
		<td><%= rs.getInt("EMPNO") %></td>
		<td><%= rs.getString("ENAME") %></td>
		<td><%= rs.getString("JOB") %></td>
		<td><%= rs.getString("MGR") %></td>
		<td><%= rs.getString("HIREDATE") %></td>
	  </tr>
	<% } //endof while %> 

</table>
</div>
</body>
</html>
