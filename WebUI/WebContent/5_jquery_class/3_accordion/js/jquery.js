/**
 * 
 */

$(document).ready(function(){
	
	$('.accordion').each(function(){
		var allDt = $(this).find('dt');
		var allDd = $(this).find('dd');
		
		allDd.hide();
		allDt.css('cursor', 'pointer');
		
		allDt.click(function(){
//			allDd.hide();
//			$(this).next().show();
			$(this).next().toggle(); // 닫혀있으면 보여주고 보여져있으면 닫고
		});
	});
});