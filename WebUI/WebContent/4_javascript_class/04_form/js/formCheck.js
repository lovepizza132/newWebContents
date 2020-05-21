window.onload = function(){

		var frm = document.querySelector('#frm');
		var inputs = document.querySelectorAll("input"); //태그라서 문자열 그대로 사용 , class면 .추가
		
		frm.onsubmit =function(e){
			e.preventDefault(); // 기존기능 - 자기자신의 이벤트를 막음
			e.stopPropagation(); // 버블링 막음
			
			// 추가된 사항을 검사
		if(!frm.agree.checked){
			alert('반드시 약관에 동의하세요');
			return;
		}
			// 전송
			frm.submit();
		}


	}