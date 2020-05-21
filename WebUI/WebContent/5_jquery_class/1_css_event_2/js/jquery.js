/**
 * 
 */
$(function(){
	$('.rollover img').hover(function(){
		var src = $(this).attr('src');
		var new_src	= src.replace('_off', '_on');
		$(this).attr('src', new_src);
		
//		$(this).attr('src', $(this).attr('src').replace('_off','_on'));
	}, function(){
		var src = $(this).attr('src');
		var new_src = src.replace('_on', '_off');
		$(this).attr('src', new_src);
	});
});