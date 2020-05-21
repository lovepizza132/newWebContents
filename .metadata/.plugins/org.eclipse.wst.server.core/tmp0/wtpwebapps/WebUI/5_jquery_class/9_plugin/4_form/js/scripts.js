/**
 * 
 */
$(function(){
	$('#signup>form').validate({
		rules:{
			name:{required:true},
			email:{required:true,
					email:true},
			website:{url:true},
			password:{required:true, 
					minlength:6},
			passconf:{equalTo:'#password'}
		},
		success: function(label){
			label.addClass('valid');
			label.text('성공');
		}
	});
	
	$('.check-all').click(function(){
		//prop() == attr()
//		$('.agree').prop('checked', this.checked); //자바스크립트의 속성: this와 checked
		$('.agree').prop('checked', $(this).is(':checked')); // 온전한 jquery 형 .is 주어의 상태가 동사인지 확인하는 문장
	});
	$('.agree').click(function(){
		if($('.agree').is(':not(:checked)')){
			$('.check-all').prop('checked', false);
		}
		else{$('.check-all').prop('checked', true);}
	});
	
});