<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="/css/product/detail.css" />
<script type="text/javascript">
const currency_formatter = function(amount, unit) {
	let input = amount;
	const format_arr = [];

	while(input > 999){
		const rest = input % 1000;
		
		if(rest < 10) format_arr.push("00"+rest);
		else if(rest < 100) format_arr.push("0"+rest);
		else				format_arr.push(""+rest);
		
		input = (input - rest)/1000;
	}
	format_arr.push(""+input);
	
	return format_arr.reverse().join(",")+unit;
};

const updateCount = function(cnt) {
	const _cnt = Number(cnt) || 0;
	const $sum = jQuery("#gtk-detail-main .gtk-detail-summary");
	const price = Number(jQuery("#sales-price").val()) || 0;
	$sum.find(".data-total-count").text(cnt);
	$sum.find(".data-total-amount").text(currency_formatter(_cnt*price,'원'));
};

const renderData = function(data) {
	const $body = jQuery("#gtk-detail-main");
	
	$body.find(".data-id").text(data.product_id);
	$body.find(".data-title").text(data.title);
	$body.find(".data-retail-price").text(currency_formatter(data.retail_price,'원'));
	$body.find(".data-sales-price").text(currency_formatter(data.sales_price,'원'));
	jQuery("#sales-price").val(data.sales_price);
	const len = data.images.length;
	if(len){
		for(let i=0; i<len; i++){
			if(i == 0){
				const f_img = document.createElement("img");
				f_img.src = data.images[i];
				$body.find(".gtk-detail-images-big").append(f_img);
			}
			const img = document.createElement("img");
			img.src = data.images[i];
			$body.find(".gtk-detail-images-thumbs").append(img);			
		}
	}
	updateCount(1);
};



const loadData = function() {
	jQuery.ajax({
		  url: "/products/<%=request.getAttribute("product_id").toString()%>",
		  method: "GET",
		  dataType: "json"
		}).done(function(data){
			renderData(data);
			jQuery("#gtk-detail-main").prop("data",data);
		}).fail(function(e){
			console.log(e);
		}).always(function(){
			
		});
}

jQuery(document).ready(function(){
	loadData();
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
				 --><button type="button" id="goto-cart-btn">장바구니</button>
				 	<button type="button" id="goto-buy-btn">바로구매</button>
				 	<button type="button" id="goto-interset-btn">관심상품</button><!--
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