<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="com.griptk.b2b.product.domain.IProductSortType" %>
<%
	final int list_cnt = request.getAttribute("list_cnt") != null ? (Integer) request.getAttribute("list_cnt"): 0;
	final int LIMIT = 16;
	final int MAX_PAGE = list_cnt % LIMIT == 0 ? list_cnt/LIMIT : list_cnt/LIMIT+1;
%>
<link rel="stylesheet" href="/css/product/list.css" />
<script type="text/javascript" src="/js/product/common.js"></script>
<script type="text/javascript" src="/js/product/list.js"></script>
<script type="text/javascript">
const updatePager = function(pager_id, page){	
	const $pager = jQuery("#"+pager_id);
	const MAX_PAGE = Number($pager.attr("max-page"));
	
	let _page = Number(page) || 0;
	if(_page < 0) _page = 0;
	else if(_page > MAX_PAGE) _page = MAX_PAGE;
	console.log(pager_id);
	console.log(_page);
	$pager.find(".v_page").val(_page);
	$pager.find(".gtk-pager-button.active").removeClass("active");
	$pager.find(".gtk-pager-button[page-no="+_page+"]").addClass("active");
};

const _loadList = function(){
	const base_url = "<%=request.getAttribute("list_url")%>";
	const sort_type = jQuery("#v_sort_type").val();
	const page = jQuery("#main_pager .v_page").val();
	
	loadList(base_url+"?sort_type="+sort_type+"&page="+page+"&limit=<%=LIMIT%>", "filtered-product-list");
};

jQuery(document).ready(function(){
	_loadList();
	
	jQuery("#sort-by-sales").on("click", function(){
		jQuery("#v_sort_type").val("<%=IProductSortType.ORDER_BY_SALES%>");
		_loadList();
	});
	
	jQuery("#sort-by-prices").on("click", function(){
		jQuery("#v_sort_type").val("<%=IProductSortType.ORDER_BY_LOW_PRICE%>");
		_loadList();
	});
	
	jQuery("#sort-by-reg").on("click", function(){
		jQuery("#v_sort_type").val("<%=IProductSortType.ORDER_BY_REG_DT%>");
		_loadList();
	});	
	
	jQuery("#main_pager.gtk-pager").on("click", ".gtk-pager-button", function(e){
		const $this = jQuery(this);
		const pager_id = $this.parent().attr("id");
		let page = $this.attr("page-no"); 
		updatePager(pager_id, page);
		_loadList();
	});
	jQuery("#main_pager.gtk-pager .gtk-pager-prev").on("click", function(e){
		const $this = jQuery(this);
		const pager_id = $this.parent().attr("id");
		let page = Number(jQuery("#"+pager_id+" .v_page").val())-1;
		updatePager(pager_id, page);		
		_loadList();
	});
	jQuery("#main_pager.gtk-pager .gtk-pager-next").on("click", function(e){
		const $this = jQuery(this);
		const pager_id = $this.parent().attr("id");
		let page = Number(jQuery("#"+pager_id+" .v_page").val())+1;
		updatePager(pager_id, page);		
		_loadList();
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
	<%if(MAX_PAGE > 0){%>
	<div class="gtk-pager" id="main_pager" max-page="3">
		<input type="hidden" class="v_page" value="0"/>
		<a class="gtk-pager-prev"><i class="fa fa-chevron-left"></i></a><!--
	 --><%for(int i=0; i<MAX_PAGE; i++){%><a class="gtk-pager-button <%=(i==0? "active" : "")%>" page-no="<%=i%>"><%=i+1%></a><%}%><!-- 
	 --><a class="gtk-pager-next"><i class="fa fa-chevron-right"></i></a>
	</div>
	<%}%>
</div>	