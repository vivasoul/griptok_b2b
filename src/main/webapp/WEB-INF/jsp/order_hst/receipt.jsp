<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- link rel="stylesheet" href="/css/shopping/order_hst_detail.css"-->
<style type="text/css">
#receipt_moal .modal-content { border:5px solid #ECECEC;width:800px;height:1010px;display:block;color:#7C7C7C; }
#receipt_moal .rcpt-body { padding:0px 34px; }

.rcpt-options 		{ text-align:right;font-size:20px;margin-bottom:15px;margin-right:-32px; }	
.rcpt-options button { border:0px;background-color:transparent }

.rcpt-header { text-align:center;margin-bottom:19px; }
.rcpt-header>div { display:inline-block;text-align:center;width:200px;border-bottom:2px solid #A9A9A9;font-size:25px;font-weight:900;color:#5E5E5E; }

.rcpt-meta	{ height:160px; }
.rcpt-meta .rcpt-receiver	{ display:inline-block;width:355px;float:left; }
.rcpt-meta .rcpt-receiver table { width:100%; }
.rcpt-meta .rcpt-receiver td { height:40px;border:1px solid #E0E0E0;border-collapse:collapse;text-align:center;font-size:12px; }
.rcpt-meta .rcpt-receiver tr:nth-child(3)>td { text-align:right;padding-right:18px;font-size:15px;font-weight:700; }
.rcpt-meta .rcpt-sender 	{ display:inline-block;width:355px;float:right; }
.rcpt-meta .rcpt-sender table { width:100%; }
.rcpt-meta .rcpt-sender th,
.rcpt-meta .rcpt-sender td	{ border:1px solid #E0E0E0;border-collapse:collapse;height:40px;font-size:12px; }
.rcpt-meta .rcpt-sender th	{ text-align:center;background-color:#FCFCFC; }
.rcpt-meta .rcpt-sender td	{ padding:0px 12px; }

.rcpt-summary { border:10px solid #F3F3F3;padding:14px 0px;margin:17px 0px; }
.rcpt-summary table { width:100%; }
.rcpt-summary td { text-align:center;width:50%;font-size:15px; }
.rcpt-summary td:nth-child(1) { border-right:3px solid #E0E0E0; } 
.rcpt-summary td:nth-child(2) { border-left:3px solid #E0E0E0;font-weight:700; }

#rcpt_pager.gtk-pager { margin-top:20px; }
.rcpt-btn-group { margin-bottom:20px;text-align:center; }
.rcpt-btn-group .gtk-btn { width:145px;height:45px;margin:0px 6px; }

.rcpt-footer { position:absolute;bottom:0px;width:100%;text-align:right;background-color:#A7A7A7; }

</style>
<script type="text/javascript">
jQuery(document).ready(function(){
	jQuery("#transaction-btn").on("click", function(){
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
						<tr><td>2020년 1월 30일</td></tr>
						<tr><td>&nbsp;</td></tr>
						<tr><td><span>주식회사 더블유아이</span> 귀하</td></tr>
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
						<td>총 주문 수량: 150 개</td>
						<td>총 주문 합계금액: 20,000,000 원(VAT포함)</td>
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
						<tr>
							<td class="gtk-td-center">2019.12.23</td>
							<td>라이언 그립톡</td>
							<td class="gtk-td-center">100개</td>
							<td class="gtk-td-center">20,000,000원</td>
						</tr>
						<%for(int i=0;i<9;i++){%>
						<tr>
							<td class="gtk-td-center"></td>
							<td></td>
							<td class="gtk-td-center"></td>
							<td class="gtk-td-center"></td>
						</tr>
						<%}%>
					</tbody>
				</table>
			</div>
			<div class="gtk-pager" id="rcpt_pager" max-page="3">
			<input type="hidden" class="v_page" value="0"/>
			<a class="gtk-pager-prev"><i class="fa fa-chevron-left"></i></a><!--
		 --><a class="gtk-pager-button active" page-no="0">1</a><!-- 
		 --><a class="gtk-pager-next"><i class="fa fa-chevron-right"></i></a>
			</div>
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