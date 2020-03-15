<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/shopping/order_hst_detail.css">
<script src="/lib/datatable/jquery.dataTables.min.js"></script>
<script src="/lib/bootbox/bootbox.min.js"></script>
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
					<div class="col-md-4" style="text-align: center;">
						<font class="font-weight-bold font-size-md">주문일자:</font>
					</div>
					<div class="col-md-8" style="text-align: left;">
						<span id="span-order-dt">
							${one.order_dt }
						</span>
					</div>
				</td>
				<td class="col-md-6">
					<div class="col-md-3" style="text-align: center;">
						<font class="font-weight-bold font-size-md">주문번호:</font>
					</div>
					<div class="col-md-9" style="text-align: left;">${one.order_no } </div>
					<input type="hidden" id="v_order_no" value="${one.order_no}"/>
				</td>
				<td class="col-md-2">
					<div class="row col-md-12 text-center">
						<input type="button" value="거래명세서 발급" id="transaction-btn" class="gtk-btn gtk-btn-blue gtk-btn-sm pull-center"/>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div class="row order-detail-header"><span class="head-icon">■</span> 배송정보</div>
	<div class="row">
		<table id="custom-css-table" class="table table-bordered">
			<tbody>
				<tr>
					<th>송장번호</th>
					<td><font style="color: red;margin-left: 20px;">${one.invoice_no}</font></td>
				</tr>
				<tr>
					<th>주문자</th>
					<td >
						<span style="margin-left:20px;" id="span-sender">
							${one.sender}
						</span>
					</td>
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
	<div class="row order-detail-header"><span class="head-icon">■</span> 주문상품 정보</div>
	</div>
	<div class="row" style="margin-bottom:20px;">
		<table id="example" class="gtk-table">
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
<%@ include file="/WEB-INF/jsp/order_hst/receipt.jsp" %>