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
<link rel="stylesheet" href="./css/shopping/pointy-button.css">
<link rel="stylesheet" href="./css/shopping/plus-minus-div.css">

<script src="./lib/datatable/jquery.dataTables.min.js"></script>

<link rel="stylesheet" href="./lib/datatable/jquery.dataTables.min.css">
<style type="text/css">
.form-group.is-focused .form-control {
  background:transparent;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div>
					<font style="font-weight: bold;font-size: 20px;">장바구니</font>
				</div>
			</div>
			<div class="col-md-9" style="text-align: right;">
				<button id="btn-view-cart" class="btn btn-arrow-right js-view-btngroup">장바구니</button>
				<button id="btn-view-pay" class="btn btn-arrow-right btn-secondary-outline js-view-btngroup">주문결제</button>
				<button id="btn-view-complete" class="btn btn-arrow-right btn-secondary-outline js-view-btngroup">주문완료</button>
			</div>
		</div>
		<div id="div-view-cart" class="row js-view-div">
			<div class="col-md-12">
				<table id="cart-tbl" class="table table-striped table-bordered hover">
					<thead>
						<tr>
							<th data-column="product_id" style="width:10%;">선택</th>
							<th data-column = "title" style="width:50%;">상품정보</th>
							<th data-column = "order_cnt">수량</th>
							<th data-column = "order_cost">금액</th>
							<th data-column="product_id">주문</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
			<div class="col-md-12 pull-left">
				<button class="btn btn-secondary-outline" id="btn-delete-all">선택 상품 삭제</button>
				<button class="btn btn-secondary-outline" id="btn-interest-all">선택 상품 관심상품 등록</button>
			</div>
			<div class="col-md-12">
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>총상품금액</th>
							<th>총할인금액</th>
							<th>결제 예정 금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" id="tot-original-price" readonly class="form-control"/></td>
							<td><input type="text" id="tot-discount-price" readonly class="form-control"/></td>
							<td><input type="text" id="tot-order-price" readonly class="form-control"/></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div id="div-view-pay" class="row js-view-div">
			주문결제div
			<table id="pay-tbl" class="table table-striped table-bordered hover"></table>
		</div>
		<div id="div-view-complete" class="row js-view-div">
			주문완료div
			<table id="complete-tbl" class="table table-striped table-bordered hover"></table>
		</div>
	</div>
<script>
$(document).ready(function() {
	const get_query = function(){
		//replace with ajax later
		const originalData = [
			{
				"product_id" : 1001,
			  	"title": "정품 마블 그립톡 알루미늄 시즌24종.",
			  	"order_cnt": 1,
			  	"img_file" : 'marvel_tok.png',
			  	"order_cost" : 12000,
			  	"unit_price" : 12000
			},
			{
				"product_id" : 2001,
			  	"title": "정품 실리콘 짱구 6종.",
			  	"order_cnt": 2,
			  	"img_file" : 'zzangu_tok.png',
			  	"order_cost" : 20000,
			  	"unit_price" : 10000
			}
		]
		return griptok.wrangle.mockdata(originalData,2,['product_id','title']);
	}
	/********************************************************
	* UTIL FOR THIS PAGE
	********************************************************/
	// TOGGLE BTN FOCUS
	const toggleViewBtns = function(pBtnId){
		$('.js-view-btngroup').each(function(i,e){
			if(e.id === pBtnId){
				$(e).addClass('btn-primary')
			}else{
				$(e).removeClass('btn-primary')
			}
		})
	}
	// BTN INIT FOCUS
	const initToggle = function(){toggleViewBtns('btn-view-cart')}
	
	// TOGGLE DIV DISPLAY
	const toggleDivDisplay = function(){
		const focusedBtn = $('.js-view-btngroup').filter(function(i,e){
			return $(e).hasClass('btn-primary')
		})[0];
		
		const targetDivId = $(focusedBtn).attr('id').toString().replace('btn','div');
		
		$('.js-view-div').each(function(i,e){
			if(e.id === targetDivId){
				$(e).show();
			}else{
				$(e).hide();
			}
		})
	}
	
	//update datatable information if unit count change
	const updateCount = function(pData){
		const oldData = cartTable.getRow(pData.rowIndice);
		const newData = $.extend(oldData,pData.data);
// 		var newData = cartTable.getRow(newData.rowIndice)
// 		rowData.order_cost = unitPrice*count;
// 		rowData.order_cnt = count;
		cartTable.updateRow(newData,pData.rowIndice);
	}
	/********************************************************
	* ON PAGE INIT
	********************************************************/
	initToggle();
	toggleDivDisplay();
	// initial data : later replace with API
	const initData = get_query();
	const cartTable = griptok.component.datatable('cart-tbl');
	cartTable.create(initData,{
		"lengthChange": false,
		columnDefs: [
			{"className": "dt-body-center", "targets": [0,2,3]},
			{"className": "dt-head-center", "targets": "_all"},
			{
				"targets": [0],
				render: function (product_id) { 
					return '<input type="checkbox" class="form-group" value ="'+ product_id +'"/>'; 
				} 
			},
			{
				"targets": [1],
				data : 'img',
				render: function (title,type,row) {
					return '<img src = "/img/product/test/' + row.img_file + '" width="80" height="80"/> ' + title; 
				} 
			},
			{
				"targets":[2],
				render:function(order_cnt,type,row,obj){
					
					return '<div class="form-group">' + 
								'<button class="minus">-</button>' + 
								'<input type="text" value="'+ order_cnt + '" data-price="'+ row.unit_price +'" data-row-indice="'+ obj.row + '"  />' + 
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
				render: function (product_id) { 
					const btnDiv = 
						'<div class="row">' +
							'<div class="col-md-12">' + 
							'<button id="btn-buynow-' + product_id + '" class="btn btn-primary form-group js-buy-now">바로구매</button>' +
							'</div>' +
						'</div>' + 
						'<div class="row">' +
							'<div class="col-md-12">' + 
							'<button id="btn-delete-' + product_id + '" class="btn btn-secondary-outline form-group js-delete-now">상품삭제</button>' +
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
		toggleViewBtns(btnId);
		toggleDivDisplay();
	});
	
	$(document).on('click','.minus',function () {
		const $input = $(this).parent().find('input');
		const count = parseInt($input.val()) - 1 < 1 ? 1 : parseInt($input.val()) - 1;
		const unitPrice = $input.attr('data-price');
		const rowIndice = $input.attr('data-row-indice');
		
		const newData = {
			data : {
				'order_cnt' : count,
				'order_cost' : count * unitPrice
			},
			rowIndice : rowIndice
		};
		
		updateCount(newData);
		
		return false;
	});

	$(document).on('click','.plus',function () {
		var $input = $(this).parent().find('input');
		const count = parseInt($input.val()) + 1;
		const unitPrice = $input.attr('data-price');
		const rowIndice = $input.attr('data-row-indice');
		
		const newData = {
			data : {
				'order_cnt' : count,
				'order_cost' : count * unitPrice
			},
			rowIndice : rowIndice
		};
		
		updateCount(newData);
// 		$input.val(count);
// 		$input.change();
		return false;
	});
});
</script>
</body>
</html>