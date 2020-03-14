<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="com.griptk.b2b.product.domain.IProductSortType" %>
<%
	final int list_cnt = request.getAttribute("list_cnt") != null ? (Integer) request.getAttribute("list_cnt"): 0;
	final int ROW_PER_PAGE = 16;
	final int MAX_PAGE = list_cnt % ROW_PER_PAGE == 0 ? list_cnt/ROW_PER_PAGE : list_cnt/ROW_PER_PAGE+1;
%>
<link rel="stylesheet" href="/css/product/list.css" />
<script type="text/javascript" src="/js/product/common.js"></script>
<script type="text/javascript" src="/js/product/list.js"></script>
<script type="text/javascript">
const _loadList = function(page_no){
	const base_url = "<%=request.getAttribute("list_url")%>";
	const sort_type = jQuery("#v_sort_type").val();
	const page = page_no;
	
	loadList(base_url+"?sort_type="+sort_type+"&page="+page+"&limit=<%=ROW_PER_PAGE%>", "filtered-product-list");
};

jQuery(document).ready(function(){
	//_loadList(0);
	jQuery("#main_pager").initPager(<%=list_cnt%>, <%=ROW_PER_PAGE%>, _loadList).updatePager(0);
	
	jQuery("#sort-by-sales").on("click", function(){
		jQuery("#v_sort_type").val("<%=IProductSortType.ORDER_BY_SALES%>");
		jQuery("#main_pager").updatePager(0);
	});
	
	jQuery("#sort-by-prices").on("click", function(){
		jQuery("#v_sort_type").val("<%=IProductSortType.ORDER_BY_LOW_PRICE%>");
		jQuery("#main_pager").updatePager(0);
	});
	
	jQuery("#sort-by-reg").on("click", function(){
		jQuery("#v_sort_type").val("<%=IProductSortType.ORDER_BY_REG_DT%>");
		jQuery("#main_pager").updatePager(0);
	});
});
</script>    
<div class="container-fluid main-shopping-list">
	<div class="row">
		<div class="col-sm-12 griptok-main-sort">
			<a href="#" id="sort-by-sales">인기도순</a> / <a href="#" id="sort-by-prices">낮은가격순</a> / <a href="#" id="sort-by-reg">최신등록순</a>
		</div>
	</div>	
	<div class="row">
		<input type="hidden" id="v_sort_type" value="<%=IProductSortType.ORDER_BY_REG_DT%>"/>
		<div class="col-sm-12 product-list" id="filtered-product-list"></div>
	</div>
	<div class="gtk-pager" id="main_pager"></div>
</div>	