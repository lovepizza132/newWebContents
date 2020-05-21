$(function(){
	// 1. 날짜 구하기
		var today = new Date();
		$('.year').text(today.getFullYear());
		$('.month').text(today.getMonth()+1);
		$('.date').text(today.getDate());
		
	// 2. 검색창 포커스
		// 검색창에 포커스가 있을 때 이미지를 제거 -> 포지션을 바꿈
		// 검색창에 포커스가 없을 때 다시 이미지를 채움
		$('#keyword').focus(function(){
			$(this).css("background-position","0 -500px");
		});
		$('#keyword').blur(function(){
			$(this).css("background-position","0 0");
		});
		// 확인키를 누르면 초기화(원래라면 검색 결과를 보여줘야 함)
		$('#keyword').next().click(function(){
			$(this).css("background-position","0 0");
		});
	
	// 3. 탭메뉴
		// tab 공지사항, 질문과답변, 저자문의(dt태그)
		// 게시물(dd태그)은 각 탭과 연결되어 내용을 저장하고 있다.
		var lastDt = $('#tabmenu dt:eq(0)'); //dt태그의 첫번째 내용
		var lastDd = $('#tabmenu dt:eq(0)').next(); //dd태그의 첫번째 내용
		// tab 클릭 시 
		// 이전에 선택된 메뉴의 이미지를 바꾼 뒤, 게시물 숨김 
		// 현재 클린된 메뉴의 이미지를 바꾼 뒤, 해당 게시물 보여줌 
		$('#tabmenu dt').click(function(){
			lastDt.find('img').attr('src', $(this).find('img').attr('src').replace('over', 'out'));
			lastDd.hide();
			$(this).find('img').attr('src',$(this).find('img').attr('src').replace('out', 'over'));
			$(this).next().show();
			lastDt = $(this);
			lastDd = $(this).next();
		});
		

	// 4. 베스트북 이미지 슬라이더 ( bxSlider 이용 )
		 $('#best_bg ul').bxSlider({
	   	 minSlides:5,
	   	 maxSlides:5,
	   	 slideMargin:40,
	   	 slideWidth:120,
	   	 auto:true,
	   	 speed:200
		 });
		 //버튼 클릭시 slider 이동
		 $("#best_bg .prev_btn").click(function(){
			 slider.goToPrevSlide();
		 })
		 $("#best_bg .next_btn").click(function(){
			 slider.goToNextSlide();
		 })
	
	// 5. 로그인
	 // 로그인 클릭 시 로그인 form 위치 이동 
	 $('.login_wrap img').click(function(){
		 $('#login_f').animate({'top':'20px'});
	 });
	 // CLOSE버튼 클릭 시 로그인 form 숨김
	 $('.login_close_btn').click(function(){
		 $('#login_f').animate({'top':'-500px'});
	 });
	
	// 6. 전체메뉴 보이기
	 // 전체메뉴 클릭 시 메뉴 보여줌
	 $('#total_btn').click(function(){
		$('#total_menu').css('display','block');
	 });
	 // 닫기 버튼 눌렀을 시 화면 숨기기
	 $('#total_close').click(function(){
		 $('#total_menu').css('display','none');
	 })
	
	 // 7. 광고팝업창 하루동안 차단
	 // key가 'Promotion'인 저장 된 쿠키 중 key값이 no가 아닐 경우 광고창 오픈
	 if($.cookie('Promotion')!='no'){
			window.open("promotion.html","","width=400, height=360");
		 	}
	 
});

