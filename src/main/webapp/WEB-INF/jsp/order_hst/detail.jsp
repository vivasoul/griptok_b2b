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
		<div class="row">
			<div class="col-md-12">
				<p style="margin-left: 18px;margin-top: 17px;margin-bottom:20px;">
					<font color="gray">입금대기중에 한하여 배송지 변경 및 주문취소가 가능 합니다.</font>
				</p>
			</div>
		</div>
		<div class="row">
			<table class="table table-bordered" style="border-style: sold;border-width:8px;">
				<tr style="height:75px;">
					<td class="col-md-4" >
						<div class="col-md-4" style="text-align: center;margin-top: 20px;">
							<font class="font-weight-bold font-size-md">주문일자:</font>
						</div>
						<div class="col-md-8" style="text-align: left;margin-top: 20px;">${one.order_dt }</div>
					</td>
					<td class="col-md-6">
						<div class="col-md-3" style="text-align: center;margin-top: 20px;">
							<font class="font-weight-bold font-size-md">주문번호:</font>
						</div>
						<div class="col-md-9" style="text-align: left;margin-top: 20px;">${one.order_no } </div>
					</td>
					<td class="col-md-2">
						<div class="row col-md-12 text-center" style="text-align: center;margin-top: 13px;">
							<input type="button" value="거래명세서 발급" id="btn-transaction" 
							class="gtk-btn gtk-btn-blue gtk-btn-sm pull-center" style="height:35px;width:153px;"/>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="row" style="margin-top:10px;">
			<div style="background-color: transparent;">
				<ul style="list-style-type: square;padding-left: 15px;">
					<li><font style="font-weight: bold">배송정보</font></li>
				</ul>
			</div>
		</div>
		<div class="row">
			<table id="custom-css-table" class="table table-bordered">
				<tbody>
					<tr>
						<th>송장번호</th>
						<td><font style="color: red;margin-left: 20px;">${one.invoice_no}</font></td>
					</tr>
					<tr>
						<th>주문자</th>
						<td><font style="margin-left:20px;">${one.sender}</font></td>
					</tr>
					<tr>
						<th>받는사람</th>
						<td>
							<div class="col-md-12">
								<div class="col-md-9">
									<font style="margin-left:20px;">${one.receiver}</font>
								</div>
								<div class="col-md-3" style="text-align: right;">
									<input type="button" value="배송지 변경" id="shipto-btn" 
										class="gtk-btn gtk-btn-sm pull-center" style="height:20px;width:120px;"/>
								</div>							
							</div>
						</td>
					</tr>
					<tr>
						<th>출고시 참고사항</th>
						<td><font style="margin-left:20px;">${one.memo}</font></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="row" style="margin-top:10px;">
			<div style="background-color: transparent;">
				<ul style="list-style-type: square;padding-left: 15px;">
					<li><font style="font-weight: bold">주문상품 정보</font></li>
				</ul>
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
		'background-color':'#f5f5f5',
		'font-weight':'normal',
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