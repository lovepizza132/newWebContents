/**
 * 
 */
$(document).ready(function(){
	$('#navigation li').hover(function(){
		$(this).animate({ paddingLeft : '+=15px' }, 200);
	}, function(){
		$(this).animate({ paddingLeft : '-=15px' }, 200);
	});//자손중에 찾기, padding 안쪽여백

	$(window).scroll(function(){
		$('#navigation').css('top', $(document).scrollTop());
	});


});
