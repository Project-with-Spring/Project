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
    });
});
</script>