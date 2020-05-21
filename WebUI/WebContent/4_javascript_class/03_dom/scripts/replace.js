
// window.onload = function(){	
document.addEventListener('DOMContentLoaded', function() {
		
  var list = document.getElementById('list');
  var pic = document.getElementById('pic');
  var del = document.getElementById('del');

  // 리스트에서 선택(클릭했을 때)
  list.onclick = function(e){
	var isbn = e.target.getAttribute('data-isbn');
	
	// <img src='xxx.gif' width='100' height='80'/>
	var img = document.createElement('img');
	img.src = 'images/'+isbn+'.jpg';
	img.height = 150;
	img.width = 100;
	
	
	if(pic.getElementsByTagName('img').length>0){// 최초html에는 pic에는 아무것도 없다. pic에 자식으로 img 태그가 만들어지는데 만약 1개라도 있다면
		pic.replaceChild(img, pic.lastChild); //기존의 태그를 img태그로 대체하겠당.
	}else{
		pic.appendChild(img); //처음에는 아무것도 없으니 append로 img태그를 추가한다아
		del.disabled = false; // del의비활성화를 실패시키겠다. == del을 활성화 시키겠다.
	}
  }

  
  // 삭제 버튼 누르면 pic 아래 자식(img 태그)를 지운다
  del.onclick = function(){
		pic.removeChild(pic.lastChild);
	}
  
  
//};
});