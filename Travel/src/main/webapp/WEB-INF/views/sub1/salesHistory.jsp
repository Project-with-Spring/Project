<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:import url="/header"/>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>Sales History</h1>
      <ol class="breadcrumb">
        <li><a href="https://activepos.net/active/index.php"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Sales History</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	      <!-- Default box -->
      <div class="box">
	  	<div class="box-header with-border">
          <h3 class="box-title"></h3>
          <div class="box-tools pull-right"><a href="javascript:print_opt();" class="btn btn-success btn-sm">Print</a> <a href="new_sale.php" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Add New</a></div>
        </div>
		<script>
		function print_opt()
		{
			var URL = 'sales_print.php?txt_search='+$('#txt_search').val()+'&from='+$('#from').val()+'&to='+$('#to').val()+'&branch_id='+$('#branch_id').val()+'&cust_id='+$('#cust_id').val()+'&user_id='+$('#user_id').val()+'&pstatus='+$('#pstatus').val();
			print_sub(URL,800,600);
		}
		</script>
        <div class="box-body">
  	       <div id="my_all">
			<form name="frm_filter" id="frm_filter" method="get" action="/active/sales/sales.php" class="form-horizontal">
			<div class="form-group">
				<div class="col-md-2"><input type="text" name="from" id="from" value="" class="form-control txtdate" readonly="Yes"></div>
			  	<div class="col-md-2"><input type="text" name="to" id="to" value="" class="form-control txtdate" readonly="Yes"></div>
								<div class="col-md-3">
				<select name="branch_id" id="branch_id" class="form-control">
										<option value="94" selected>enter : </option>
									</select>
			  </div>
			  			</div>
			<div class="form-group">
              <div class="col-md-3"><input type="text" name="txt_search" id="txt_search" value="" class="form-control" placeholder="Search any Sale"></div>
			  <div class="col-md-3">
			  	<select name="cust_id" id="cust_id" class="form-control select2" style="width:100%;">
				<option value="">~ Select Customer ~</option>
								</select>
			  </div>
              <div class="col-md-2">
				<select name="user_id" id="user_id" class="form-control">
					<option value="">~ Users ~</option>
										<option value="3785">jy12356@naver.com</option>
									</select>
			  </div>
			  <div class="col-md-2">
				<select name="pstatus" id="pstatus" class="form-control">
					<option value="">~ Status ~</option>
					<option value="Pending">Pending</option>
					<option value="Paid">Paid</option>
				</select>
			  </div>
			  <div class="col-md-1">
              	<button name="btn_filter" class="btn btn-primary form-control">Filter</button>
              </div>
          </div>	
        </form>
		
        <div class="table-responsive no-padding">
          <table class="table table-striped table-responsive tbl_narrow">
            <thead>
                <tr>
                  <th>#</th>
                    <th>Sale ID</th>
                    <th>Date</th>
					<th>Customer Name</th>
					<th>Qty</th>
					<th class="text-right">&nbsp;</th>
					<th class="text-right">Amount</th>
					<th class="text-right">Rcvd</th>
					<th class="text-right">Balance</th>
                    <th width="10%">Status</th>
                    <th></th>
                </tr>
  				</thead>
								<tr>
					<td colspan="11">
						No Record Found					</td>
				</tr>
				              </table>
             </div>
          </div>
		  
        </div>
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
<div class="modal fade bs-modal-lg" id="my-ajax-modal" role="basic" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content"></div>
    </div>
</div>
<script src="<c:url value="/resources/js/salesHistory.js"/>"></script>
<c:import url="/footer"/>