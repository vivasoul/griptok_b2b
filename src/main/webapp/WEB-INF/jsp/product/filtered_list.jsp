<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="/css/product/list.css" />
<script type="text/javascript" src= "/js/product/list.js"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
	loadList("<%=request.getAttribute("list_url")%>","filtered-product-list");
});
</script>    
<div class="container-fluid main-shopping-list">
	<div class="row">
		<div class="col-sm-12 griptok-main-sort"><a href="#">인기도순</a> / <a href="#">낮은가격순</a> / <a href="#">최신등록순</a></div>
	</div>	
	<div class="row">
		<div class="col-sm-12" id="filtered-product-list"></div>
	</div>
</div>	