
window.onload = function(){
	// 사용자가 엔터키 입력을 방지
	document.addEventListener('keydown', function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
		};
	}, true);
	
	var adultText = document.getElementById('adultText');
	var childText = document.getElementById('childText');
	var infantText = document.getElementById('infantText');
	var totalText = document.getElementById('totalText');
	
	var buyNow = document.getElementById('buyNow');
	var book = document.getElementById('book');
	var retry = document.getElementById('retry');
	var checkBox = document.getElementById('checkbox');
	var checkBox2 = document.getElementById('checkbox2');
	var radioMale = document.getElementById('radioMale');
	var radioFemale = document.getElementById('radioFemale');

	
	var korName = document.getElementById('korName');
	var engName = document.getElementById('engName');
	
	
	adultText.onchange = calc;
	childText.onchange = calc;
	infantText.onchange = calc;



	function calc(){
		totalText.value = (adultText.value*39000 + childText.value*29000 + infantText.value*19000) + '원';
	}
	
//	korName.onkeydown = function(){
//		korName.RegExp=/^[가-힣]{2,5}$/;
//		if(!korName.RegExp.test(korName.value)) alert("한글 2~5글자 이내");
//	}
	
	
	document.frm.onsubmit = function (e){
		e.preventDefault(); // 기존기능 - 자기자신의 이벤트를 막음
		e.stopPropagation(); // 버블링 막음		
		
		if(!checkBox.checked & !checkBox2.checked){
			alert('여행약관, 개인정보보호정책에 동의해주세요');
			return;
		}else if(!checkBox.checked){
			alert('여행약관에 동의해주세요');
			return;
		}else if(!checkBox2.checked){
			alert('개인정보보호정책에 동의해주세요');
			return;
		}else if(totalText.value == '0원'){
			alert("여행자 인원수가 최소 1명은 되어야 합니다.")
			return;
		}else if(!radioMale.checked && !radioFemale.checked){
			alert("성별을 체크해주세요.")
			return;
		}
		document.frm.submit();
		//adultText.value == "" && childText.value == "" && infantText.value == "" ||
	}
}

	