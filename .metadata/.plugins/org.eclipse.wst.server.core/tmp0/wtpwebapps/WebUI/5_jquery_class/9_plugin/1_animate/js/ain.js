$(function(){
	var starProfile = $('#bio > div');
	var starName = $('#bio>h3');
	starProfile.hide();
	var currentDisplay = starProfile.first().show();
	starName.css('cursor', 'pointer');
	
	starName.click(function(){
//		$(this).next().toggle();
		var lastStarName = $(this);
		currentDisplay.hide();
		var lastDisplay = lastStarName.next().animate({'height':'toggle'}, 'slow', 'easeOutBack');// animate는 '속성값', 시간만 지정
		currentDisplay = lastDisplay;
		starName = lastStarName;
		
	});
});