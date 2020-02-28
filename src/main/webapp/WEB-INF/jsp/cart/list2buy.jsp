<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="../common/js/common.js"></script>

<script src="../lib/js/jquery.min.js"></script>
<script src="../lib/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="../css/margin.css">
<link rel="stylesheet" href="../lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/shopping/pointy-button.css">
<link rel="stylesheet" href="../css/shopping/plus-minus-div.css">
<link rel="stylesheet" href="../lib/datatable/jquery.dataTables.min.css">
<link rel="stylesheet" href="../css/shopping/cart.css">

<script src="../lib/datatable/jquery.dataTables.min.js"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../lib/bootbox/bootbox.min.js"></script>
</head>
<body>
<div class="container-fluid">
	<div class="row">
			<div class="m-b-md text-right" id="div-process-status">
				<button id="btn-view-cart" class="btn btn-arrow-right js-view-btngroup m-r-lg">장바구니</button>
				<button id="btn-pay-highlight" class="btn btn-arrow-right btn-primary m-r-lg">주문결제</button>
				<button class="btn btn-arrow-right btn-secondary-outline m-r-md" disabled>주문완료</button>
			</div>
	</div>
	<div id="div-view-pay" class="row js-view-div">
		<div class="col-md-12">
			<table id="pay-tbl" class="table table-striped table-bordered hover gtk-datatable">
				<thead>
					<tr>
						<th data-column = "title" class="w-50">상품정보</th>
						<th data-column = "carted_cnt">수량</th>
						<th data-column = "order_cost">금액</th>
						
						<th data-column = "img_file" data-visible="false">이미지경로</th>
						<th data-column = "tot_discount" data-visible="false">총할인금액</th>
						<th data-column = "product_id" data-visible="false">고유번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="each" items="${arr }">
							<tr>
								<td>${each.title }</td>
								<td>${each.carted_cnt }</td>
								<td>${each.order_cost }</td>
								<td>${each.img_file }</td>
								<td>${each.tot_discount }</td>
								<td>${each.product_id }</td>
							</tr>
						</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-6">
			<div class="col-md-12 text-left">
				<font  class="font-weight-bold font-size-large">배송정보</font>	
			</div>
			<div class="col-md-12">
				<form id="cart-shipto-form">
					<table id= "order-detail-tbl" class="table table-bordered">
						<tbody>
							<tr>
								<th>배송지 선택</th>
								<td>
									<div class="col-md-7">
										<select class="form-control" id="sel-shipto" name="shipto_no"></select>
									</div>
									<div class="col-md-5">
										<input type="button" id="btn-add-shipto" class="gtk-btn gtk-btn-sm gtk-btn-blue" value="신규배송지 추가하기"/>
									</div>
								</td>
							</tr>
							<tr>
								<th>받는사람</th>
								<td>
									<input type="text" name="receiver_nm" class="form-control" readonly/>
								</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>
									<input type="text" name="addr" readonly class="form-control" readonly/>
								</td>
							</tr>
							<tr>
								<th>휴대전화</th>
								<td>
									<input type="text" name="receiver_tel" class="form-control" readonly/>
								</td>
							</tr>
							<tr>
								<th>배송 메모</th>
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
			<div class="col-md-12 text-left">
				<font class="font-weight-bold font-size-large">최종결제 정보</font>	
			</div>
			<div class="col-md-12">
				<form id="amount-confirm-form">
					<table id= "amount-confirm-tbl" class="table table-bordered">
						<tbody>
							<tr>
								<th>총 주문 금액</th>
								<td>
									<input type="text" name="final_original_price" readonly class="form-control"/>
								</td>
							</tr>
							<tr>
								<th>총 할인 금액</th>
								<td>
									<input type="text" name="tot_order_discount" readonly class="form-control"/>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
					            <th>최종 결제 금액</th>
					            <td>
					            	<input type="text" name="tot_order_cost" readonly class="form-control"/>
					            </td>
					        </tr>
						</tfoot>
					</table>
				</form>
			</div>
			<div class="col-md-12 text-center">
				<button id="btn-transfer" class="gtk-btn gtk-btn-blue">실시간 계좌이체</button>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		/********************************************************
		* UTIL FOR THIS PAGE
		********************************************************/	
		const loaded = {
			postHandle : {
				price : function(fromId,rowData){
					const $f = $('#amount-confirm-form');
					const dataArr = payTable.getRows().toArray();
					const bindData = {
						tot_order_cost : dataArr.map(function(x,y){return parseInt(x.order_cost)}).reduce(function(x,y){return x + y}),
						tot_order_discount : dataArr.map(function(x,y){return parseInt(x.tot_discount)}).reduce(function(x,y){return x + y})
					};
					
					bindData.final_original_price = bindData.tot_order_cost + bindData.tot_order_discount;
					
					griptok.form.bindData($f,bindData);
					
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
		
		const payTable = griptok.component.datatable('pay-tbl',0);
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
		
		payTable.create(null,payTableOptions);
		loaded.postHandle.shipto();
		loaded.postHandle.price();
		
		$('#btn-view-cart').on('click',function(){
			const _url = '/carted';
			window.location.href = _url;
		})
		
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
						        		loaded.postHandle.shipto();
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
				size : "big",
				callback : function(){
					const $shipForm = $('#cart-shipto-form'),shipForm = $shipForm[0];
					const $amountForm = $('#amount-confirm-form'),amountForm = $amountForm[0];
					
					const dataOrder = {
						order_title : shipForm.shipto_no.value + "_" + shipForm.receiver_nm.value + "_주문_" + amountForm.tot_order_cost.value,
						tot_order_cost	: amountForm.tot_order_cost.value				
					};
					
					const dataOrderList = payTable.getRows().toArray().map(function(x){
						return {
							product_id : x.product_id,
							order_cnt : x.carted_cnt,
							order_cost : x.order_cost	
						};
					});
					
					const dataOrderDetail = {
						receiver : shipForm.receiver_nm.value,
						memo : shipForm.memo.value,
						recv_addr : shipForm.addr.value
					};
					
					const orderData = {
						orderDetailVO : dataOrder,
						orderList : dataOrderList,
						orderedVO : dataOrderDetail
					}
					
					$.ajax({
						url : '/orders',
						type : 'post',
						contentType : "application/json",
						data : JSON.stringify(orderData),
						success : function(result){
							if(result == -1){
								console.log('exception occured in the server')
							}else if(result >= 3){
								console.log('successful')
							}else{
								console.log('something is wrong')
							}
						}
					});
				}
			});
		})
	})
</script>
</body>
</html>