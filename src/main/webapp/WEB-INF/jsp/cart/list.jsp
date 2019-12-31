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

<link rel="stylesheet" href="./lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/shopping/pointy-button.css">
<link rel="stylesheet" href="./css/shopping/plus-minus-div.css">

<script src="./lib/datatable/jquery.dataTables.min.js"></script>

<link rel="stylesheet" href="./lib/datatable/jquery.dataTables.min.css">
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="./lib/bootbox/bootbox.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3" style="text-align: left;">
				<div id="label-view-cart" class="js-view-label">
					<font style="font-weight: bold;font-size:20px;">장바구니</font>	
				</div>
				<div id="label-view-pay" class="js-view-label">
					<font style="font-weight: bold;font-size:20px;">주문결제</font>
				</div>
			</div>
			<div class="col-md-9" style="text-align: right;">
				<button id="btn-view-cart" class="btn btn-arrow-right js-view-btngroup">장바구니</button>
				<button id="btn-view-pay" class="btn btn-arrow-right btn-secondary-outline js-view-btngroup">주문결제</button>
				<button class="btn btn-arrow-right btn-secondary-outline" disabled>주문완료</button>
			</div>
		</div>
		<div id="div-view-cart" class="row js-view-div">
			<div class="col-md-12">
				<table id="cart-tbl" class="table table-striped table-bordered hover">
					<thead>
						<tr>
							<th data-column="checked" style="width:10%;">선택</th>
							<th data-column = "title" style="width:50%;">상품정보</th>
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
			<div class="col-md-12 pull-left">
				<button class="btn btn-secondary-outline" id="btn-remove-all">선택 상품 삭제</button>
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
			<div class="col-md-12">
				<table id="pay-tbl" class="table table-striped table-bordered hover">
					<thead>
						<tr>
							<th data-column = "title" style="width:50%;">상품정보</th>
							<th data-column = "carted_cnt">수량</th>
							<th data-column = "order_cost">금액</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
			<div class="col-md-6">
				<div class="col-md-12" style="text-align: left;">
					<font style="font-weight: bold;font-size:20px;">배송정보</font>	
				</div>
				<div class="col-md-12">
					<form id="cart-shipto-form">
						<table id= "order-detail-tbl" class="table table-bordered">
							<tbody>
								<tr>
									<th style="width:20%;">배송지 선택</th>
									<td>
										<div class="col-md-7">
											<select class="form-control" id="sel-shipto" name="shipto_no">
<!-- 												<option value="shipto_no_1" data-recv-addr = "서울특별시 마포구 8길 19 포스코 3단지 303호">기본배송지</option> -->
<!-- 												<option value="shipto_no_2" data-recv-addr = "부산광역시 아무개구 9-2 홍길동 아파트 1005호">부산배송지</option> -->
											</select>
										</div>
										<div class="col-md-5">
											<input type="button" id="btn-add-shipto" class="btn btn-sm btn-primary form-control" value="신규배송지 추가하기"/>
										</div>
									</td>
								</tr>
								<tr>
									<th style="width:20%;">받는사람</th>
									<td>
										<input type="text" name="receiver_nm" class="form-control" readonly/>
									</td>
								</tr>
								<tr>
									<th style="width:20%;">주소</th>
									<td>
										<input type="text" name="addr" readonly class="form-control" readonly/>
									</td>
								</tr>
								<tr>
									<th style="width:20%;">휴대전화</th>
									<td>
										<input type="text" name="receiver_tel" class="form-control" readonly/>
									</td>
								</tr>
								<tr>
									<th style="width:20%;">배송 메모</th>
									<td>
										<input type="text" name="memo" value="" class="form-control"/>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
			<div class="col-md-6">
				<div class="col-md-12" style="text-align: left;">
					<font style="font-weight: bold;font-size:20px;">최종결제 정보</font>	
				</div>
				<div class="col-md-12">
					<table id= "amount-confirm-tbl" class="table table-bordered" style="background-color:lightGray;">
						<tbody>
							<tr>
								<th style="width:30%;">총 주문 금액</th>
								<td>
									<input type="text" id="final-original-price" readonly class="form-control"/>
								</td>
							</tr>
							<tr>
								<th style="width:30%;">총 할인 금액</th>
								<td>
									<input type="text" id="final-discount-price" readonly class="form-control"/>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
					            <th style="width:30%;">최종 결제 금액</th>
					            <td>
					            	<input type="text" id="final-order-price" readonly class="form-control"/>
					            </td>
					        </tr>
						</tfoot>
					</table>
				</div>
				<div class="col-md-12" style="text-align:center;">
					<button id="btn-transfer" class="btn btn-primary">실시간 계좌이체</button>
				</div>
			</div>
		</div>
	</div>
<script>
$(document).ready(function() {
	/********************************************************
	* UTIL FOR THIS PAGE
	********************************************************/	
	const toggle = {
		buttons : function(pBtnId){
			$('.js-view-btngroup').each(function(i,e){
				if(e.id === pBtnId){
					$(e).addClass('btn-primary');
				}else{
					$(e).removeClass('btn-primary');
				}
			})
		},
		div : function(){
			const focusedBtn = $('.js-view-btngroup').filter(function(i,e){
				return $(e).hasClass('btn-primary')
			})[0];
			
			const targetDivId = $(focusedBtn).attr('id').toString().replace('btn','div');
			
			$('.js-view-div').each(function(i,e){
				if(e.id === targetDivId) {$(e).show(); }
				else {$(e).hide();}
			})
		},
		label : function(){
			const focusedBtn = $('.js-view-btngroup').filter(function(i,e){
				return $(e).hasClass('btn-primary')
			})[0];
			
			const targetDivId = $(focusedBtn).attr('id').toString().replace('btn','label');
			
			$('.js-view-label').each(function(i,e){
				if(e.id === targetDivId) {$(e).show(); }
				else {$(e).hide();}
			})
		},
		postHandle : {
			price : function(fromId,rowData){
				if(fromId == 'btn-view-pay'){
					$('#final-original-price').val($('#tot-original-price').val())
					$('#final-discount-price').val($('#tot-discount-price').val())
					$('#final-order-price').val($('#tot-order-price').val())
				}else{
					const originalP = rowData.unit_price * rowData.carted_cnt;
					const discountP = 0;
					const finalP = originalP - discountP;
					
					$('#final-original-price').val(originalP + '원')
					$('#final-discount-price').val(discountP + '원')
					$('#final-order-price').val(finalP + '원')
				}
			},
			shipto : function(){
				const $f = $('#cart-shipto-form'), f = $f[0];
				const $sel = $('#sel-shipto'),sel = $sel[0];
				
				$.ajax({
			        url : "/shiptos",
			        type: "get",
			        success : function(data){
			        	$sel.find('option').remove().end();
			        	
			        	const selected = data.filter(function(x){return x.main_shipping === 'Y'})[0];
			        	$sel.append($("<option></option>").attr("value",selected.shipto_no).text(selected.shipto_nm));
			        	
			        	const others = data.filter(function(x){return x.main_shipping !== 'Y'});
			        	others.forEach(function(each){
			        		$sel.append($("<option></option>").attr("value",each.shipto_no).text(each.shipto_nm));
			        	});
			        	
			        	griptok.form.bindData($f,selected);
			        }
				});
			}
		}
	};
	
	toggle.init = function(){
		toggle.buttons('btn-view-cart');
		toggle.div();
		toggle.label();
	};
	
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
					
					toggle.buttons('btn-view-pay');
					toggle.div();
					toggle.label();
					payTable.reload(arr);
					toggle.postHandle.price(null,rowData);
					toggle.postHandle.shipto();
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
	const payTable = griptok.component.datatable('pay-tbl');
	const payTableOptions = {
		"lengthChange" : false,
		columnDefs : [
			{
				"targets": [0],
				data : 'img',
				render: function (title,type,row) {
					return '<img src = "' + row.img_file + '" width="80" height="80"/> ' + title; 
				} 
			},
			{
				"targets":[1],
				render:function(carted_cnt,type,row,obj){
					return '<div class="form-group">' + 
								'<button class="minus" disabled>-</button>' + 
								'<input type="text" value="'+ carted_cnt + '" data-price="'+ row.unit_price +'" data-row-indice="'+ obj.row +  '" data-discount-price="'+ row.unit_discount +'"  readonly/>' + 
								'<button class="plus" disabled>+</button>' + 
							'</div>'; 
				}
			},
			{
				"targets":[2],
				render: function(order_cost){
					return order_cost + '원'
				}
			},
		]
	}
	
	toggle.init();
	update.checked.payment();
	
	payTable.create(null,payTableOptions);
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
						'<div class="row">' +
							'<div class="col-md-offset-3">' + 
							'<button class="btn btn-primary form-group js-buy-now" data-row-indice="'+obj.row+'">바로구매</button>' +
							'</div>' +
						'</div>' + 
						'<div class="row">' +
							'<div class="col-md-offset-3">' + 
							'<button class="btn btn-secondary-outline form-group js-delete-now" data-row-indice="'+obj.row+'">상품삭제</button>' +
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
				toggle.buttons(btnId);
				toggle.div();
				toggle.label();
				payTable.reload(arr);
				toggle.postHandle.price(btnId);
				toggle.postHandle.shipto();
			}
		}else{
			toggle.buttons(btnId);
			toggle.div();
			toggle.label();
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
	
	$('#sel-shipto').on('change',function(){
		$.ajax({
	        url : "/shiptos/" + $(this).val(),
	        type: "get",
	        success : function(data){
	        	griptok.form.bindData($('#cart-shipto-form'),data);
	        }
		});
	});
	
	$('#btn-add-shipto').on('click',function(){
		const $form = 
			'<form id="add-shipto-form">	                                                                                        '	+
			'	<div class="row">	                                                                                                '	+
			'		<div class="col-md-12">	                                                                                        '	+
			'			<div class="col-md-3">	                                                                                    '	+
			'				배송지 이름	                                                                                                '	+
			'			</div>	                                                                                                    '	+
			'			<div class="col-md-6">	                                                                                    '	+
			'				<input type="text" name="shipto_nm" class="form-control" required data-label="배송지 이름"/>	            '	+
			'			</div>	                                                                                                    '	+
			'		</div>	                                                                                                        '	+
			'		<div class="col-md-12">	                                                                                        '	+
			'			<div class="col-md-3">	                                                                                    '	+
			'				받는 사람	                                                                                                '	+
			'			</div>	                                                                                                    '	+
			'			<div class="col-md-6">	                                                                                    '	+
			'				<input type="text" name="receiver_nm" class="form-control" required data-label="받는 사람"/>	            '	+
			'			</div>	                                                                                                    '	+
			'		</div>	                                                                                                        '	+
			'		<div class="col-md-12">	                                                                                        '	+
			'			<div class="col-md-3">	                                                                                    '	+
			'				주소	                                                                                                    '	+
			'			</div>	                                                                                                    '	+
			'			<div class="col-md-6">	                                                                                    '	+
			'				<input type="text" name="shipto_addr2" class="form-control" required data-label="배송지 이름"/>	            '	+
			'			</div>	                                                                                                    '	+
			'			<div class="col-md-3">	                                                                                    '	+
			'				<input type="button" id="btn-postcode" class="form-control btn btn-sm btn-primary" value="우편번호 찾기"/>	'	+	
			'				<input type="hidden" name="post_code" required data-label="우편번호와 상세주소"/>                             	'	+
			'				<input type="hidden" name="shipto_addr1" required data-label="우편번호와 상세주소"/>                          '	+
			'			</div>                                                                                                      '	+
			'		</div>                                                                                                          '	+
			'		<div class="col-md-12">                                                                                         '	+
			'			<div class="col-md-3">                                                                                      '	+
			'				휴대전화                                                                                                   														'	+
			'			</div>                                                                                                      '	+
			'			<div class="col-md-6">                                                                                      '	+
			'				<input type="text" class="form-control" name="receiver_tel" required data-label="받는분휴대전화"/>			'	+
			'			</div>                                                                                                      '	+
			'		</div>                                                                                                          '	+
			'	</div>                                                                                                              '	+
			'</form>                                                                                                                '	;
		
		griptok.component.bootbox.confirm({
			title : '신규 배송지 추가하기',
			message : $form,
			callback : function(result){
				if(!result){
					return;
				}else{
					const $f =  $('#add-shipto-form'),f = $f[0];
					const validationResult = griptok.form.validateSimple($f);
					
					if(validationResult.isValid){
						$.ajax({
							url : "/shiptos",
					        type: "post",
					        contentType: "application/json",
					        data : griptok.form.toJSON($f),
					        success : function(x){
					        	if(x==0){
					        		griptok.component.bootbox.growl("배송지 추가에 실패하였습니다.");
					        	}else{
					        		griptok.component.bootbox.growl("추가되었습니다.");
					        		toggle.postHandle.shipto();
					        	}
					        }
						});
					}else{
						griptok.component.bootbox.growl(validationResult.message);
						return false;
					}
				}
			}
		}).
		init(function(){
			$('#btn-postcode').on('click',function(){
				new daum.Postcode({
					oncomplete:function(data) {
						const $f =  $('#add-shipto-form'),f = $f[0];
						f.post_code.value = data.postcode1+"-"+data.postcode2;
						f.shipto_addr1.value = data.address;
						griptok.component.bootbox.growl('우편번호가 성공적으로 등록되었습니다.','transparent');
					}
				}).open();
			});
		})
	});
	
	$('#btn-transfer').on('click',function(){
		griptok.component.bootbox.alert({
			title : "실시간 계좌 이체",
			message : "우리은행 1005-182-103721 주식회<br>사 아이버스터 입금시 업체명으로<br> 입금해주세요",
			size : "big"
		});
	})
});
</script>
</body>
</html>