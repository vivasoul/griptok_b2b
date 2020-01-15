<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="./common/js/common.js"></script>

<script src="./lib/js/jquery.min.js"></script>
<script src="./lib/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="./css/margin.css">
<link rel="stylesheet" href="./lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/shopping/pointy-button.css">
<link rel="stylesheet" href="./css/shopping/plus-minus-div.css">
<link rel="stylesheet" href="./lib/datatable/jquery.dataTables.min.css">
<link rel="stylesheet" href="./css/shopping/cart.css">

<script src="./lib/datatable/jquery.dataTables.min.js"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="./lib/bootbox/bootbox.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="m-b-md text-right" id="div-process-status">
				<button id="btn-view-cart" class="btn btn-arrow-right js-view-btngroup btn-primary m-r-lg">장바구니</button>
				<button id="btn-pay-highlight" class="btn btn-arrow-right btn-secondary-outline m-r-lg" disabled>주문결제</button>
				<button class="btn btn-arrow-right btn-secondary-outline m-r-md" disabled>주문완료</button>
			</div>
		</div>
		<div id="div-view-cart" class="row js-view-div">
			<div class="col-md-12">
				<table id="cart-tbl" class="table table-striped table-bordered hover">
					<thead>
						<tr>
							<th data-column="checked" class="w-10">선택</th>
							<th data-column = "title" class="w-50">상품정보</th>
							<th data-column = "carted_cnt">수량</th>
							<th data-column = "order_cost">금액</th>
							<th data-column="product_id">주문</th>
							
							<th data-column = "unit_price" data-visible="false">단일가격</th>
							<th data-column = "img_file" data-visible="false">이미지경로</th>
							<th data-column = "unit_discount" data-visible="false">유닛할인금액</th>
							<th data-column = "tot_discount" data-visible="false">총할인금액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="each" items="${arr }">
							<tr data-row-id="${each.product_id }">
								<td>${each.checked }</td>
								<td>${each.title }</td>
								<td>${each.carted_cnt }</td>
								<td>${each.order_cost }</td>
								<td>${each.product_id }</td>
								
								<td>${each.unit_price }</td>
								<td>${each.img_file }</td>
								<td>${each.unit_discount }</td>
								<td>${each.tot_discount }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-md-12 pull-left m-b-md" id="div-all-action">
				<button class="gtk-btn" id="btn-remove-all">선택 상품 삭제</button>
				<button class="gtk-btn" id="btn-interest-all">선택 상품 관심상품 등록</button>
			</div>
			<div class="col-md-12">
				<table id="cart-price-table" class="table border-top-2 border-bottom-2">
					<thead>
						<tr>
							<th class="border-right-1">총상품금액</th>
							<th class="border-right-1">총할인금액</th>
							<th class="border-none">결제 예정 금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="border-right-1">
								<input type="text" id="tot-original-price" readonly class="form-control border-none bg-transparent"/> 
							</td>
							<td class="border-right-1">
								<input type="text" id="tot-discount-price" readonly class="form-control border-none bg-transparent"/> 
							</td>
							<td>
								<input type="text" id="tot-order-price" readonly class="form-control border-none bg-transparent font-size-large color-red"/>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-12 m-b-md m-t-md text-center">
				<button class="gtk-btn">취소</button>
				<button class="gtk-btn gtk-btn-blue js-view-btngroup" id="btn-view-pay">주문하기</button>
				<button class="gtk-btn">견적서 출력</button>
			</div>
		</div>
	</div>
<script>
$(document).ready(function() {
	/********************************************************
	* UTIL FOR THIS PAGE
	********************************************************/	
	const common = {
		remove : function(productIds){
			if(productIds.length == 0){
				griptok.component.bootbox.growl('삭제될 상품을 선택해주세요');
			}else{
				griptok.component.bootbox.confirm({
					message : '선택된 상품들을 삭제하시겠어요?',
					callback : function(isConfirm){
						if(isConfirm){
							const nowRows = cartTable.getRows().toArray();
							const newRows = nowRows.filter(function(x){return $.inArray(x.product_id,productIds) === -1});
							
							const _url = 'carteds';
							$.ajax({
								url : 'carteds',
								type : 'delete',
								contentType : "application/json",
								data : JSON.stringify({product_ids : productIds}),
								success : function() {
									griptok.component.bootbox.growl('장바구니 목록에서 제거되었습니다.');
							    },
							    complete : function() {
							    	cartTable.reload(newRows);
							    }
							});
						}
					}
				});
			}
		}
	}
	
	const update = {
		clicked : {
			count : function(pData){
				const oldData = cartTable.getRow(pData.rowIndice);
				const newData = $.extend(oldData,pData.data);
				cartTable.updateRow(newData,pData.rowIndice);
			},
			buy : function(pRowIndice){
				const rowData = cartTable.getRow(pRowIndice);
				const arr = [rowData];
				const productIds = arr.map(function(x){return x.product_id});
				
				const _url = 'carted/purchase';
				window.location.href = _url + "?product_ids="+productIds;
			},
			remove : function(pRowIndice){
				const targetRow = cartTable.getRow(pRowIndice);
				const productIds = [targetRow.product_id];
				common.remove(productIds);
			}
		},
		checked : {
			payment : function(){
				const checkedIndices =
					$('.js-chk').
					toArray().
					filter(function(x){return $(x).is(':checked')}).
					map(function(x){return cartTable.getRow($(x).attr('data-row-indice'))});
				
				if(checkedIndices.length == 0){
					$('#tot-original-price').val(0 + '원')
					$('#tot-discount-price').val(0 + '원')
					$('#tot-order-price').val(0 + '원')
				}else{
					const originalSum = checkedIndices.map(function(x){return x.order_cost}).reduce(function(x,y){return parseInt(x)+parseInt(y)});
					const discount = checkedIndices.map(function(x){return x.tot_discount}).reduce(function(x,y){return parseInt(x)+parseInt(y)});
					const netSum = originalSum;
					
					$('#tot-original-price').val((parseInt(originalSum) + parseInt(discount)) + '원')
					$('#tot-discount-price').val(discount + '원')
					$('#tot-order-price').val(netSum + '원')
					
				}
			},
			remove : function(){
				const productIds =
					$('.js-chk').
					toArray().
					filter(function(x){return $(x).is(':checked')}).
					map(function(x){return cartTable.getRow($(x).attr('data-row-indice')).product_id});
				
				common.remove(productIds);
			},
			interested : function(){
				const productIds =
					$('.js-chk').
					toArray().
					filter(function(x){return $(x).is(':checked')}).
					map(function(x){return cartTable.getRow($(x).attr('data-row-indice')).product_id});
				
				if(productIds.length == 0){
					griptok.component.bootbox.growl('관심상품으로 등록할 상품을 선택해주세요.');
				}else{
					griptok.component.bootbox.confirm({
						message : '관싱상품으로 등록하시겠어요?',
						callback : function(isConfirm){
							if(isConfirm){
								const nowRows = cartTable.getRows().toArray();
	 							const newRows = nowRows.filter(function(x){return $.inArray(x.product_id,productIds) === -1});
	 							
	 							const _url = 'carteds';
	 							$.ajax({
	 								url : 'carteds',
	 								type : 'post',
	 								contentType : "application/json",
	 								data : JSON.stringify({product_ids : productIds}),
	 								success : function() {
	 									griptok.component.bootbox.growl('관심상품에 추가되었습니다.');
	 							    }
	 							});
							}
						}
					});
				}
			}
		}
	}
	/********************************************************
	* ON PAGE INIT
	********************************************************/
	const cartTable = griptok.component.datatable('cart-tbl');
	update.checked.payment();
	
	cartTable.create(null,{
		"lengthChange": false,
		columnDefs: [
			{"className": "dt-body-center", "targets": [0,2,3]},
			{"className": "dt-head-center", "targets": "_all"},
			{
				"targets": [0],
				render: function (product_id,type,row,obj) { 
					const checkedString = row.checked == 'true' ? 'checked' : '';
					return '<input type="checkbox" class="form-group js-chk" value ="'+ row.product_id +'" data-row-indice="'+ obj.row +'"'+ checkedString +'/>'; 
				} 
			},
			{
				"targets": [1],
				data : 'img',
				render: function (title,type,row,obj) {
					return '<img src = "' + row.img_file + '" width="80" height="80"/> ' + row.title; 
				} 
			},
			{
				"targets":[2],
				render:function(carted_cnt,type,row,obj){
					
					return '<div class="form-group">' + 
								'<button class="minus">-</button>' + 
								'<input type="text" value="'+ carted_cnt + '" data-price="'+ row.unit_price +'" data-row-indice="'+ obj.row +  '" data-discount-price="'+ row.unit_discount +'"  readonly/>' + 
								'<button class="plus">+</button>' + 
							'</div>'; 
				}
			},
			{
				"targets":[3],
				render: function(order_cost){
					return order_cost + '원'
				}
			},
			{
				"targets": [4], 
				render: function (product_id,type,row,obj) { 
					const btnDiv = 
						'<div class="row m-t-sm">' +
							'<div class="text-center">' + 
							'<button class="gtk-btn gtk-btn-sm gtk-btn-blue js-buy-now" data-row-indice="'+obj.row+'">바로구매</button>' +
							'</div>' +
						'</div>' + 
						'<div class="row">' +
							'<div class="text-center">' + 
							'<button class="gtk-btn gtk-btn-sm form-group js-delete-now" data-row-indice="'+obj.row+'">상품삭제</button>' +
							'</div>' + 
						'</div>' 

					return btnDiv;
				} 
			},
		]
	});
	/********************************************************
	* DEFINE EVENT START
	********************************************************/
	$('.js-view-btngroup').on('click',function(){
		const btnId = $(this).attr('id');
		
		if(btnId === 'btn-view-pay'){
			const arr =
				$('.js-chk').
				toArray().
				filter(function(x){return $(x).is(':checked')}).
				map(function(x){return cartTable.getRow($(x).attr('data-row-indice'))});			
			if(arr.length == 0){
				griptok.component.bootbox.growl('주문하실 상품들을 먼저 체크해주세요.')
			}else{	
				const productIds = arr.map(function(x){return x.product_id});
				const _url = 'carted/purchase';
				window.location.href = _url + "?product_ids="+productIds;
			}
		}
	});
	
	$(document).on('click','.minus',function () {
		const $input = $(this).parent().find('input');
		const count = parseInt($input.val()) - 1 < 1 ? 1 : parseInt($input.val()) - 1;
		const unitPrice = $input.attr('data-price');
		const unitDiscountPrice = $input.attr('data-discount-price');
		const rowIndice = $input.attr('data-row-indice');
		
		const newData = {
			data : {
				'carted_cnt' : count,
				'order_cost' : count * unitPrice,
				'tot_discount' : count * unitDiscountPrice,
				'checked' : 'true'
			},
			rowIndice : rowIndice
		};
		
		update.clicked.count(newData);
		update.checked.payment();
	});

	$(document).on('click','.plus',function () {
		var $input = $(this).parent().find('input');
		const count = parseInt($input.val()) + 1;
		const unitPrice = $input.attr('data-price');
		const unitDiscountPrice = $input.attr('data-discount-price');
		const rowIndice = $input.attr('data-row-indice');
		
		const newData = {
			data : {
				'carted_cnt' : count,
				'order_cost' : count * unitPrice,
				'tot_discount' : count * unitDiscountPrice,
				'checked' : 'true'
			},
			rowIndice : rowIndice
		};
		
		update.clicked.count(newData);
		update.checked.payment();
	});
	
	$(document).on('change','.js-chk',function(){
		update.checked.payment();
	});
	
	$(document).on('click','.js-buy-now',function(){
		update.clicked.buy($(this).attr('data-row-indice'));
	});
	
	$(document).on('click','.js-delete-now',function(){
		update.clicked.remove($(this).attr('data-row-indice'));
	});
	
	$('#btn-interest-all').on('click',function(){
		update.checked.interested();
	});
	
	$('#btn-remove-all').on('click',function(){
		update.checked.remove();
		update.checked.payment();
	});
});
</script>
</body>
</html>