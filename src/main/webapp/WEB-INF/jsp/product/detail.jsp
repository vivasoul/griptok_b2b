<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/js/product/detail.js"></script>
<link rel="stylesheet" href="/css/product/detail.css" />
<script type="text/javascript">
jQuery(document).ready(function(){
	loadData("<%=request.getAttribute("product_id").toString()%>");
	jQuery(".gtk-detail-images-thumbs").on("click", "img", function(e){
		jQuery(".gtk-detail-images-big>img").prop("src", e.target.src);
	});
	
	jQuery("input.input-quantity").on("change", function(e){
		updateCount(e.target.value);
	});
	
	jQuery(".gtk-detail-quantity .quantity-down-btn").on("click", function(e){
		let q = jQuery("input.input-quantity").val();
		q--;
		jQuery("input.input-quantity").val(q);
		updateCount(q);
	});
	
	jQuery(".gtk-detail-quantity .quantity-up-btn").on("click", function(e){
		let q = jQuery("input.input-quantity").val();
		q++;
		jQuery("input.input-quantity").val(q);		
		updateCount(q);
	});
});
</script>
<div id="gtk-detail-main" class="container-fluid">
	<div class="row gtk-detail">
		<div class="col-sm-6 gtk-detail-images">
			<div class="gtk-detail-images-big"></div>
			<div class="gtk-detail-images-thumbs"></div>
		</div>
		<div class="col-sm-6">
			<div class="gtk-detail-id">상품 번호:<span class="data-id"></span></div>
			<div class="gtk-detail-title data-title"></div>
			<div class="gtk-detail-price"><span class="data-retail-price"></span><span class="data-sales-price"></span></div>
			<div class="gtk-detail-quantity">수량<button class="quantity-down-btn">-</button><input class="input-quantity" type="text" value="1"/><button class="quantity-up-btn">+</button></div>
			<div class="gtk-detail-summary">
				<span class="detail-summary-1">총 수량 <span class="data-total-count"></span>개</span> / 
				<span class="detail-summary-2">총 상품 금액</span>
				<span class="detail-summary-3 data-total-amount"></span></div>
			<div class="gtk-detail-btn-group"><!-- 
				 --><button type="button" class="gtk-btn" id="goto-cart-btn">장바구니</button>
				 	<button type="button" class="gtk-btn gtk-btn-blue" id="goto-buy-btn">바로구매</button>
				 	<button type="button" class="gtk-btn" id="goto-interset-btn">관심상품</button><!--
			 --></div>
			 <input id="sales-price" type="hidden" value="0" />
		</div>
	</div>
	<div class="row gtk-detail"><div class="col-sm-12 gtk-description-header">상품 상세 설명</div></div>
	<div class="row gtk-detail">
		<div class="col-sm-12 gtk-description-body">
		</div>
	</div>
</div>	