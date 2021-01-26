function cancel_sale()
{
	var rowid = Number($('#rowid').val());
	a = 1;
	while(a <= rowid)
	{
		$('#qty_'+a).closest("tr").remove();
		a++;
	}
	$('#rowid').val(0);
	$('#tlt_dist').val(0);
	$('#tlt_tax').val(0);
	$('#txt_search').val('');
	$('#txt_search').focus();
	cal_total();
}
function cal_discount()
{
	var dist_amount = 0;
	if (Number($('#sub_total').val()) > 0)
	{
		dist_amount = (Number($('#sub_total').val()) * Number($('#tlt_dist').val())) / 100;
	}
	$('#dist_amount').val(dist_amount.toFixed(2));
	chk_final();
}
function cal_tax()
{
	var tax_amount = 0;
	if (Number($('#sub_total').val()) > 0)
	{
		tax_amount = (Number($('#sub_total').val()) * Number($('#tlt_tax').val())) / 100;
	}
	$('#tax_amount').val(tax_amount.toFixed(2));
	chk_final();
}
function cals(id)
{
	$('#qty_'+id).on('keyup keypress', function(e)
	{
		var keyCode = e.keyCode || e.which;
		if (keyCode === 13)
		{ 
			$('#txt_search').focus();
		}
	});
	$('#prate_'+id).on('keyup keypress', function(e)
	{
		var keyCode = e.keyCode || e.which;
		if (keyCode === 13)
		{ 
			$('#txt_search').focus();
		}
	});
	$('#dist_'+id).on('keyup keypress', function(e)
	{
		var keyCode = e.keyCode || e.which;
		if (keyCode === 13)
		{ 
			$('#txt_search').focus();
		}
	});
	var qty = $('#qty_'+id).val();
	var prate = $('#prate_'+id).val();
	var dist = $('#dist_'+id).val();
	var total = Number(qty) * Number(prate);
	var discount = (Number(total) * Number(dist)) / 100;
	var totals = Number(total) - Number(discount);
	$('#total_'+id).val(totals.toFixed(2));
	//cal_discount();
	//cal_tax();
	cal_total();
}
function cal_sub(id)
{
	var qty = $('#qty_'+id).val();
	var prate = $('#prate_'+id).val();
	var dist = $('#dist_'+id).val();
	var total = Number(qty) * Number(prate);
	var discount = (Number(total) * Number(dist)) / 100;
	var totals = Number(total) - Number(discount);
	$('#total_'+id).val(totals.toFixed(2));
	cal_total();
}
function cal_total()
{
	var rowid = Number($('#rowid').val());
	var sub_sale = 0;
	var total_sale = 0;
	var total_qty = 0;
	var total_items = 0;
	a = 1;
	while(a <= rowid)
	{
		if (Number($('#total_'+a).val()) > 0)
		{
			sub_sale += Number($('#total_'+a).val());
			total_qty += Number($('#qty_'+a).val());
			total_items += 1;
		}
		a++;
	}
	$('#sub_total').val(sub_sale.toFixed(2));
	$('#total_qty').val(total_qty);
	$('#total_items').val(total_items);
	cal_discount();
	cal_tax();
	chk_final();
}
function chk_final()
{
	var total_sale = (Number($('#sub_total').val()) - Number($('#dist_amount').val())) + Number($('#tax_amount').val());
	var paid_amount = Number($('.paid_amount').val());
	$('#total_sale').val(total_sale.toFixed(2));
	$('#TLT_AMOUNT').html(total_sale.toFixed(2));
	var paid_amt = Number(total_sale) - Number(paid_amount);
	$('#paid_amt').val(paid_amt.toFixed(2));
	chk_balance();
}
function chk_balance()
{
	var total_sale = $('#total_sale').val();
	var paid_amount = Number($('.paid_amount').val());
	var bal_amount = Number(total_sale) - Number(paid_amount);
	var paid_amt = $('#paid_amt').val();
	var balance = Number(bal_amount) - Number($('#paid_amt').val());
	$('#balance').val(balance.toFixed(2));
}
function add_product(item_name,ids,prate,ptype,atrr,is_group,item_code)
{
	if (Number(ids) > 0)
	{
		//var item_code = "";
		var unique = "Yes";
		var rowids = 0;
		var rowqty = 0;
		var rowid = Number($('#rowid').val());
		for (var id=1;id <= rowid;id++)
		{
			if (Number(ids) == Number($('#item_id_'+id).val()))
			{
				unique = "No";
				rowids = Number(id);
				rowqty = Number($('#qty_'+id).val());
			}
		}
		if (unique == "Yes")
		{
			rowid += 1;
			var new_line = '<tr id="'+rowid+'"><td><input type="hidden" name="item_id_'+rowid+'" id="item_id_'+rowid+'" value="'+ids+'"><input type="hidden" name="item_name_'+rowid+'" id="item_name_'+rowid+'" value="'+item_name+'"><input type="hidden" name="item_code_'+rowid+'" id="item_code_'+rowid+'" value="'+item_code+'"><input type="hidden" name="item_atrr_'+rowid+'" id="item_atrr_'+rowid+'" value="'+atrr+'"><input type="hidden" name="is_group_'+rowid+'" id="is_group_'+rowid+'" value="'+is_group+'"><div style="font-weight:bold;">'+item_name+'</div><div">'+atrr+'</div></td><td><input type="text" name="qty_'+rowid+'" id="qty_'+rowid+'" value="1" class="form-control" onkeyup="cals('+rowid+');"></td><td><input type="text" name="prate_'+rowid+'" id="prate_'+rowid+'" value="'+prate+'" class="form-control" onkeyup="cals('+rowid+');"></td><td><input type="text" name="dist_'+rowid+'" id="dist_'+rowid+'" value="0" class="form-control" onkeyup="cals('+rowid+');"></td><td><input type="text" name="total_'+rowid+'" id="total_'+rowid+'" value="" class="form-control" readonly="Yes"></td><td><a href="#" class="btn btn-danger btn-xs btnDelete"><span class="glyphicon glyphicon-remove"></span></a></td></tr>';
			$('#inv_detail').append(new_line);
			$('#rowid').val(rowid);
		}else{
			rowqty += 1;
			$('#qty_'+rowids).val(rowqty);
			rowid = rowids
		}
		$('#txt_search').val('');
		if (ptype == "BARCODE")
		{
			$('#txt_search').focus();
		}else{
			$('#qty_'+rowid).select();
			$('#qty_'+rowid).focus();
		}
		
		cal_sub(rowid);
	}else{
		$('#txt_search').val('');
		$('#txt_search').focus();
	}
}
var tlt_height = window.screen.height;
var main_sale_table = Number(tlt_height) - 530;
var main_grid_table = Number(tlt_height) - 505;
$('.main_sale_table').css('max-height', main_sale_table+'px');
$('.main_sale_table').css('min-height', main_sale_table+'px');
$('.main_grid_table').css('max-height', main_grid_table+'px');
$('.main_grid_table').css('min-height', main_grid_table+'px');
function submit_sale()
{
	if (Number($('#rowid').val()) > 0 && Number($('#total_sale').val()) > 0)
	{
		$('#pay_btn').prop('disabled', true);
		$.ajax({
		  method: "POST",
		  url: 'sales_process.php?ACT=NEW',
		  data: $('#frm_new').serialize()
		})
		.done(function( msg ) {
			if (msg == "OK" || Number(msg) > 0)
			{
				cancel_sale();
				load_recent_sales();
				$('#pay_btn').prop('disabled', false);
			}else{
				alert(msg);
				$('#pay_btn').prop('disabled', false);
			}
		  });
	}
}
function update_sale()
{
	if (Number($('#rowid').val()) > 0 && Number($('#total_sale').val()) > 0)
	{
		$('#pay_btn').prop('disabled', true);
		$.ajax({
		  method: "POST",
		  url: 'sales_process.php?ACT=EDIT',
		  data: $('#frm_new').serialize()
		})
		.done(function( msg ) {
			if (Number(msg) > 0)
			{
				window.location.href = 'view_sale.php?mid='+msg;
			}else{
				alert(msg);
				$('#pay_btn').prop('disabled', false);
			}
		  });
	}
}
function load_recent_sales()
{
	$.ajax({
		method: "POST",
		url: 'sales_process.php?ACT=RECENT_SALES'
	})
	.done(function( msg ) {
		$('#recent_sales').html(msg);
	});
}
function save_sale()
{
	if (Number($('#rowid').val()) > 0 && Number($('#total_sale').val()) > 0)
	{
		$('#save_btn').prop('disabled', true);
		$.ajax({
		  method: "POST",
		  url: 'sales_process.php?ACT=SAVE',
		  data: $('#frm_new').serialize()
		})
		.done(function( msg ) {
			if (msg == "OK" || Number(msg) > 0)
			{
				cancel_sale();
				load_saved_sales();
				$('#save_btn').prop('disabled', false);
			}else{
				alert(msg);
				$('#save_btn').prop('disabled', false);
			}
		  });
	}
}
function load_saved_sales()
{
	$.ajax({
		method: "POST",
		url: 'sales_process.php?ACT=SAVED_SALES'
	})
	.done(function( msg ) {
		$('#saved_sales').html(msg);
	});
}
function delete_single_saved_sales(ids)
{
	$.ajax({
		method: "POST",
		url: 'sales_process.php?ACT=DELETE_SINGLE_SAVED_SALES',
		data: {ids:ids}
	})
	.done(function( msg ) {
		load_saved_sales();
	});
}
function delete_sales_payment(sid,sale_id)
{
	$.ajax({
		method: "POST",
		url: 'sales_process.php?ACT=DELETE_SALES_PAYMENT',
		data: {sid:sid,sale_id:sale_id}
	})
	.done(function( msg ) {
		load_sales_payment(sale_id);
	});
}

function load_single_saved_sales(ids)
{
	cancel_sale();
	$.ajax({
		method: "POST",
		url: 'sales_process.php?ACT=SINGLE_SAVED_SALES',
		data: {ids:ids}
	})
	.done(function( msg ) {
		//$('#saved_sales').html(msg);
		rows = msg.split("::::");
		for (ind = 0; ind < rows.length; ind++) {
			//console.log(rows[ind]);
			mains = rows[ind].split("~");
			load_product(mains[1],mains[0],mains[3],mains[2],mains[5],mains[6],mains[7]);
		}
		$('#txt_search').val('');
		$('#txt_search').focus();
		load_saved_sales();
	});
}
function load_product(item_name,ids,prate,qty,atrr,is_group,item_code)
{
	if (Number(ids) > 0)
	{
		var rowid = Number($('#rowid').val());
		rowid += 1;
		//var new_line = '<tr id="'+rowid+'"><td><input type="hidden" name="item_id_'+rowid+'" id="item_id_'+rowid+'" value="'+ids+'"><input type="text" name="item_name_'+rowid+'" id="item_name_'+rowid+'" value="'+item_name+'" class="form-control" readonly="Yes"></td><td><input type="number" name="qty_'+rowid+'" id="qty_'+rowid+'" value="'+qty+'" class="form-control" onkeyup="cals('+rowid+');"></td><td><input type="number" name="prate_'+rowid+'" id="prate_'+rowid+'" value="'+prate+'" class="form-control" onkeyup="cals('+rowid+');"></td><td><input type="number" name="dist_'+rowid+'" id="dist_'+rowid+'" value="0" class="form-control" onkeyup="cals('+rowid+');"></td><td><input type="text" name="total_'+rowid+'" id="total_'+rowid+'" value="" class="form-control" readonly="Yes"></td><td><a href="#" class="btn btn-danger btn-xs btnDelete"><span class="glyphicon glyphicon-remove"></span></a></td></tr>';
		var new_line = '<tr id="'+rowid+'"><td><input type="hidden" name="item_id_'+rowid+'" id="item_id_'+rowid+'" value="'+ids+'"><input type="hidden" name="item_code_'+rowid+'" id="item_code_'+rowid+'" value="'+item_code+'"><input type="hidden" name="item_name_'+rowid+'" id="item_name_'+rowid+'" value="'+item_name+'"><input type="hidden" name="item_atrr_'+rowid+'" id="item_atrr_'+rowid+'" value="'+atrr+'"><input type="hidden" name="is_group_'+rowid+'" id="is_group_'+rowid+'" value="'+is_group+'"><div style="font-weight:bold;">'+item_name+'</div><div">'+atrr+'</div></td><td><input type="number" name="qty_'+rowid+'" id="qty_'+rowid+'" value="'+qty+'" class="form-control" onkeyup="cals('+rowid+');"></td><td><input type="number" name="prate_'+rowid+'" id="prate_'+rowid+'" value="'+prate+'" class="form-control" onkeyup="cals('+rowid+');"></td><td><input type="number" name="dist_'+rowid+'" id="dist_'+rowid+'" value="0" class="form-control" onkeyup="cals('+rowid+');"></td><td><input type="text" name="total_'+rowid+'" id="total_'+rowid+'" value="" class="form-control" readonly="Yes"></td><td><a href="#" class="btn btn-danger btn-xs btnDelete"><span class="glyphicon glyphicon-remove"></span></a></td></tr>';
		$('#inv_detail').append(new_line);
		$('#rowid').val(rowid);
		cal_sub(rowid);
	}
}

function load_sales_payment(saleid)
{
	$.ajax({
		method: "POST",
		url: 'sales_process.php?ACT=SALES_PAYMENT',
		data: {sale_id:saleid}
	})
	.done(function( msg ) {
		$('#sales_payment').html(msg);
		cal_total();
	});
}
function cust_remove()
{
	$('#cust_id').val(0);
	$('#cust_detail').html('');
	$('#cust_name').val('');
	$('#cust_name').focus();
}