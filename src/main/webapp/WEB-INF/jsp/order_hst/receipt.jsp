<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/shopping/receipt.css"/>
<script type="text/javascript">
var setTableData = function(page_no, list){	
	const $table = jQuery("#receipt_moal .rcpt-detail-list");
	$table.find("td").empty();

	for(let i=0;i<list.length;i++){
		const data = list[i];
		const $row = $table.find(".rcpt-detail-row-"+i);
		
		$row.find("td:eq(0)").text(data["order_dt"]);
		$row.find("td:eq(1)").text(data["product_nm"]);
		$row.find("td:eq(2)").text(data["order_cnt"]+" 개");
		$row.find("td:eq(3)").text(currency_formatter(data["order_cost"]," 원"));
	}
};

const setData = function(data){
	jQuery("#v_order_dt").text(data["order_dt"].replace(/(\d{4})[.](\d{2})[.](\d{2})/,"$1년 $2월 $3일"));
	jQuery("#v_company_nm").text(data["company_nm"]);
	
	let tot_cnt = 0; 
	let tot_cost = 0;
	const list = data["list"];
	const part_list = [];
	for(let i=0;i<list.length;i++){
		const row = list[i];
		tot_cnt += row["order_cnt"];
		tot_cost += row["order_cost"];
		if(i<10) part_list.push(row);
	}
	jQuery("#v_tot_cnt").text(tot_cnt);
	jQuery("#v_tot_cost").text(currency_formatter(tot_cost,""));
	jQuery("#rcpt_pager").initPager(list.length, 10, setTableData, list).updatePager(0);
};

const loadData = function(order_no){
	jQuery.ajax({
		url:"/orders/"+order_no+"/receipt",
		method:"GET",
		dataType:"json"
	}).done(setData);
};

jQuery(document).ready(function(){
	jQuery("#transaction-btn").on("click", function(){
		const order_no = jQuery("#v_order_no").val();
		loadData(order_no);
		jQuery("#receipt_moal").modal("show");
	});
});
</script>
<div class="modal fade" id="receipt_moal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    	<div class="rcpt-body">
		    <div class="rcpt-options">
		    	<button type="button" data-dismiss="modal"><i class="fa fa-times"></i></button>
		    </div>
			<div class="rcpt-header"><div>거래명세서</div></div>
			<div class="rcpt-meta">
				<div class="rcpt-receiver">
					<table>
						<tr><td id="v_order_dt"></td></tr>
						<tr><td>&nbsp;</td></tr>
						<tr><td><span id="v_company_nm"></span> 귀하</td></tr>
						<tr><td>아래와 같이 청구합니다.</td></tr>
					</table>
				</div>
				<div class="rcpt-sender">
					<table>
						<colgroup>
							<col style="width:12%;"/><col style="width:28%;"/><col style="width:60%;"/>
						</colgroup>
						<tr>
							<th rowSpan="4" style="text-align:center">공<br/>급<br/>자</th>
							<th>상호</th>
							<td>주식회사 아이버스터</td>
						</tr>
						<tr>
							<th>사업자 등록번호</th>
							<td>110-86-14445</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>서울시 마포구 월드컵북로7길34 2층</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>1644-1633</td>
						</tr>												
					</table>			
				</div>
			</div>
			<div class="rcpt-summary">
				<table>
					<tr>
						<td>총 주문 수량: <span id="v_tot_cnt"></span> 개</td>
						<td>총 주문 합계금액: <span id="v_tot_cost"></span> 원(VAT포함)</td>
					</tr>
				</table>
			</div>
			<div class="rcpt-detail">
				<table class="rcpt-detail-list gtk-table">
					<colgroup>
						<col style="width:12%"><col style="width:59%"><col style="width:12%"><col style="width:17%">
					</colgroup>
					<thead>
						<tr>
							<th>주문일자</th>
							<th>상품명</th>
							<th>수량</th>
							<th>주문 금액</th>
						</tr>
					</thead>
					<tbody>
						<%for(int i=0;i<10;i++){%>
						<tr class="rcpt-detail-row-<%=i%>">
							<td class="gtk-td-center"></td>
							<td></td>
							<td class="gtk-td-center"></td>
							<td class="gtk-td-center"></td>
						</tr>
						<%}%>
					</tbody>
				</table>
			</div>
			<div class="gtk-pager" id="rcpt_pager"></div>
			<div class="rcpt-btn-group">
				<button type="button" class="gtk-btn" data-dismiss="modal">닫기</button><!--
			 --><button type="button" class="gtk-btn gtk-btn-blue">다운로드</button>				
			</div>
		</div>
		<div class="rcpt-footer">
			<img src="/img/order_hst/rcpt_footer_logo.png"/>
		</div>
    </div>
  </div>
</div>