$(function(){
	$('.fontSize button').click(function(){
		if($(this).text().trim()==='+'){
			console.log("a");
			$('#txt').css('fontSize', '+=1');
		}
		else if($(this).text().trim()==='-'){
			$('#txt').css('fontSize', '-=1');
		}
	});
	$('#fontstyle').change(function(){
		var font = $(this).val();
		$('#txt').css('font-family', font);
	});
	
});

//var fs = parseInt($('#txt').css('fontSize'));