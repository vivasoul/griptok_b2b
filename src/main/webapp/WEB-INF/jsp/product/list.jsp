<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="/css/product/list.css" />
<script type="text/javascript" src= "/js/product/list.js"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
	loadList("/products/new","new-product-list");
	loadList("/products/best","best-product-list");
	loadList("/products/dc","special-product-list"); 
});
</script>
<div class="container-fluid main-shopping-list">
	<div class="row">
		<div class="col-sm-12">
			<div class="main-banner">
				<img src="/img/product/main_banner/banner_1.png"/>
			</div>
		</div>
	</div>
	<div class="row"><div class="col-sm-12"><div class="event-header">�Ż�ǰ</div></div></div>
	<div class="row">
		<div class="col-sm-12 product-list" id="new-product-list"></div>
	</div>
	<div class="row"><div class="col-sm-12"><div class="event-header">����Ʈ ��ǰ</div></div></div>
	<div class="row">
		<div class="col-sm-12 product-list" id="best-product-list"></div>
	</div>
	<div class="row"><div class="col-sm-12"><div class="event-header">Ư�� ��ǰ(<span></span>)</div></div></div>
	<div class="row">
		<div class="col-sm-12 product-list" id="special-product-list"></div>
	</div>
</div>	
