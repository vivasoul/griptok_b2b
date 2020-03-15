<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
	boolean dc_only = request.getAttribute("dc_only") == null ?  false : (Boolean)request.getAttribute("dc_only");

	final int list_cnt = request.getAttribute("list_cnt") != null ? (Integer) request.getAttribute("list_cnt"): 0;
	final int ROW_PER_PAGE = 10;
%>
<link rel="stylesheet" href="/css/product/list.css" />
<style type="text/css">
.gtk-table .product-edit-btn { padding:0px; }
.gtk-table .product-edit-btn .gtk-btn { width:40px;height:25px;font-size:12px; }
.gtk-table-option { margin-bottom:15px; }
.gtk-table-option .gtk-btn { /*padding:0px 10px;min-width:65px;*/margin-right:5px;  }
</style>
<script type="text/javascript" src="/js/admin/product/list.js"></script>
<script type="text/javascript">
const _loadList = function(page_no){
	<%if(dc_only){%>
	loadListDC("all-product-list", page_no);
	<%}else{%>
	loadList("all-product-list", page_no);
	<%}%>	
};

jQuery(document).ready(function(){
	jQuery("#product-list-pager").initPager(<%=list_cnt%>,<%=ROW_PER_PAGE%>,_loadList).updatePager(0);
});
</script>
<div class="main-shopping-list">
	<div class="gtk-table-option">
		<button type="button" class="gtk-btn gtk-btn-sm">선택삭제</button><!-- 
	 --><button type="button" class="gtk-btn gtk-btn-sm">삭제</button><!--
	 --><button type="button" class="gtk-btn gtk-btn-sm">특가 상품 지정</button>
 	</div>
	<div id="all-product-list">
		<input type="hidden" id="v_row_per_page" value="<%=ROW_PER_PAGE%>"/>
		<table class="gtk-table">
			<colgroup>
				<col style="width:3%"/><col style="width:5%"/><col style="width:8%"/><col style="width:30%"/><col style="width:7%"/>
				<col style="width:7%"/><col style="width:7%"/><col style="width:7%"/><col style="width:13%"/><col style="width:13%"/>
			</colgroup>
			<thead>
				<tr>
					<th>선택</th>
					<th>수정</th>
					<th>상품번호</th>
					<th>상품명</th>
					<th>판매상태</th>
					<th>재고수량</th>
					<th>소비자가</th>
					<th>판매가</th>
					<th>상품 등록일</th>
					<th>최종 수정일</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
		<div class="gtk-pager" id="product-list-pager"></div>			
	</div>
</div>