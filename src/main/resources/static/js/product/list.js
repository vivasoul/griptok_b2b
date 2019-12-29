const getProductURL = function(product_id){
	const path = location.pathname;
	const query = location.search.replace(/[?]/,"");
	let url = "/main/detail?product_id="+product_id;
	if(path == "/main/brand"){
		url += "&"+query+"&mode=B";
	}else if(path == "/main/craft"){
		url += "&"+query+"&mode=C";
	}
	
	return url;
}; 

const thumbnailGenerator = function(data) {
	const anchor = document.createElement("a");
	anchor.href = getProductURL(data.product_id);
	
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
			base_span.innerHTML = currency_formatter(data.retail_price,"원");
			const real_span = document.createElement("span");
			real_span.className = "real-price"; 
			real_span.innerHTML = currency_formatter(data.sales_price,"원");
		price_div.appendChild(base_span);
		price_div.appendChild(real_span);	
		
	main_div.appendChild(img_div);
	main_div.appendChild(title_div);
	main_div.appendChild(price_div);
	
	anchor.appendChild(main_div);
	return anchor;
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
		//console.log("loadList failed..");
		console.log(e);
	}).always(function(){
		//console.log("loadList finished.")
	});
};
