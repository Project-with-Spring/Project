function add_new()
{
	$('#addNewBtn').toggle();
	$('#addNewCtgBtn').toggle();
	
  $('#add_new').toggle();
  $('#my_all').toggle();
  $('#add-new-btn').toggle();
}

function add_ctg_new() {
	$('#addNewCtgBtn').toggle();
	$('#addNewBtn').toggle();
	
	$('#addNewCtg').toggle();
	$('#my_all').toggle();
	
}

function cancel_new()
{
  $('#my_all').toggle();
  $('#add_new').toggle();
  // 상품 입력창, 재고 입력창, 버튼그룹 숨김
  $('#pdt_insert').css('display', 'none');
  $('#stc_insert').css('display', 'none');
  $('#add-new-btn').css('display', 'none');
}
function add_new_group()
{
  $('#add_new_group').toggle();
  $('#my_all').toggle();
}
function cancel_new_group()
{
  $('#my_all').toggle();
  $('#add_new_group').toggle();
}