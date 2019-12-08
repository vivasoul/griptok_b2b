<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style type="text/css">
	.main-shopping-list {
		margin-top:20px;
	}
	.main-shopping-list .main-banner{
		display:inline-block;
		border:2px solid #999;
		width:100%;
		height:230px;
		padding:3px;
		vertical-align:center;
	}
	.main-shopping-list .event-header{
		margin-top:10px;
		background-color: #999;
	    color: #FFF;
	    padding: 2px 0px 2px 15px;
	}
	
	.griptok-thumb {
		display:inline-block;
		width:210px;
		min-height:245px;
		padding:2px;
		vertical-align:top;
	}
	.griptok-thumb>.thumb-image { width:200px;height:200px; }
	.griptok-thumb>.thumb-image>img { width:100%;height:100%; }	
	.griptok-thumb>.thumb-title { text-align:left;font-size:0.95em;	}
	.griptok-thumb>.thumb-price { text-align:right;	}
	.thumb-price>.base-price { font-size:0.7em;text-decoration:line-through; }	
	.thumb-price>.real-price { font-size:1.1em;font-weight:bold; }	
</style>
<script type="text/javascript">
const currency_formatter = function(amount, unit) {
	
	return amount+unit;
};

const thumbnailGenerator = function(data) {
	const main_div = document.createElement("div");
	main_div.className = "griptok-thumb";
	
		const img_div = document.createElement("div");
		img_div.className = "thumb-image";
			const img = document.createElement("img");
			img.src = data.thumb_img;
		img_div.appendChild(img);
		
		const title_div = document.createElement("div");
		title_div.className = "thumb-title";
		title_div.innerHTML = data.title;
		
		const price_div = document.createElement("div");
		price_div.className = "thumb-price";
			const base_span = document.createElement("span");
			base_span.className = "base-price";
			base_span.innerHTML = currency_formatter(data.price+3100,"원");
			const real_span = document.createElement("span");
			real_span.className = "real-price"; 
			real_span.innerHTML = currency_formatter(data.price,"원");
		price_div.appendChild(base_span);
		price_div.appendChild(real_span);	
		
	main_div.appendChild(img_div);
	main_div.appendChild(title_div);
	main_div.appendChild(price_div);
	
	return main_div;
}

const loadList = function(url, render_id){
	jQuery.ajax({
	  url: url,
	  method: "GET",
	  dataType: "json"
	}).done(function(datas){
		
		const len = datas.length;
		const dom_arr = [];
		for(let i=0; i<len; i++){
			dom_arr.push(thumbnailGenerator(datas[i]));
		}
		if(dom_arr.length) jQuery("#"+render_id).append(dom_arr);
		
	}).fail(function(e){
		console.log("loadList failed..");
		console.log(e);
	}).always(function(){
		console.log("loadList finished.")
	});
};

jQuery(document).ready(function(){
	loadList("/product/new","new-product-list");
	loadList("/product/new","best-product-list");
	loadList("/product/new","special-product-list");
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
	<div class="row"><div class="col-sm-12"><div class="event-header">신상품</div></div></div>
	<div class="row">
		<div class="col-sm-12" id="new-product-list"></div>
	</div>
	<div class="row"><div class="col-sm-12"><div class="event-header">베스트 상품</div></div></div>
	<div class="row">
		<div class="col-sm-12" id="best-product-list"></div>
	</div>
	<div class="row"><div class="col-sm-12"><div class="event-header">특가 상품(<span></span>)</div></div></div>
	<div class="row">
		<div class="col-sm-12" id="special-product-list"></div>
	</div>
</div>	
