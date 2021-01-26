<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="<c:url value='/resources/css/sale.css'/>">
<script src="<c:url value="/resources/js/sale.js"/>"></script>
<div class="content-wrapper" style="min-height: 805px;">
    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box" style="margin-bottom:0px;">
	  	<div class="box-body" style="padding: 4px 10px;">
  	       <div id="my_all">
		   	<form method="POST" action="sales_process.php" class="form-horizontal" name="frm_new" id="frm_new">
			<input type="hidden" name="frm_action" id="frm_action" value="SALE">
			<div class="row">
				<div class="col-md-6 col-sm-6">
					<div class="main_grid_table" style="min-height: 575px; max-height: 575px; margin-bottom: 5px; overflow: hidden scroll;">
					<div class="manu_list">
					<ul class="manu_title">
					<c:forEach var="ctg" items="${ctgList }" varStatus="vs">
					<c:if test="${vs.index==0}">
					<li class="on" data-tab="ctg${ctg.ctg_id}">
					${ctg.ctg_name}
					</li>
					</c:if>
					<c:if test="${vs.index!=0}">
					<li data-tab="ctg${ctg.ctg_id}">
					${ctg.ctg_name}
					</li>
					</c:if>
					</c:forEach>
					</ul>
					</div>
					<c:forEach var="ctg" items="${ctgList }" varStatus="vs">
					<c:if test="${vs.index==0}">
					<div id="ctg${ctg.ctg_id}" class="pdt on">
					<ul class ="manu.sel">
					<c:forEach var="pdt" items="${pdtList }">
					<c:if test="${ctg.ctg_id==pdt.ctg_id }">
					<li>${pdt.pdt_name}<br>(${pdt.pdt_cost })원</li>
					</c:if>
					</c:forEach>
					</ul>
					</div>
					</c:if>
					<c:if test="${vs.index!=0}">
					<div id="ctg${ctg.ctg_id}" class="pdt">
					<ul>
					<c:forEach var="pdt" items="${pdtList }">
					<c:if test="${ctg.ctg_id==pdt.ctg_id }">
					<li>${pdt.pdt_name}<br>(${pdt.pdt_cost })원</li>
					</c:if>
					</c:forEach>
					</ul>
					</div>
					</c:if>
					</c:forEach>
					
																	</div>
					<div class="col-md-9 hidden-xs">
						<div class="table-responsive" style="border:solid 1px #CCC;padding:5px;">
							<h4 class="text-center" style="margin-top:0px;">Recent Sale</h4>
							<div id="recent_sales"></div>
						</div>
					</div>
					<div class="col-md-3 hidden-xs">
						<div class="table-responsive" style="border:solid 1px #CCC;padding:5px;">
							<h4 class="text-center" style="margin-top:0px;margin-bottom:5px;">Saved Sale</h4>
							<div id="saved_sales"></div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-sm-6">
					<div class="form-group" style="margin:0px;">
						<div class="col-md-10 col-sm-8 col-xs-8"><input type="text" name="txt_search" id="txt_search" value="" class="form-control ac_input" placeholder="Search any Item / Scan Barcode" autocomplete="off"></div>
						<div class="col-md-1 col-sm-2 col-xs-2">
							<button type="button" name="search_prod" id="search_prod" class="btn btn-success form-control" onclick="javascript:print_sub('search_item.php',800,600);" title="SEARCH PRODUCTS (F4)"><span class="glyphicon glyphicon-search"></span></button>
						</div>
																		<div class="col-md-1 col-sm-2 col-xs-2"><a href="new_quick_item.php" class="btn btn-primary form-control" data-target="#new-item-modal" data-toggle="modal" title="ADD NEW PRODUCT"><span class="glyphicon glyphicon-plus"></span></a></div>
											</div>
					<div class="table-responsive main_sale_table" style="padding: 5px; min-height: 550px; max-height: 550px;" id="sales_items">
						<table class="table tbl_narrow table-responsive" style="font-size:10px;" id="inv_detail">
							<thead>
							<tr>
								<th width="50%" style="min-width:200px;">ITEM DETAIL</th>
								<th style="min-width:40px;">QTY</th>
								<th style="min-width:50px;">PRICE</th>
								<th style="min-width:40px;">DIST%</th>
								<th style="min-width:60px;">AMOUNT</th>
								<th style="width:30px;"></th>
							</tr>
							</thead>
							<!--<tr id="1">
								<td><input type="text" name="item_name_1" id="item_name_1" value="" class="form-control" readonly="Yes"></td>
								<td><input type="text" name="qty_1" id="qty_1" value="" class="form-control"></td>
								<td><input type="text" name="prate_1" id="prate_1" value="" class="form-control"></td>
								<td><input type="text" name="dist_1" id="dist_1" value="" class="form-control"></td>
								<td><input type="text" name="total_1" id="total_1" value="" class="form-control"></td>
								<td><a href="#" class="btn btn-danger btn-xs btnDelete"><span class="glyphicon glyphicon-remove"></span></a></td>
							</tr>-->
							
						<tbody>
						<tr id="1"><td><input type="hidden" name="item_id_1" id="item_id_1" value="3642">
						<input type="hidden" name="item_name_1" id="item_name_1" value="Americano">
						<input type="hidden" name="item_code_1" id="item_code_1" value="coffee01">
						<input type="hidden" name="item_atrr_1" id="item_atrr_1" value="">
						<input type="hidden" name="is_group_1" id="is_group_1" value="No">
						<div style="font-weight:bold;">Americano</div>
						</td><td><input type="text" name="qty_1" id="qty_1" value="1" class="form-control" onkeyup="cals(1);"></td>
						<td><input type="text" name="prate_1" id="prate_1" value="0.00" class="form-control" onkeyup="cals(1);"></td>
						<td><input type="text" name="dist_1" id="dist_1" value="0" class="form-control" onkeyup="cals(1);"></td>
						<td><input type="text" name="total_1" id="total_1" value="" class="form-control" readonly="Yes"></td>
						<td><a href="#" class="btn btn-danger btn-xs btnDelete"><span class="glyphicon glyphicon-remove"></span></a></td></tr>
						</tbody>
						
						</table>
					</div>
					<div style="display:block;padding:5px;">
						<div style="display:none;border:solid 1px #CCC;padding:5px;height:100px;" id="load_submit">
							Loading...
						</div>
						<div style="display:block;border:solid 1px #CCC;padding:5px;" id="calc_submit">
							<div class="form-group" style="margin:0px;margin-bottom:5px;">
								<div class="col-md-3 col-xs-4">
									  <label>Sale Date</label>
									 <input type="text" name="sale_date" id="sale_date" class="form-control" value="17-01-2021" readonly="Yes">
								</div>
								<div class="col-md-1 col-xs-4">
									  <label>Items</label>
									 <input type="text" name="total_items" id="total_items" class="form-control" value="0" readonly="Yes">
								</div>
								<div class="col-md-2 col-xs-4">
									  <label>Total Qty</label>
									 <input type="text" name="total_qty" id="total_qty" class="form-control" value="0" readonly="Yes">
								</div>
								<div class="col-md-2 col-xs-4">
									  <label>Sub Total</label>
									 <input type="text" name="sub_total" id="sub_total" class="form-control" value="0" readonly="Yes">
								</div>
								<div class="col-md-2 col-xs-4">
									  <label>Dist %</label>
									 <input type="number" name="tlt_dist" id="tlt_dist" class="form-control" value="0" onkeyup="cal_discount();">
									 <input type="hidden" name="dist_amount" id="dist_amount" value="0.00">
								</div>
								<div class="col-md-2 col-xs-4">
									  <label>Tax %</label>
									 <input type="number" name="tlt_tax" id="tlt_tax" class="form-control" value="0" onkeyup="cal_tax();">
									 <input type="hidden" name="tax_amount" id="tax_amount" value="0.00">
								</div>
							</div>
							<div class="form-group" style="margin:0px;padding: 5px;">
								<table class="table" style="margin-bottom:0px;">
									<tbody><tr><th class="text-left" style="background:#cffbcf;padding:5px;font-size:20px;">Total Sale</th>
									<th class="text-right" style="background:#cffbcf;padding:5px;font-size:20px;" id="TLT_AMOUNTS">USD <span id="TLT_AMOUNT">0.00</span></th>
								</tr></tbody></table>
							</div>
							<div class="form-group" style="margin:0px;margin-bottom:5px;">
								<label class="col-md-3 control-label">Add Payment:</label>
								<div class="col-md-3">
								<select name="pay_method" id="pay_method" class="form-control">
									<option value="Cash">Cash</option>
									<option value="Bank Deposit">Bank Deposit</option>
									<option value="Cheque">Cheque</option>
									<option value="Credit Card">Credit Card</option>
									<option value="Credit">Credit Sale</option>
								</select>
								</div>
								<div class="col-md-2"><input type="number" name="paid_amt" id="paid_amt" class="form-control" onkeyup="chk_balance();"></div>
								<label class="col-md-2 control-label">Balance:</label>
								<div class="col-md-2"><input type="text" name="balance" id="balance" class="form-control" readonly="Yes"></div>
							</div>
							<div class="form-group" style="margin:0px;margin-bottom:5px;">
								<!--<div class="col-md-2 col-xs-4"><button type="button" name="rtn_btn" id="rtn_btn" class="btn btn-warning" style="width:100%;"><div><span class="glyphicon glyphicon-share-alt"></span></div><div>Return</div></button></div>-->
								<div class="col-md-3 col-xs-6"><button type="button" name="can_btn" id="can_btn" class="btn btn-danger" onclick="cancel_sale();" style="width:100%;"><div><span class="glyphicon glyphicon-trash"></span></div><div>Cancel (F6)</div></button></div>
								<div class="col-md-3 col-xs-6"><button type="button" name="save_btn" id="save_btn" class="btn btn-primary" onclick="save_sale();" style="width:100%;"><div><span class="glyphicon glyphicon-floppy-disk"></span></div><div>Save (F7)</div></button></div>
								<div class="col-md-6 col-xs-12"><button type="button" name="pay_btn" id="pay_btn" class="btn btn-success" onclick="submit_sale();" style="width:100%;"><div style="font-weight:bold;">USD</div><div>Pay Now (F8)</div></button></div>
							</div>
							<div class="form-group" style="margin:0px;margin-bottom:0px;">
								<input type="hidden" name="cust_id" id="cust_id" value="">
								<div class="col-md-10"><input type="text" name="customer_name" id="customer_name" class="form-control ac_input" placeholder="Search a Customer..." autocomplete="off"></div>
																								<div class="col-md-2"><a href="new_quick_cust.php" class="btn btn-primary form-control" data-target="#new-customer-modal" data-toggle="modal"><span class="glyphicon glyphicon-plus"></span></a></div>
																<div id="cust_detail"></div>
								</div>
							</div>
						</div>
					</div>
					<input type="hidden" name="rowid" id="rowid" value="1">
					<input type="hidden" name="total_sale" id="total_sale" value="0.00">
					<input type="hidden" class="paid_amount" name="paid_amount" id="paid_amount" value="0">
				</div>
			</form>
			          </div>
		  
        </div>
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>

<div class="modal fade bs-modal-lg" id="new-customer-modal" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content"></div>
    </div>
</div>
<div class="modal fade bs-modal-lg" id="new-item-modal" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content"></div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>
 