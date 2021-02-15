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
					<ul class ="manu_sel">
					<c:forEach var="pdt" items="${pdtList }">
					<c:if test="${ctg.ctg_id==pdt.ctg_id }">
					<li data-hidden="${pdt.pdt_id}" data-options='{"name":"${pdt.pdt_name}","cost":"${pdt.pdt_cost}"}'>${pdt.pdt_name}<br>(${pdt.pdt_cost })원</li>
					</c:if>
					</c:forEach>
					</ul>
					</div>
					</c:if>
					<c:if test="${vs.index!=0}">
					<div id="ctg${ctg.ctg_id}" class="pdt">
					<ul class ="manu_sel">
					<c:forEach var="pdt" items="${pdtList }">
					<c:if test="${ctg.ctg_id==pdt.ctg_id }">
					<li data-hidden="${pdt.pdt_id}" data-options='{"name":"${pdt.pdt_name}","cost":"${pdt.pdt_cost}"}'>${pdt.pdt_name}<br>(${pdt.pdt_cost })원</li>
					</c:if>
					</c:forEach>
					</ul>
					</div>
					</c:if>
					</c:forEach>
					
																	</div>
					<div id="save_order" class="clearfix">
					<div class="col-md-9 hidden-xs" style=" margin-bottom: 10px;">
						<div class="table-responsive" style="border:solid 1px #CCC;padding:5px; background-color: #cffbcf;" >
							<h4 class="text-center" style="margin-top:0px;">최근 저장된 주문</h4>
							<div id="recent_sales"></div>
						</div>
					</div>
					<div class="col-md-3 hidden-xs">
						<div class="table-responsive" id="getSaveOrder" style="border:solid 1px #CCC;padding:7.4px;">
							<h4 class="text-center" style="margin-top:0px;margin-bottom:5px; ">주문 불러오기</h4>
						</div>
					</div>
					<div style="padding: 5px; width: 100%;">
					<div class="table-responsive" style="border:solid 1px #CCC;overflow-y: auto;padding:5px;width: 100%;height: 172px;max-height: 172px;">
					<table style="width: 100%;" class="saveOrder">
						<thead>
						<tr><td class="tac">주문 번호</td><td class="tac">날짜</td><td class="tac">금액</td><td class="tac">메모</td><td></td></tr>
						</thead>
						<tbody id="save_order_list" >
						<c:forEach var="ord" items="${ordList }" varStatus="vs">
						<tr><td class="tac">${ord.ord_id }</td><td class="tac">${ord.ord_date }</td><td class="tac">${ord.ord_total }</td><td class="tac">${ord.ord_memo }</td>
						<td class="tac"><a id="delete_saveorder" href="#" data-hidden="${ord.ord_id }"class="btn btn-danger btn-xs btnDelete"><span class="glyphicon glyphicon-remove"></span></a></td></tr>
						</c:forEach>
						</tbody>
					</table>
						
					</div>
					</div>
					
					
				</div>
				<div id="manu_detail" style="display: none;">
				<div class="clearfix menubtn">
				<div class="col-md-3 col-xs-6" style="height: 55px; margin-top: 10px">
			              	<button type="button" id="return_save" name="btn_filter" class="btn btn-success form-control dateBtn"style="height: 100%;">이전</button>
			             </div>
				<div class="col-md-3 col-xs-6" style="height: 55px; margin-top: 10px">
			              	<button type="button" name="btn_filter" class="btn btn-primary form-control dateBtn"style="height: 100%;" value="shot" data-hidden="500">샷 추가</button>
			             </div>
			    <div class="col-md-3 col-xs-6" style="height: 55px; margin-top: 10px">
			              	<button type="button" name="btn_filter" class="btn btn-primary form-control dateBtn"style="height: 100%;" value="doubleShot" data-hidden="1000">샷 더블 추가</button>
			             </div>
			             <div class="col-md-3 col-xs-6" style="height: 55px; margin-top: 10px">
			              	<button type="button" name="btn_filter" class="btn btn-primary form-control dateBtn"style="height: 100%;" value="iceUp" data-hidden="0">얼음 많이</button>
			             </div>
			             <div class="col-md-3 col-xs-6" style="height: 55px; margin-top: 10px">
			              	<button type="button" name="btn_filter" class="btn btn-primary form-control dateBtn"style="height: 100%;" value="minshot" data-hidden="-500">샷 빼기</button>
			             </div>
			             <div class="col-md-3 col-xs-6" style="height: 55px; margin-top: 10px">
			              	<button type="button" name="btn_filter" class="btn btn-primary form-control dateBtn"style="height: 100%;" value="cream" data-hidden="500">휘핑 추가</button>
			             </div>
			             <div class="col-md-3 col-xs-6" style="height: 55px; margin-top: 10px">
			              	<button type="button" name="btn_filter" class="btn btn-primary form-control dateBtn"style="height: 100%;" value="sizeUp" data-hidden="500">사이즈 업</button>
			             </div>
			             <div class="col-md-3 col-xs-6" style="height: 55px; margin-top: 10px">
			              	<button type="button" name="btn_filter" class="btn btn-primary form-control dateBtn"style="height: 100%;" value="iceDown" data-hidden="0">얼음 작게</button>
			             </div>
			             <div class="col-md-3 col-xs-6" style="height: 55px; margin-top: 10px">
			              	<button type="button" name="btn_filter" class="btn btn-primary form-control dateBtn"style="height: 100%;" value="milk" data-hidden="600">우유 추가</button>
			             </div>
			             <div class="col-md-3 col-xs-6" style="height: 55px; margin-top: 10px">
			              	<button type="button" name="btn_filter" class="btn btn-primary form-control dateBtn"style="height: 100%;" value="pearl" data-hidden="600">펄 추가</button>
			             </div>
			             <div class="col-md-3 col-xs-6" style="height: 55px; margin-top: 10px">
			              	<button type="button" name="btn_filter" class="btn btn-primary form-control dateBtn"style="height: 100%;" value="syrup" data-hidden="0">시럽 추가</button>
			             </div>
			             <div class="col-md-3 col-xs-6" style="height: 55px; margin-top: 10px">
			              	<button type="button" name="btn_filter" class="btn btn-primary form-control dateBtn"style="height: 100%;" value="money" data-hidden="1000">사장님 용돈주기</button>
			             </div>
				</div>
				</div>
				</div>
				<div class="col-md-6 col-sm-6">
					<div class="form-group" style="margin:0px;">
						<div class="col-md-10 col-sm-8 col-xs-8"><input type="text" name="txt_search" id="txt_search" value="" class="form-control ac_input" placeholder="주문 리스트 검색" autocomplete="off"></div>
						<div class="col-md-1 col-sm-2 col-xs-2">
							<button type="button" name="search_prod" id="search_prod" class="btn btn-success form-control" onclick="javascript:print_sub('search_item.php',800,600);" title="SEARCH PRODUCTS (F4)"><span class="glyphicon glyphicon-search"></span></button>
						</div>
																		<div class="col-md-1 col-sm-2 col-xs-2"><a href="new_quick_item.php" class="btn btn-primary form-control" data-target="#new-item-modal" data-toggle="modal" title="ADD NEW PRODUCT"><span class="glyphicon glyphicon-plus"></span></a></div>
											</div>
					<div class="table-responsive main_sale_table" style="padding: 5px; min-height: 550px; max-height: 550px; overflow: hidden scroll;" id="sales_items">
						<table class="table tbl_narrow table-responsive" style="font-size:12px;" id="inv_detail">
							<thead>
							<tr>
								<th width="50%" style="min-width:200px;">메뉴 이름</th>
								<th style="min-width:50px;">가격</th>
								<th style="min-width:40px;">할인(%)</th>
								<th style="min-width:40px;">수량</th>
								<th style="min-width:60px;">상품 총액</th>
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
							</tr> -->
							
						<tbody id="order_list">
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
									  <label>결제일</label>
									 <input type="text" name="sale_date" id="sale_date" class="form-control" value="17-01-2021" readonly="Yes">
								</div>
								<div class="col-md-1 col-xs-4">
									  <label>메뉴 수</label>
									 <input type="text" name="total_items" id="total_items" class="form-control" value="0" readonly="Yes">
								</div>
								<div class="col-md-2 col-xs-4">
									  <label>총 개수</label>
									 <input type="text" name="total_qty" id="total_qty" class="form-control" value="0" readonly="Yes">
								</div>
								<div class="col-md-2 col-xs-4">
									  <label>총 금액</label>	
									 <input type="text" name="sub_total" id="sub_total" class="form-control" value="0" readonly="Yes">
								</div>
								<div class="col-md-2 col-xs-4">
									  <label>포인트 사용</label>
									 <input type="number" name="tlt_dist" id="tlt_dist" class="form-control" value="0" readonly="readonly" onchange="pointSale(this);" step="100">
								</div>
								<div class="col-md-2 col-xs-4">
									  <label>적립 포인트</label>
									 <input type="text" name="tlt_tax" id="tlt_tax" class="form-control" value="0" readonly="Yes">
								</div>
							</div>
							<div class="form-group" style="margin:0px;padding: 5px;">
								<table class="table" style="margin-bottom:0px;">
									<tbody><tr><th class="text-left" style="background:#cffbcf;padding:5px;font-size:20px;">Total Sale</th>
									<th class="text-right" style="background:#cffbcf;padding:5px;font-size:20px;" id="TLT_AMOUNTS"> <span id="TLT_AMOUNT">0 </span>원</th>
								</tr></tbody></table>
							</div>
							<div class="form-group" style="margin:0px;margin-bottom:5px;">
								<label class="col-md-3 control-label"><input type ="button" id="resetPhone" value="초기화" style="display: none;"> 회원 번호</label>
								<div class="col-md-2"><input type="text" placeholder="'-'를 제외한 전화번호" name="paid_amt" id="phoneNumber" class="form-control" ></div>
								<div class="col-md-3">
								<select name="pay_method" id="pay_method" class="form-control">
									<option value="Cash">Cash</option>
									<option value="Bank Deposit">Bank Deposit</option>
									<option value="Cheque">Cheque</option>
									<option value="Credit Card">Credit Card</option>
									<option value="Credit">Credit Sale</option>
								</select>
								</div>
								<label class="col-md-2 control-label"><input type="button" value="전액" id="maxPoint" style="display: none;"> 잔여 포인트</label>
								<div class="col-md-2"><input type="text" name="balance" id="balance" class="form-control" readonly="Yes"></div>
							</div>
							<div class="form-group" style="margin:0px;margin-bottom:5px;">
								<!--<div class="col-md-2 col-xs-4"><button type="button" name="rtn_btn" id="rtn_btn" class="btn btn-warning" style="width:100%;"><div><span class="glyphicon glyphicon-share-alt"></span></div><div>Return</div></button></div>-->
								<div class="col-md-3 col-xs-6"><button type="button" name="can_btn" id="can_btn" class="btn btn-danger" style="width:100%;"><div><span class="glyphicon glyphicon-trash"></span></div><div>취소 (F6)</div></button></div>
								<div class="col-md-3 col-xs-6"><button type="button" name="save_btn" id="save_btn" class="btn btn-primary" style="width:100%;"><div><span class="glyphicon glyphicon-floppy-disk"></span></div><div>저장 (F7)</div></button></div>
								<div class="col-md-6 col-xs-12"><button type="button" name="sale_btn" id="sale_btn" class="btn btn-success" style="width:100%;"><div style="font-weight:bold;">WON</div><div>결제 (F8)</div></button></div>
							</div>
							<div class="form-group" style="margin:0px;margin-bottom:0px;">
								<input type="hidden" name="cust_id" id="cust_id" value="">
								<div class="col-md-10"><input type="text" name="customer_name" id="ord_memo" class="form-control ac_input" placeholder="고객 요청사항" autocomplete="off"></div>
																								<div class="col-md-2"><a href="loginOut" class="btn btn-primary form-control" id="stf_id" data-hidden="${sessionScope.stf_id}" >판매자:${sessionScope.stf_name}</a></div>
																<div id="cust_detail"></div>
								</div>
							</div>
						</div>
					</div>
<!-- 					내가 만든거 아님 추후에 필요할까봐 일단남겨둠 -->
<!-- 					<input type="hidden" name="rowid" id="rowid" value="1"> -->
<!-- 					<input type="hidden" name="total_sale" id="total_sale" value="0.00"> -->
<!-- 					<input type="hidden" class="paid_amount" name="paid_amount" id="paid_amount" value="0"> -->
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
 