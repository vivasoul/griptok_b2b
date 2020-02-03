<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/product/list.css" />
<script type="text/javascript" src="/js/admin/product/list.js"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
	loadList("/products","all-product-list");
});
</script>
<div class="container-fluid main-shopping-list">
	<div class="row">
		<div class="col-sm-12 product-list" id="all-product-list"></div>
	</div>
</div>	
