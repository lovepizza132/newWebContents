<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> <!-- jqeury로 가져오기 -->
<script type="text/javascript">
	$(function(){
		//엔터키 입력 방지
		$('form input').keydown(function(event) {
			if (event.keyCode === 13) {
				event.preventDefault();
			    event.stopPropagation();
			};
		});
		
		// 유효성 검사가 통과 됐을 때, 서밋한다.
		$('input[type="button"]').click(function(e){
			e.stopPropagation();
			e.preventDefault();
			
			if(checkForm()==true){				
				$('form').submit();
			}
		})	
	});
		// 유효성 검사
		function checkForm(){
			
			var getName= /^[가-힣]{2,5}$/;
			
			// 이름 공백 확인
			if($('input[type=text]').val()==""){
				alert("이름을 입력하세요")
				$('input[type=text]').focus();
				return false;
			}
			// 이름 한글 유효성 확인
			if(!getName.test($('input[type=text]').val())){
				alert("2~5글자의 한글로 입력하세요")
				$('input[type=text]').val()=="";
				$('input[type=text]').focus();
				return false;
			}
			
			return true;
		}
					
</script>
</head>

<body>
	<form action="saveMessage.jsp" name="frm" method="get"> <!-- post사용 이유: 1. 비밀번호를 감추기 위해, 2. 넘기는 데이터가가 많아서 -->
		이름 : <input type="text" name="guestName" required /><br/><br/>
		암호 : <input type="password" name="password" required /><br/><br/>
		메세지 : <textarea name="message" rows="3" cols="30" required></textarea><br/><br/>
		<input type="button" value="메세지 남기기"> <!-- button은 넘어가지 않는다아. -->
	</form>
</body>
</html>