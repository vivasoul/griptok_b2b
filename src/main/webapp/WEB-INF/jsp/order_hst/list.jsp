<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="./common/js/common.js"></script>
<script src="./lib/js/jquery.min.js"></script>
<link rel="stylesheet" href="./lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/margin.css">

<script src="./lib/datatable/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="./lib/datatable/jquery.dataTables.min.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="m-b-lg">
				<div class="col-md-12 m-t-sm" style="background-color: LightGray">
					<font style="font-weight: bold">주문 배송 조회</font>
				</div>
				<div class="col-md-12">
					<p class="m-t-sm m-b-md">
						[주문번호]를 클릭하시면 주문 상세 내역 및 상품별 배송현황을 조회하실 수 있습니다<br>
						배송지 변경, 구매 취소/변경, 반품/교환은 상세 주문 내역에서 바로 신청하실 수 있습니다
					</p>
				</div>
			</div>
		</div>
		<div class="row m-b-md">
			<div class="pull-left">
				<input type="button" value="1개월" class="gtk-btn gtk-btn-sm gtk-btn-line-white js-filter-month" data-month="-1"/>
				<input type="button" value="3개월" class="gtk-btn gtk-btn-sm gtk-btn-line-white js-filter-month" data-month="-3"/>
				<input type="button" value="12개월" class="gtk-btn gtk-btn-sm gtk-btn-line-white js-filter-month" data-month="-12"/>
			</div>
			<div class="pull-right">
				<select class="form-control" id="sel-order-status">
				  <option>전체상태</option>
				  <option>진행중인주문</option>
				  <option>완료된주문</option>
				</select>
			</div>
		</div>
		<div class="row m-b-md">
			<table id="example" class="table table-striped table-bordered hover">
				<thead>
					<tr>
						<th data-column = "reg_dt">주문일자</th>
						<th data-column = "order_no">주문번호</th>
						<th data-column = "order_title">상품명</th>
						<th data-column = "tot_order_cost">주문금액</th>
						<th data-column = "order_status">배송단계</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="each" items="${arr }">
					<tr>
						<td>${each.reg_dt }</td>
						<td>${each.order_no }</td>
						<td>${each.order_title }</td>
						<td><fmt:formatNumber value="${each.tot_order_cost}" pattern="#,###" />원</td>
						<td>${each.order_status }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
<script>
$(document).ready(function() {
	// DataTable initialisation 
	const exampleTable = griptok.component.datatable('example');
	exampleTable.create(null,{
		columnDefs: [
			{
				"targets": [1], 
				render: function (pOrderNo) { 
					return '<a href="ordered/view?id=' + pOrderNo + '">' + pOrderNo +'</a>'; 
				} 
			}
		]
	});
	
	const initData = exampleTable.getRows();
	/****************************************
	* EVENT TRIGGER START
	*****************************************/
	$('#sel-order-status').on('change',function(){
		const optionValue = $(this).val();
		
		const filtered = initData.filter(function(x){
			return (x['order_status'] === optionValue) ? true : (optionValue === '전체상태' ? true:false)
		})
		
		exampleTable.reload(filtered);
	});
	
	$('.js-filter-month').on('click',function(){
		const attrValue = $(this).attr('data-month');
		const minDate = griptok.date.manipulate(new Date(),{
			"month" : attrValue,
			"split" : "/"
		});
		
		const filtered = initData.filter(function(x){
			return (new Date(x['reg_dt']).getTime() >= new Date(minDate).getTime());
		})
		exampleTable.reload(filtered);
	})
});
</script>
</body>
</html>