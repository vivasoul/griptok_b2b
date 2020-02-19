<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
	boolean dc_only = request.getAttribute("dc_only") == null ?  false : (Boolean)request.getAttribute("dc_only");
%>
<link rel="stylesheet" href="/css/product/list.css" />
<script type="text/javascript" src="/js/admin/product/list.js"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
	<%if(dc_only){%>
	loadListDC("all-product-list");
	<%}else{%>
	loadList("all-product-list");
	<%}%>
});
</script>
<div class="container-fluid main-shopping-list">
	<div class="row">
		<div class="col-sm-12 product-list" id="all-product-list"></div>
	</div>
</div>	
