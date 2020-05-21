<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc2.board.model.*" %>
<%@ page import="java.util.List" %>
<% String projectName = "/JSP"; %>    

<%  //웹브라우저가 게시글 목록을 캐싱할 경우 새로운 글이 추가되더라도 새글이 목록에 안 보일 수 있기 때문에 설정
	response.setHeader("Pragma","No-cache");		// HTTP 1.0 version
	response.setHeader("Cache-Control","no-cache");	// HTTP 1.1 version
	response.setHeader("Cache-Control","no-store"); // 일부 파이어폭스 버스 관련
	response.setDateHeader("Expires", 1L);			// 현재 시간 이전으로 만료일을 지정함으로써 응답결과가 캐쉬되지 않도록 설정
	
%>
<%  
	// Control에서 param에 저장한 mList 변수에 지정
	List <BoardRec> mList = (List <BoardRec>)request.getAttribute("param"); //getAttribute는 object로 넘어와서 형변환을 해줘야한다.
	int totalPageCount = (int)request.getAttribute("page"); //getAttribute는 object로 넘어와서 형변환을 해줘야한다.
%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> 게시글 목록 </title>
</head>
<BODY>
	<h3> 게시판 목록 </h3>
	<table border="1" bordercolor="darkblue">
	<tr>
		<td> 글번호 </td>
		<td> 제  목 </td>
		<td> 작성자 </td>
		<td> 작성일 </td>
		<td> 조회수 </td>
	</tr>
	<% if( mList.isEmpty() ) { %>
		<tr><td colspan="5"> 등록된 게시물이 없습니다. </td></tr>
	<% } else { %>
		<% for(int i=0; i<mList.size(); i++) {%>
		<tr>
			<td><%=mList.get(i).getArticleId()%></td>
			<td>
			 	<%for(int j=0; j<mList.get(i).getLevel(); j++){ %>
			 		&nbsp;
			 	<%} //end of for %>
			 	<%if(mList.get(i).getLevel()!=0){%>
			 		<img src='imgs/board_re.gif'/>
			 	<%} //end of if%>
				 <a href='<%=projectName%>/BoardControl?cmd=view-page&aid=<%=mList.get(i).getArticleId()%>'>
				 <%=mList.get(i).getTitle()%>
				 </a>
			 </td>
			<td><%=mList.get(i).getWriterName()%></td>
			<td><%=mList.get(i).getPostingDate()%></td>
			<td><%=mList.get(i).getReadCount()%></td>
		</tr>
		<% } //end for %> 
	<% } // end else %>
		<tr>
			<td colspan="5">
				<a href="<%=projectName%>/BoardControl?cmd=input-form">글쓰기</a>
				<%for(int i=1; i<=totalPageCount; i++){%>
				<a href=<%=projectName%>/BoardControl?cmd=list-page&page=<%=i %>">[<%=i %>]</a>
				<% } // end of for%>
			</td>
		</tr>
	</table>
</BODY>
</HTML>
