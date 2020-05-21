 $(function(){
	   $('#total').attr('value', 0);
	   $('.menu select').change(function(){
	      var count = $(this).val();
	      if (count != 0){
	         var span =$('.menu').has($(this));
	         var name =span.find($('span'))[0].innerHTML;
	         var price =span.find($('span'))[1].innerHTML;
	         var tr ='<tr class="tr1"><td width=150>'+name+'</td><td width=100>'+count+'</td><td width=50><button class="remove" value="삭제">삭제</button></td></tr>';
	         $('#listTable tbody').append(tr);
	      	 
	         $('#total').attr('value',parseInt($('#total').val())+price*count);
	      }
	   });
	   $('#listTable').on('click','#btn',function(){
		 alert('총 가격은'+ $('#total').val());
		 $('.menuCount').prop('selectedIndex',0);
		 $('.tr1').remove();
		 $('#total').val(0);
	   });
	   $(document).on('click','button', function(evt){
		   $(evt.target).closest('tr').remove();
	   });
	   
	});
 