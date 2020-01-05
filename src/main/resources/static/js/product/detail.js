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

const loadData = function(product_id) {
	jQuery.ajax({
		  url: "/products/"+product_id,
		  method: "GET",
		  dataType: "json"
		}).done(function(data){
			renderData(data);
			jQuery("#gtk-detail-main").prop("data",data);
		}).fail(function(e){
			console.log(e);
		}).always(function(){
			
		});
};

const moveToCart = function(product_id, carted_cnt) {
	jQuery.ajax({
		  url: "/carteds",
		  method: "POST",
		  contentType: "application/json",
		  data: JSON.stringify([
			  {"product_id":product_id, "carted_cnt": carted_cnt}
		  ])
		}).done(function(e){
			alert("해당 상품을 장바구니에 추가하였습니다.");
		}).fail(function(e){
			console.log(e);
		}).always(function(){
			
		});	
};

const moveToInterested = function(product_id) {
	jQuery.ajax({
		  url: "/interesteds",
		  method: "POST",
		  contentType: "application/json",
		  data: JSON.stringify([
			  {"product_id":product_id}
		  ])
		}).done(function(e){
			alert("해당 상품을 관심상품에 추가하였습니다.");
		}).fail(function(e){
			console.log(e);
		}).always(function(){
			
		});	
};