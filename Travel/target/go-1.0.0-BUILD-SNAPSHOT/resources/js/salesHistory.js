$(function() {

		$('#historyTable').DataTable({
			//표시 건수기능 숨기기
			lengthChange: false,
			// 검색 기능 숨기기
			searching: false,
			// 정보 표시 숨기기
			info: false,
			// 페이징 기능 숨기기
			paging: false,
			//기본 정렬
			order: [[0, 'desc']]
			
		});
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
//다운로드 하이퍼링크에 클릭 이벤트 발생시 saveCSV 함수를 호출하도록 이벤트 리스너를 추가
document.addEventListener('DOMContentLoaded', function(){
  document.getElementById('csvDownloadButton').addEventListener('click', function(){
    saveCSV('data.csv'); // CSV파일 다운로드 함수 호출
    return false;
  })
});

//CSV 생성 함수
function saveCSV(fileName){
    //CSV 문자열 생성
    let downLink = document.getElementById('csvDownloadButton');
    let csv = ''; //CSV최종 문자열을 저장하는 변수
    let rows = document.querySelectorAll("#historyTable tr"); // 테이블에서 행 요소들을 모두 선택

    
    //행단위 루핑
    for (var i = 0; i < rows.length; i++) {
        let cells = rows[i].querySelectorAll("td, th");
        let row = [];
        //행의 셀 값을 배열로 얻기
        cells.forEach(function(cell){
          row.push(cell.innerHTML);
        });

        csv += row.join(',') + (i != rows.length-1 ? '\n':''); // 배열을 문자열+줄바꿈으로 변환
    }
    
 	// 한글 처리를 해주기 위해 BOM 추가하기
    const BOM = "\uFEFF";
    csv = BOM + csv
    
    //CSV 파일 저장
    csvFile = new Blob([csv], {type: "text/csv"}); // 생성한 CSV 문자열을 Blob 데이터로 생성
    downLink.href = window.URL.createObjectURL(csvFile); // Blob 데이터를 URL 객체로 감싸 다운로드 하이퍼링크에 붙임.
    downLink.download = fileName; // 인자로 받은 다운로드 파일명을 지정
}