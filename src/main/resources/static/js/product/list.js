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

/* use these as the jquery callbacks for carted/interested shortcuts */
const on_maindiv_in = function(e){
	jQuery(this).find(".gtk-thumb-overlay").show();
	
};
const on_maindiv_out = function(e){
	jQuery(this).find(".gtk-thumb-overlay").hide();
};

const on_carted_click = function(e){
	const product_id = this.parentNode.product_id;
	moveToCart(product_id, 1);	
};

const on_interested_click = function(e){
	const product_id = this.parentNode.product_id;
	moveToInterested(product_id);	
};

const thumbnailGenerator = function(data) {
	const id = data.product_id;
	
	const main_div = document.createElement("div");
	main_div.className = "griptok-thumb";
	
		const anchor = document.createElement("a");
		anchor.href = getProductURL(id);
		
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
			
		anchor.appendChild(img_div);
		anchor.appendChild(title_div);
		anchor.appendChild(price_div);
	
		const overlay_div = document.createElement("div");
		overlay_div.className = "gtk-thumb-overlay";
		
			/* elements about overlay icons */
			const overlay_img = document.createElement("img");
			overlay_img.src = "/img/product/griptok_overlay_2.png";
			overlay_img.useMap = "#gtk_product_"+id;
			const _map = document.createElement("map");
			_map.name = "gtk_product_"+id;
			_map.product_id = id;
				const _left_area = document.createElement("area");
				_left_area.shape = "circle";
				_left_area.coords = "35,29,25";
				_left_area.style.cursor = "pointer";
				_left_area.onclick = on_carted_click;
				
				const _right_area = document.createElement("area");
				_right_area.shape = "circle";
				_right_area.coords = "105,29,25";
				_right_area.style.cursor = "pointer";
				_right_area.onclick = on_interested_click;
				
			_map.appendChild(_left_area);
			_map.appendChild(_right_area);	
		overlay_div.appendChild(overlay_img);	
		overlay_div.appendChild(_map);
			
	main_div.appendChild(anchor);
	main_div.appendChild(overlay_div);
	
	main_div.onmouseover = on_maindiv_in;
	main_div.onmouseout = on_maindiv_out;
	
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
		jQuery("#"+render_id).empty().append(dom_arr);
	}).fail(function(e){
		//console.log("loadList failed..");
		console.log(e);
	}).always(function(){
		//console.log("loadList finished.")
	});
};
