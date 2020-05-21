$(function(){
	var topDiv = $('.tabSet');
	var anchors = topDiv.find('.tabs a');
	var panelDivs = topDiv.find('.panels div.panel');
	anchors.show();
	panelDivs.hide();

	var lastAnchors = anchors.filter('.on') //find(), filter() 차이
	var lastPanel = $(lastAnchors.attr("href"));
	lastPanel.show();
	
	anchors.click(function(){
		// 눌려진 요소에 클래스명 on 지정
		/*
		 * 1) 현재 이벤트가 발생한 a 태그와 그 href( 패널)을 얻어와서 변수에 지정 
		 * 2) 기존 a 태그(lastAchor	s)에서 on클래스 제거
		 * 3) 현재 a 태그에 on 클래스 추가
		 * 
		 * 4) 기존패널(lastPanel) 감추기
		 * 5) 현재패널 보이기
		 * 
		 * 6) 현재 a 태그와 현재 패널을 lastAnchors, lastPanel 지정하기
		 */
		var currentAnchor = $(this);
		var currentPanel = $(currentAnchor.attr('href'));
		lastAnchors.removeClass('on');
		currentAnchor.addClass('on');
		lastPanel.hide();
		currentPanel.show();
		lastAnchors = currentAnchor;
		lastPanel = currentPanel;
		
	});
});