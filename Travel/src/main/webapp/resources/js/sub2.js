/**
 * 
 */

$('#ctg_type').on('click', function() {
	// json형태로 controller에서 받아온 list를 js에서 활용
	var ctgList = ($(ctgListByJson));
	// select 안에 달릴 option 내용
	var option = "<option value='" + 0 + "'>카테고리 이름 선택하기 (카테고리 타입)</option>";
		

	if($('#ctg_type').val() == 1) {
		$('#pdt_insert').css('display', 'block');
		$('#stc_insert').css('display', 'none');
		
		// 입력된 내용, 카테고리 select 초기화
		$('#category').empty();
		$('#category').append(option);
		$('input:text[name=pdt_name]').prop('value', '');
		$('input:text[name=pdt_cost]').prop('value', '');
		
		for(var i=0; i<ctgList.length; i++) {
			var ctg = ctgList[i];

			if(ctg.ctg_type == 1) {
				option = "<option value='" + ctg.ctg_id + "'>" + 
					ctg.ctg_name + "(" + ctg.ctg_type + ", 상품)</option>";
				$('#category').append(option);
			}
		}
		
	} else if($('#ctg_type').val() == 2) {
		$('#pdt_insert').css('display', 'none');
		$('#stc_insert').css('display', 'block');

		// 입력된 내용, 카테고리 select 초기화
		$('#category').empty();
		$('#category').append(option);
		$('input:text[name=stc_name]').prop('value', '');
		$('input:text[name=stc_cost]').prop('value', '');
		$('input:text[name=stc_count]').prop('value', '');

		for(var i=0; i<ctgList.length; i++) {
			var ctg = ctgList[i];
			
			if(ctg.ctg_type == 2) {
				option = "<option value='" + ctg.ctg_id + "'>" + 
					ctg.ctg_name + "(" + ctg.ctg_type + ", 재고)</option>";
				$('#category').append(option);
			}
			
		}
	} else {
		$('#pdt_insert').css('display', 'none');
		$('#stc_insert').css('display', 'none');
	}
});



// 한 상품에 대한 재고 사용량 입력
$('#btn-stc-pdt').on('click', function() {
	var stc = "재료명";
	var usage = "사용량";
	var html = "선택된 재료명&사용량 입력할 tag 저장 변수";

	if($('#stc_pdt').val() == 0) {
		alert('재료를 선택하세요');
		return ;
	} else if($('#stc_usage').val() == "") {
		alert('사용량을 입력하세요');
		return ;
	} else {
		stc = $('#stc_pdt option:selected').text();
		usage = $('#stc_usage').val();

		html = "<input type='text' value='" + stc + "' name='stc_pdt' readonly> " +
			"<input type='text' value='" + usage + "' name='stc_usage' readonly> " + 
			"<input type='button' value='선택 옵션 삭제' name='stc_pdt_del' class='form-control btn btn-danger btn-sm' > <br>";
		
		$('#stc_input').html(html);

		$('#stc_pdt').prop('value', 0);
		$('#stc_usage').prop('value', '');
	}
});

function stc_del() {
//	구현하다맘..
}


// form action 변경
var action = "";

$('#sub_mit').on('click', function() {
	// ctg_id 를 hidden으로 form안에 넣어서 보낼게용
	var ctg_id = $('#category option:selected').val();
	var html = "<input type='hidden' name='ctg_id' value='" + ctg_id + "' >";
	$('#frm_new').append(html);
	
	if($('#ctg_type').val() == 1) {
		action = "/go/pdt/add";
	} else if($('#ctg_type').val() == 2) {
		action = "/go/stc/add";
	}

	// action 값 변경
	$('#frm_new').attr('action', action);

	// form submit
	$('#frm_new').submit();
});


// 탭 화면 전환
$(function() {
	$('#tabs').tabs();
});

