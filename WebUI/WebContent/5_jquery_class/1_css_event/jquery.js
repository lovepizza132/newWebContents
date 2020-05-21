/**
 * 
 */
$(function(){
/*$('#celebs tbody tr:odd').css({
		'background': 'lightpink',
		'color': 'blue'
	});*/
	$('#celebs tbody tr:odd').addClass('table_striping');
	$('#celebs tbody tr').hover(function(){
		$(this).addClass('td_mouseover');
	}, function(){
		$(this).removeClass('td_mouseover');
	})
	
	$('#hideButton').click(function(){
		$('#intro img').slideUp(1000);
	});
	
	$('#showButton').click(function(){
		$('#intro img').fadeIn();
	});
	
	$('#toggleButton').click(function(){
		$('#intro img').toggle(1000);
	});
	
	
	
	
});