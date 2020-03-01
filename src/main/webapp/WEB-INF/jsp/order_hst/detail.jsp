<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<div class="col-md-4" style="text-align: center;margin-top: 20px;">
						<font class="font-weight-bold font-size-md">주문일자:</font>
					</div>
					<div class="col-md-8" style="text-align: left;margin-top: 20px;">
						<span id="span-order-dt">
							${one.order_dt }
						</span>
					</div>
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
	<div class="row" style="margin-top:10px;">
		<div style="background-color: transparent;">
			<ul style="list-style-type: square;padding-left: 15px;">
				<li><font style="font-weight: bold">주문상품 정보</font></li>
			</ul>
		</div>
	</div>
	<div class="row">
		<table id="example" class="gtk-datatable">
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
	
	const initTable = griptok.component.datatable('example');
	
	initTable.create(null,{
		  "lengthChange": false
	} );
	
	$('#btn-transaction').on('click',function(){
		const $form =
			'<form id="transaction-hist-form">                                                                                                   ' +
			'  <div class="row" style="text-align:center;">                                                                                      ' +
			'    <font style="font-weight:bold;font-size:33px;"><U>거 래 명 세 서</U></font>                                                         ' +
			'  </div>                                                                                                                            ' +
			'  <div class="row" style="margin-top:20px;">                                                                                        ' +
			'    <div class="col-md-12">                                                                                                         ' +
			'      <div class="col-md-6">                                                                                                        ' +
			'        <table class="table table-bordered">                                                                                        ' +
			'          <tr><td style="text-align:center;"><input type="text" style="border:none;text-align:center;" name="order_dt" readonly></td></tr>                                                                ' +
			'          <tr><td></td></tr>                                                                                                        ' +
			'          <tr><td style="text-align:right;"><font style="font-size:20px;font-weight:bold;"><input type="text" style="border:none;text-align:left;" name="cmpny_nm" readonly> 귀하</font></td></tr>       ' +
			'          <tr><td style="text-align:center;">아래와 같이 청구 합니다.</td></tr>                                                             ' +
			'        </table>                                                                                                                    ' +
			'      </div>                                                                                                                        ' +
			'      <div class="col-md-6">                                                                                                        ' +
			'        <table class="table table-bordered">                                                                                        ' +
			'          <colgroup>                                                                                                                ' +
			'             <col style="width: 5%;">                                                                                               ' +
			'             <col style="width: 35%;">                                                                                              ' +
			'             <col style="width: 60%;">                                                                                              ' +
			'          </colgroup>                                                                                                               ' +
			'          <tr>                                                                                                                      ' +
			'            <th rowspan="4">공급자</th>                                                                                               ' +
			'            <th>상호</th>                                                                                                             ' +
			'            <td>주식회사 아이버스</td>                                                                                                    ' +
			'          </tr>                                                                                                                     ' +
			'          <tr>                                                                                                                      ' +
			'            <th>사업자 등록번호</th>                                                                                                     ' +
			'            <td>110-86-14445</td>                                                                                                   ' +
			'          </tr>                                                                                                                     ' +
			'          <tr>                                                                                                                      ' +
			'            <th>주소</th>                                                                                                             ' +
			'            <td>서울시 마포구 월드컵북로7길34 2층</td>                                                                                        ' +
			'          </tr>                                                                                                                     ' +
			'          <tr>                                                                                                                      ' +
			'            <th>전화번호</th>                                                                                                          ' +
			'            <td>1644-1633</td>                                                                                                      ' +
			'          </tr>                                                                                                                     ' +
			'        </table>                                                                                                                    ' +
			'      </div>                                                                                                                        ' +
			'    </div>                                                                                                                          ' +
			'  </div>                                                                                                                            ' +
			'  <div class="row" style="margin-top:15px;">                                                                                        ' +
			'    <table class="table table-bordered" style="border-style: sold;border-width:8px;">                                               ' +
			'      <colgroup>                                                                                                                    ' +
			'             <col style="width: 50%;">                                                                                              ' +
			'             <col style="width: 50%;">                                                                                              ' +
			'          </colgroup>                                                                                                               ' +
			'      <tr>                                                                                                                          ' +
			'        <td style="text-align:center;"><font style="font-size:20px;">총주문 수량 : <input type="text" style="border:none;text-align:right;" name="tot_cnt" readonly>개</font></td>                                     ' +
			'        <td style="text-align:center;"><font style="font-weight:bold;font-size:20px;">총 주문 합계금액 : <input type="text" style="border:none;text-align:right;" name="tot_price" readonly>원(VAT포함)</font></td>	' +
			'      </tr>                                                                                                                         ' +
			'    </table>                                                                                                                        ' +
			'  </div>                                                                                                                            ' +
			'  <div class="row">                                                                                                                 ' +
			'    <table id="pay-hist-tbl" class="table table-striped table-bordered hover gtk-datatable">                                                      ' +
			'		<thead>                                                                                                                      ' +
			'			<tr>                                                                                                                     ' +
			'				<th data-column = "order_dt">주문일자</th>                                                                              ' +
			'				<th data-column = "title">상품명</th>                                                                                  ' +
			'				<th data-column = "order_cnt">수량</th>                                                                                ' +
			'				<th data-column = "order_cost">주문금액</th>                                                                            ' +
			'			</tr>                                                                                                                    ' +
			'		</thead>                                                                                                                     ' +
			'		<tbody>                                                                                                                      ' +
			'			<c:forEach var="each" items="${arr }">                                                                                   ' +
			'				<tr>                                                                                                                 ' +
			'					<td>${one.order_dt }</td>                                                                                        ' +
			'					<td>${each.title }</td>                                                                                          ' +
			'					<td>${each.order_cnt }개</td>                                                                                     ' +
			'					<td><fmt:formatNumber value="${each.order_cost}" pattern="#,###" />원</td>                                        ' +
			'				</tr>                                                                                                                ' +
			'			</c:forEach>                                                                                                             ' +
			'		</tbody>                                                                                                                     ' +
			'	</table>                                                                                                                         ' +
			'  </div>                                                                                                                            ' +
			'</form>                                                                                                                             ' ;
			
		griptok.component.bootbox.confirm({
			title : null,
			message : $form,
			callback : function(result){
				if(!result){
					return;
				}else{
					const $f =  $('transaction-hist-form'),f = $f[0];
					const validationResult = griptok.form.validateSimple($f);
					
					console.log('module callback : order_hst/detail.jsp')
					console.log($f)
					
					if(validationResult.isValid){
						return true;
					}else{
						griptok.component.bootbox.growl(validationResult.message);
						return false;
					}
				}
			}
		},{cancel:'닫기',confirm:'다운로드'}).
		init(function(){
			const varObject = {
				tot_cnt : 
					initTable.getRows().
					map(function(z){return(z['order_cnt'].split('개').join(''))}).
					reduce(function(x,y){return parseInt(x)+parseInt(y)}),
				tot_price : 
					initTable.getRows().
					map(function(z){return(z['order_cost'].split(/\s*[,|원]\s*/).join(''))}).
					reduce(function(x,y){return parseInt(x)+parseInt(y)}),
				cmpny_nm : 
						$('#span-sender').html().replace(/\s+/g, '').split("/")[0],
				order_dt : 
						$('#span-order-dt').html().replace(/\s+/g, '').slice(0,10)
			};
			
			griptok.form.bindData($('#transaction-hist-form'),varObject)
			griptok.component.datatable('pay-hist-tbl',0).create(initTable.getRows(),{
				  "lengthChange": false
			} );
		})
	});
	
});
</script>