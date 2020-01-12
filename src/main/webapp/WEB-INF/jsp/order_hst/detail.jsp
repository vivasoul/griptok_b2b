<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="../common/js/common.js"></script>
<script src="../lib/js/jquery.min.js"></script>
<link rel="stylesheet" href="../lib/bootstrap/css/bootstrap.min.css">

<script src="../lib/datatable/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="../lib/datatable/jquery.dataTables.min.css">
<link rel="stylesheet" href="../css/margin.css">
<link rel="stylesheet" href="../css/shopping/order_hst_detail.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row m-t-md">
			<div class="bg-lightGray">
				<font class="font-weight-bold font-size-md">주문 배송 조회/ 주문 상세 내역</font>
			</div>
		</div>
		<div class="row m-t-lg">
			<table class="table table-bordered">
				<tr>
					<td class="col-md-4">
						<div class="col-md-4">
							<font class="font-weight-bold font-size-md">주문일자</font>
						</div>
						<div class="col-md-8">${one.order_dt } </div>
					</td>
					<td class="col-md-6">
						<div class="col-md-3"><font class="font-weight-bold font-size-md">주문번호</font></div>
						<div class="col-md-9">${one.order_no } </div>
					</td>
					<td class="col-md-2">
						<div class="row col-md-12 text-center">
							<input type="button" value="거래명세서 발급" id="btn-transaction" class="gtk-btn gtk-btn-sm pull-center"/>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="row">
			<div style="background-color: transparent">
				<font style="font-weight: bold">배송정보</font>
			</div>
		</div>
		<div class="row">
			<table id="custom-css-table" class="table">
				<tbody>
					<tr>
						<th>송장번호</th>
						<td>${one.invoice_no}</td>
					</tr>
					<tr>
						<th>주문자</th>
						<td>${one.sender}</td>
					</tr>
					<tr>
						<th>받는사람</th>
						<td>${one.receiver}</td>
					</tr>
					<tr>
						<th>출고시 참고사항</th>
						<td>${one.memo}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="row">
			<div style="background-color: transparent">
				<font style="font-weight: bold">주문상품 정보</font>
			</div>
		</div>
		<div class="row">
			<table id="example" class="table table-striped table-bordered hover">
				<thead>
					<tr>
						<th data-column = "order_dt">주문일자</th>
						<th data-column = "order_no">주문번호</th>
						<th data-column = "title">상품명</th>
						<th data-column = "order_cnt">수량</th>
						<th data-column = "order_cost">주문금액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="each" items="${arr }">
						<tr>
							<td>${one.order_dt }</td>
							<td>${each.order_no }</td>
							<td>${each.title }</td>
							<td>${each.order_cnt }개</td>
							<td><fmt:formatNumber value="${each.order_cost}" pattern="#,###" />원</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
<script>
$(document).ready(function() {
	$('#custom-css-table th').css({
		'background-color':'LightGray',
		'width':'20%',
		'text-align':'center'
	})
	griptok.component.datatable('example').create(null,{
		  "lengthChange": false
	} );
});
</script>
</body>
</html>