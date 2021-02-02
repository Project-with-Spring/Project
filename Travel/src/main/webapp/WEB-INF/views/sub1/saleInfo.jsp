<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/header"/>
<link rel="stylesheet" href="<c:url value="/resources/css/salesHistory.css"/>">
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>판매내역</h1>
      <ol class="breadcrumb">
        <li><a href="https://activepos.net/active/index.php"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">판매내역</li>
      </ol>
    </section>    
    
    <!-- Main content -->
    <section class="content">
    
    <div class="box">
    	<div class="box-header with-border">
          <h3 class="box-title">판매 현황</h3>
          <div class="box-tools pull-right">
          <a href="<c:url value="saleInfo?dateType=0&totalType="/><c:if test="${param.totalType != null }">${param.totalType }</c:if>" class="btn btn-<c:choose><c:when test="${param.dateType != null and param.dateType == 0 }">primary</c:when><c:otherwise>success</c:otherwise></c:choose> btn-sm"><i class="fa fa-calendar-day"></i> 일별현황</a>
          <a href="<c:url value="saleInfo?dateType=1&totalType="/><c:if test="${param.totalType != null }">${param.totalType }</c:if>" class="btn btn-<c:choose><c:when test="${param.dateType != null and param.dateType == 1 }">primary</c:when><c:otherwise>success</c:otherwise></c:choose> btn-sm"><i class="fa fa-calendar-alt"></i> 월별현황</a>
          <a href="<c:url value="saleInfo?dateType=2&totalType="/><c:if test="${param.totalType != null }">${param.totalType }</c:if>" class="btn btn-<c:choose><c:when test="${param.dateType != null and param.dateType == 2 }">primary</c:when><c:otherwise>success</c:otherwise></c:choose> btn-sm"><i class="fa fa-calendar"></i> 연도별현황</a>
          <c:choose>
          <c:when test="${param.totalType != null && param.totalType == 1 }">
          <a href="<c:url value="saleInfo?totalType=0&dateType="/><c:if test="${param.dateType != null }">${param.dateType }</c:if>" class="btn btn-primary btn-sm"><i class="fa fa-dollar-sign"></i> 할인포함</a>
          </c:when>
          <c:otherwise>
          <a href="<c:url value="saleInfo?totalType=1&dateType="/><c:if test="${param.dateType != null }">${param.dateType }</c:if>" class="btn btn-success btn-sm"><i class="fa fa-search-dollar"></i> 할인제외</a>
          </c:otherwise>
          </c:choose>
          <a href="<c:url value="salesHistory"/>" class="btn btn-success btn-sm"><i class="fa fa-list"></i> 판매내역 리스트</a>
          </div>
        </div>
        <div class="box-body">
			<div id="line-chart-1"></div>
        </div>
        
        <div class="box-header with-border">
          <h3 class="box-title">인기 상품</h3>
        </div>
        <div class="box-body">
        	<div id="pie-chart-2" style="width:100%"></div>
        </div>
        
        <div class="box-header with-border">
          <h3 class="box-title"><c:choose>
          <c:when test="${param.dateType == 1 }">월별</c:when>
          <c:when test="${param.dateType == 2 }">연도별</c:when>
          <c:otherwise>일별</c:otherwise>
          </c:choose>상품 판매현황</h3>
          <hr>
          <form action="<c:url value='saleInfo'/>" method="get">
          <input type="hidden" name="dateType" value="${param.dateType }">
       	 	<div class="form-group">
			  	<div class="col-md-2"><span style="color : rgb(14, 158, 74);">ITEM 1 : </span>
			  	<select name="pdt_name1" class="form-control select2">
			  	<c:forEach var="pdt" items="${pdtList }">
			  	<option <c:if test="${pdt.pdt_name eq chartBarList1[0].pdt_name }">selected</c:if>>${pdt.pdt_name }</option>
			  	</c:forEach>
			  	</select></div>
			  	<div class="col-md-2"><span style="color : rgb(70, 128, 255);">ITEM 2 : </span>
			  	<select name="pdt_name2" class="form-control select2">
			  	<c:forEach var="pdt" items="${pdtList }">
			  	<option <c:if test="${pdt.pdt_name eq chartBarList2[0].pdt_name }">selected</c:if>>${pdt.pdt_name }</option>
			  	</c:forEach>
			  	</select></div>
			  	<div class="col-md-2"><span style="color : rgb(255, 82, 82);">ITEM 3 : </span>
			  	<select name="pdt_name3" class="form-control select2">
			  	<c:forEach var="pdt" items="${pdtList }">
			  	<option <c:if test="${pdt.pdt_name eq chartBarList3[0].pdt_name }">selected</c:if>>${pdt.pdt_name }</option>
			  	</c:forEach>
			  	</select></div>
			  	<div class="col-md-2" style="float: right;">
			  	<button class="btn btn-success form-control">필터</button>
			  	</div>
			</div>
			</form>
        </div>
        <div class="box-body">
        	<div id="bar-chart-1" style="width:100%"></div>
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

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/js/DataTables/datatables.min.css?ver=1"/>"/>
<c:import url="/footer"/>
<script src="<c:url value="/resources/js/plugins/apexcharts.min.js"/>"></script>
<script type="text/javascript">
$(document).ready(function() {
    setTimeout(function() {
        $(function() {
            var options = {
                chart: {
                    height: 300,
                    type: 'line',
                    zoom: {
                        enabled: false
                    }
                },
                dataLabels: {
                    enabled: false,
                    width: 2,
                },
                stroke: {
                    curve: 'straight',
                },
                colors: ["#00a65a"],
                series: [{
                    name: "판매액<c:if test="${param.totalType == 1}">(할인 제외)</c:if>",
                    data: [${chartList[8].ord_total}, 
                    	${chartList[7].ord_total}, 
                    	${chartList[6].ord_total}, 
                    	${chartList[5].ord_total}, 
                    	${chartList[4].ord_total}, 
                    	${chartList[3].ord_total}, 
                    	${chartList[2].ord_total}, 
                    	${chartList[1].ord_total}, 
                    	${chartList[0].ord_total}]
                }],
                title: {
                    text: 
					<c:choose>
						<c:when test="${param.dateType == 2}">
						'연도별 판매 현황'
						</c:when>
						<c:when test="${param.dateType == 1}">
						'월별 판매 현황'
						</c:when>
						<c:otherwise>
						'일별 판매 현황'
						</c:otherwise>
					</c:choose>
                        ,
                    align: 'left'
                },
                grid: {
                    row: {
                        colors: ['#f3f6ff', 'transparent'], // takes an array which will be repeated on columns
                        opacity: 0.5
                    },
                },
                xaxis: {
                    categories: [
                    	'${chartList[8].date}', 
                    	'${chartList[7].date}', 
                    	'${chartList[6].date}', 
                    	'${chartList[5].date}', 
                    	'${chartList[4].date}', 
                    	'${chartList[3].date}', 
                    	'${chartList[2].date}', 
                    	'${chartList[1].date}', 
                    	'${chartList[0].date}'],
                }
            }

            var chart = new ApexCharts(
                document.querySelector("#line-chart-1"),
                options
            );
            chart.render();
        });
        
        $(function() {
            var options = {
                chart: {
                    height: 320,
                    type: 'donut',
                },
                series: [${popularityChart[0].odt_count}, ${popularityChart[1].odt_count}, ${popularityChart[2].odt_count}, ${popularityChart[3].odt_count}, ${popularityChart[4].odt_count}],
                colors: ["#4680ff", "#0e9e4a", "#00acc1", "#ffba57", "#ff5252"],
                labels: ['${popularityChart[0].pdt_name}', '${popularityChart[1].pdt_name}', '${popularityChart[2].pdt_name}', '${popularityChart[3].pdt_name}', '${popularityChart[4].pdt_name}'],
                legend: {
                    show: true,
                    position: 'bottom',
                },
                plotOptions: {
                    pie: {
                        donut: {
                            labels: {
                                show: true,
                                name: {
                                    show: true
                                },
                                value: {
                                    show: true
                                }
                            }
                        }
                    }
                },
                dataLabels: {
                    enabled: true,
                    dropShadow: {
                        enabled: false,
                    }
                },
                responsive: [{
                    breakpoint: 480,
                    options: {          
                        legend: {
                            position: 'bottom'
                        }
                    }
                }]
            }
            var chart = new ApexCharts(
                document.querySelector("#pie-chart-2"),
                options
            );
            chart.render();
        });
        $(function() {
            var options = {
                chart: {
                    height: 350,
                    type: 'bar',
                },
                plotOptions: {
                    bar: {
                        horizontal: false,
                        columnWidth: '55%',
                        endingShape: 'rounded'
                    },
                },
                dataLabels: {
                    enabled: false
                },
                colors: ["#0e9e4a", "#4680ff", "#ff5252"],
                stroke: {
                    show: true,
                    width: 2,
                    colors: ['transparent']
                },
                series: [{
                    name: '${chartBarList1[0].pdt_name}',
                    data: [${chartBarList1[6].odt_count}, 
                        ${chartBarList1[5].odt_count}, 
                        ${chartBarList1[4].odt_count}, 
                        ${chartBarList1[3].odt_count}, 
                        ${chartBarList1[2].odt_count}, 
                        ${chartBarList1[1].odt_count}, 
                        ${chartBarList1[0].odt_count}]
                },
                {
                    name: '${chartBarList2[0].pdt_name}',
                    data: [${chartBarList2[6].odt_count}, 
                        ${chartBarList2[5].odt_count}, 
                        ${chartBarList2[4].odt_count}, 
                        ${chartBarList2[3].odt_count}, 
                        ${chartBarList2[2].odt_count}, 
                        ${chartBarList2[1].odt_count}, 
                        ${chartBarList2[0].odt_count}]
                },
                {
                    name: '${chartBarList3[0].pdt_name}',
                    data: [${chartBarList3[6].odt_count}, 
                        ${chartBarList3[5].odt_count}, 
                        ${chartBarList3[4].odt_count}, 
                        ${chartBarList3[3].odt_count}, 
                        ${chartBarList3[2].odt_count}, 
                        ${chartBarList3[1].odt_count}, 
                        ${chartBarList3[0].odt_count}]
                }],
                xaxis: {
                    categories: ['${chartBarList1[6].date}', 
                        '${chartBarList1[5].date}', 
                        '${chartBarList1[4].date}', 
                        '${chartBarList1[3].date}', 
                        '${chartBarList1[2].date}', 
                        '${chartBarList1[1].date}', 
                        '${chartBarList1[0].date}'],
                },
                yaxis: {
                    title: {
                        text: 'count'
                    }
                },
                fill: {
                    opacity: 1

                },
                tooltip: {
                    y: {
                        formatter: function(val) {
                            return  val + " 개 판매"
                        }
                    }
                }
            }
            var chart = new ApexCharts(
                document.querySelector("#bar-chart-1"),
                options
            );
            chart.render();
        });
        
    });
});
</script>