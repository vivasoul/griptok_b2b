<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
	final int list_cnt = request.getAttribute("list_cnt") != null ? (Integer) request.getAttribute("list_cnt"): 0;
	final int ROW_PER_PAGE = 10;
%>
<style type="text/css">
.gtk-table .user-edit-btn { padding:0px; }
.gtk-table .user-edit-btn .gtk-btn { width:40px;height:25px;font-size:12px; }
</style>
<script type="text/javascript" src="/js/admin/order/common.js"></script>
<script type="text/javascript">
const _loadList = function(page_no){
	loadList(page_no, "OD");
};

const getChecked = function(){
	const $checkeds = jQuery("#order-list input.gtk-order-cbox:checked");
	return Array.prototype.map.call($checkeds, function(x){ return { "order":x.value } });
};

jQuery(document).ready(function(){
	jQuery("#order-list-pager").initPager(<%=list_cnt%>,<%=ROW_PER_PAGE%>,_loadList).updatePager(0);
});
</script>
<div class="main-shopping-list">
	<div id="order-list">
		<input type="hidden" id="v_row_per_page" value="<%=ROW_PER_PAGE%>"/>
		<table class="gtk-table">
			<colgroup>
				<col style="width:3%"/><col style="width:5%"/><col style="width:10%"/><col style="width:25%"/><col style="width:10%"/>
				<col style="width:10%"/><col style="width:10%"/><col style="width:10%"/><col style="width:12%"/><col style="width:5%"/>
			</colgroup>
			<thead>
				<tr>
					<th>선택</th>
					<th>주문번호</th>
					<th>주문일자</th>
					<th>주문명</th>
					<th>주문가격</th>
					<th>업체명</th>
					<th>담당자명</th>
					<th>전화</th>
					<th>이메일</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
		<div class="gtk-pager" id="order-list-pager"></div>
	</div>
</div>