<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/lib/datatable/jquery.dataTables.min.js"></script>
<style type="text/css">
#example th:nth-child(6),
#example td:nth-child(6){ display:none; }
</style>
<!-- <link rel="stylesheet" href="./lib/datatable/jquery.dataTables.min.css"> -->
<div class="container-fluid">
	<div class="row">
		<div class="m-b-lg">
			<div class="col-md-12">
				<p class="m-t-sm m-b-md" style="margin-left: 18px;margin-top: 15px;margin-bottom:17px;">
					[주문번호]를 클릭하시면 주문 상세 내역 및 상품별 배송현황을 조회하실 수 있습니다<br>
					배송지 변경, 구매 취소/변경, 반품/교환은 상세 주문 내역에서 바로 신청하실 수 있습니다
				</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="pull-left">
			<input type="button" value="1개월" class="gtk-btn gtk-btn-sm  js-filter-month" data-month="-1" style="height: 23px;width: 84px;"/>
			<input type="button" value="3개월" class="gtk-btn gtk-btn-sm  js-filter-month" data-month="-3" style="margin-left: 6px;height: 23px;width: 84px;"/>
			<input type="button" value="12개월" class="gtk-btn gtk-btn-sm  js-filter-month" data-month="-12" style="margin-left: 6px;height: 23px;width: 84px;"/>
		</div>
		<div class="pull-right gtk-filter-group">
			<select id="sel-order-status">
			  <option value="">전체상태</option>
			  <option value="X">진행중인주문</option>
			  <option value="O">완료된주문</option>
			</select>
		</div>
	</div>
	<div class="row m-b-md">
		<table id="example" class="gtk-table">
			<colgroup>
				<col/><col/><col/><col/><col/><col style="display:none"/>
			</colgroup>
			<thead>
				<tr>
					<th data-column = "reg_dt">주문일자</th>
					<th data-column = "order_no">주문번호</th>
					<th data-column = "order_title">상품명</th>
					<th data-column = "tot_order_cost">주문금액</th>
					<th data-column = "order_status_nm">주문상태</th>
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
					<td>${each.order_status_nm}</td>
					<td>${each.order_status}</td>
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
		const status_cd = $(this).val();
		
		const filtered = initData.filter(function(x){
			return status_cd ? status_cd === x['order_status'] : true;
		});
		
		exampleTable.reload(filtered);
	});
	
	$('.js-filter-month').on('click',function(){
		//data reload
		const attrValue = $(this).attr('data-month');
		
		const minDate = griptok.date.manipulate(new Date(),{
			"month" : attrValue,
			"split" : "/"
		});
		
		const filtered = initData.filter(function(x){
			return (new Date(x['reg_dt']).getTime() >= new Date(minDate).getTime());
		})
		
		exampleTable.reload(filtered);
		
		//btn css
		const btnArr = $('.js-filter-month').toArray();
		btnArr.forEach(function(each){
			eachAttr = $(each).attr('data-month');
			if(eachAttr == attrValue){
				$(each).addClass('gtk-btn-blue')
			}else{
				$(each).removeClass('gtk-btn-blue')
			}
		})
		
	})
});
</script>