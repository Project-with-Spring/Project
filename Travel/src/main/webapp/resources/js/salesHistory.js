$(function() {
	
	  $('.btn-submit').click(function(e){
	  		$(this).prop('disabled', true);
			var $formId = $(this).parents('form');
			var formAction = $formId.attr('action');
			var err = '';
			var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
			$('.required',$formId).each(function(){
				var inputVal = $(this).val();
				//var $parentTag = $(this).parent();
				if(inputVal == ''){
					$(this).addClass('error');
					err = 'error';
				}else{
					$(this).removeClass('error');
				}
				if($(this).hasClass('email') == true){
					if(!emailReg.test(inputVal)){
						$(this).addClass('error');
						err = 'error';
					}
				}
			});
			if (err == '')
			{
				if ($('#csrf_token'))
				{
					var csrf_token = $('#csrf_token').val();
					var csrf_url = $('#csrf_url').val();
					$.ajax({
					  method: "POST",
					  url: formAction,
					  headers: {'X-CSRF-TOKEN': csrf_token},
					  data: $formId.serialize()
					})
					.done(function( msg ) {
						//alert( "Data Saved: " + msg );
						if (msg == "OK" || Number(msg) > 0)
						{
							//window.location.reload(true);
							window.location.href = csrf_url;
						}else{
							$('#err_msg').html(msg);
							$("#err_msg").show().delay(10000).fadeOut();
							$('.btn-submit').prop('disabled', false);
						}
					  });
				}else{
					//alert( "Token Not Exist");
					$('#err_msg').html("Token Not Exist");
					$("#err_msg").show().delay(10000).fadeOut();
					$('.btn-submit').prop('disabled', false);
				}
			}else{
				$('.btn-submit').prop('disabled', false);
			}
			e.preventDefault();
		});

	  $('.btn-update').click(function(e){
	  		$(this).prop('disabled', true);
			var $formId = $(this).parents('form');
			var formAction = $formId.attr('action');
			var err = '';
			var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
			$('.required',$formId).each(function(){
				var inputVal = $(this).val();
				//var $parentTag = $(this).parent();
				if(inputVal == ''){
					$(this).addClass('error');
					err = 'error';
				}else{
					$(this).removeClass('error');
				}
				if($(this).hasClass('email') == true){
					if(!emailReg.test(inputVal)){
						$(this).addClass('error');
						err = 'error';
					}
				}
			});
			if (err == '')
			{
				if ($('#csrf_token'))
				{
					var csrf_token = $('#csrf_token').val();
					var csrf_url = $('#csrf_url').val();

					$.ajax({
					  method: "POST",
					  url: formAction,
					  headers: {'X-CSRF-TOKEN': csrf_token},
					  data: $formId.serialize()
					})
					.done(function( msg ) {
						//alert( "Data Saved: " + msg );
						if (msg == "OK" || Number(msg) > 0)
						{
							window.location.href = csrf_url;
						}else{
							$('#err_msg').html(msg);
							$("#err_msg").show().delay(10000).fadeOut();
							$('.btn-update').prop('disabled', false);
						}
					  });
				}else{
					//alert( "Token Not Exist");
					$('#err_msg').html("Token Not Exist");
					$("#err_msg").show().delay(10000).fadeOut();
					$('.btn-update').prop('disabled', false);
				}
			}else{
				$('.btn-update').prop('disabled', false);
			}
			e.preventDefault();
		});
	  $('.btn-update-up').click(function(e){
	  		$(this).prop('disabled', true);
			var $formId = $(this).parents('form');
			var formAction = $formId.attr('action');
			var formData = new FormData($formId[0]);
			var err = '';
			var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
			$('.required',$formId).each(function(){
				var inputVal = $(this).val();
				//var $parentTag = $(this).parent();
				if(inputVal == ''){
					$(this).addClass('error');
					err = 'error';
				}else{
					$(this).removeClass('error');
				}
				if($(this).hasClass('email') == true){
					if(!emailReg.test(inputVal)){
						$(this).addClass('error');
						err = 'error';
					}
				}
			});
			if (err == '')
			{
				if ($('#csrf_token'))
				{
					var csrf_token = $('#csrf_token').val();
					var csrf_url = $('#csrf_url').val();

					$.ajax({
					  method: "POST",
					  url: formAction,
					  headers: {'X-CSRF-TOKEN': csrf_token},
					  //data: $formId.serialize()
					  data: formData,
					  async: false,
					  cache: false,
					  contentType: false,
					  processData: false
					})
					.done(function( msg ) {
						//alert( "Data Saved: " + msg );
						if (msg == "OK" || Number(msg) > 0)
						{
							window.location.href = csrf_url;
						}else{
							$('#err_msg').html(msg);
							$("#err_msg").show().delay(10000).fadeOut();
							$('.btn-update-up').prop('disabled', false);
						}
					  });
				}else{
					//alert( "Token Not Exist");
					$('#err_msg').html("Token Not Exist");
					$("#err_msg").show().delay(10000).fadeOut();
					$('.btn-update-up').prop('disabled', false);
				}
			}else{
				$('.btn-update-up').prop('disabled', false);
			}
			e.preventDefault();
		});
		$( "#from" ).datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "2013:2021"
		});
		$( "#to" ).datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "2013:2022"
		});
		$( "#dob" ).datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "1940:2021"
		});
		$( "#date_join" ).datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "1970:2021"
		});
		$( "#open_date" ).datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "2013:2021"
		});
		$( "#pdate" ).datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "2013:2022"
		});
		$( "#leave_from" ).datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "2013:2022"
		});
		$( "#leave_to" ).datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "2013:2022"
		});
		$( "#holiday_date" ).datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "2013:2022"
		});
		$( "#v_date" ).datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "2013:2022"
		});
		$(".datefld").datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "2013:2022"
		});
		$(".date_box").datepicker({
			dateFormat: "dd-mm-yy",
			changeYear: true,
			yearRange: "2013:2022"
		});
		
	});
function print_sub(url,wid,hht)
{
	leftw = (window.screen.width / 2) - ((wid / 2) + 10);
	microsite_window=window.open(url,'microsite_window','toolbar=no,location=no,borders=no,directories=no,status=yes,menubar=no,scrollbars=yes,top=50,left='+leftw+',resizable=no,width='+wid+',height='+hht+'');
	microsite_window.focus();
}
$().ready(function() {
	$(".select2").select2();
	//$('.p_time').mask('00:00');
});
$('#my-ajax-modal').on('hide.bs.modal', function () {
	$('#my-ajax-modal').removeData('bs.modal');                
});