<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="com.griptk.b2b.product.domain.IProductSortType" %>
<link rel="stylesheet" href="/css/product/list.css" />
<script type="text/javascript" src="/js/product/common.js"></script>
<script type="text/javascript" src="/js/product/list.js"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
	loadList("<%=request.getAttribute("list_url")%>","filtered-product-list");
	
	jQuery("#sort-by-sales").on("click", function(){
		loadList("<%=request.getAttribute("list_url")%>?sort_type=<%=IProductSortType.ORDER_BY_SALES%>","filtered-product-list");
	});
	
	jQuery("#sort-by-prices").on("click", function(){
		loadList("<%=request.getAttribute("list_url")%>?sort_type=<%=IProductSortType.ORDER_BY_LOW_PRICE%>","filtered-product-list");
	});
	
	jQuery("#sort-by-reg").on("click", function(){
		loadList("<%=request.getAttribute("list_url")%>?sort_type=<%=IProductSortType.ORDER_BY_REG_DT%>","filtered-product-list");
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
		<div class="col-sm-12 product-list" id="filtered-product-list"></div>
	</div>
</div>	