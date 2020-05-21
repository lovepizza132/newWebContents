window.onload = function(){
	var item = document.getElementsByClassName('item');
	// var item = document.querySelectorAll('id');
	
	for(var i=0; i<item.length; i++){
		item[i].onclick = function(){
			var price = this.getAttribute('price');
			alert(price);
		}
	}
}
// 서버로 무언가를 보낼때는 'name'으로 찾는다 ㅇㅋ? 그리고 form태그로 감싸야 그 데이터를 보낼 수 있다.