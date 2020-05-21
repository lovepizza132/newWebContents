$(function(){
	$('#total').attr('value', '0');
	$('.menuCount').change(function(){
		
		var menu = $(this).parent().find('span');
		var selMenu = menu.attr('value');
		var priceMenu = parseInt(menu.next().attr('value'));
		var count = parseInt($(this).val());
		var totalPrice = priceMenu*count;
		
		$('#total').attr('value', parseInt($('#total').val())+totalPrice);
		var tr = '<tr class="orderMenu"><td width="150" value="'+priceMenu+'">'+selMenu+'</td><td width="150" value="'+count+'">'+count+'</td><td width="50"><button class="delete">삭제</button></td></tr>';
		if(count!=0){
			$('#listTable tbody').append(tr);
		}
		$(this).val('0');
	});
	// 삭제 버튼 -> 테이블에서 tr 삭제
	$('#listTable').on('click','button', function(){
		var deleteInfo = $(this).parent().parent().find('td');
		var deleteMenuPrice = deleteInfo.attr('value');
		var count = deleteInfo.next().attr('value');
		$(this).parent().parent().remove();
		alert(selMenu);
		//총값 반영
		$('#total').attr('value', parseInt($('#total').val())-deleteMenuPrice*count);
	});
	// 주문하기
	$('#listTable').on('click','#btn', function(){
		alert('주문이 완료되었습니다.');
		$('.orderMenu').remove();
		$('#total').attr('value', '0');
		
	});
});