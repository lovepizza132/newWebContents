<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('input[value="작성"]').click(function(){
		var frm = $('form[name="frm"]');
		frm.attr("action", "BoardSave.jsp");
		// 유효성 검사
		var getName= /^[가-힣]{2,5}$/;
		
		// 작성자 공백 확인
		if($('input[name=writerName]').val()==""){
			alert("작성자를 입력하세요")
			$('input[name=writerName]').focus();
			return false;
		}
		// 제목 공백 확인
		if($('input[name=title]').val()==""){
			alert("제목을 입력하세요")
			$('input[name=title]').focus();
			return false;
		}
		// 비밀번호 공백 확인
		if($('input[name=password]').val()==""){
			alert("비밀번호를 입력하세요")
			$('input[name=password]').focus();
			return false;
		}
		// 이름 한글 유효성 확인
		if(!getName.test($('input[name=writerName]').val())){
			alert("2~5글자의 한글로 입력하세요")
			$('input[name=writerName]').val()=="";
			$('input[name=writerName]').focus();
			return false;
		}
		
		frm.submit();
	});
	$('input[value="취소"]').click(function(){
		$(location).attr("href", "BoardList.jsp");
	});

});
</script>
</head>
 <body>
	<h4> 게시판 글 쓰기 </h4><br/>
	나중에 이쁘게 만드시오 <br/><br/>
	<form name='frm' method='post'>
	작성자 : <input type='text' name="writerName"><br/><br/>
	제  목 : <input type='text' name="title"><br/><br/>
	내  용 : <textarea rows='10' cols='40' name="content"></textarea><br/><br/>
	패스워드(수정/삭제시 필요) :
			 <input type='password' name="password"><br/><br/>
	<input type='button' value='작성'>
	<input type='reset' value='취소'>
	</form>

</body>
</html>