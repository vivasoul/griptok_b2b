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
	const product_id = this.getAttribute("data-id");
	moveToCart(product_id, 1);	
};

const on_interested_click = function(e){
	const product_id = this.getAttribute("data-id");
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
			price_div.appendChild(real_span);
			price_div.appendChild(base_span);
			
		anchor.appendChild(img_div);
		anchor.appendChild(title_div);
		anchor.appendChild(price_div);
	
		const overlay_div = document.createElement("div");
		overlay_div.className = "gtk-thumb-overlay";
		
			/* elements about overlay icons */
			const o_icon_left = document.createElement("div");
			if(data["is_fav"] == "Y")	o_icon_left.className = "gtk-fav-shorcut active";
			else						o_icon_left.className = "gtk-fav-shorcut";
			
			o_icon_left.setAttribute("data-id", id);
			o_icon_left.onclick = on_interested_click;
			
			const o_icon_right = document.createElement("div");
			if(data["is_carted"] == "Y")	o_icon_right.className = "gtk-cart-shorcut active";
			else							o_icon_right.className = "gtk-cart-shorcut";
			
			o_icon_right.setAttribute("data-id", id);
			o_icon_right.onclick = on_carted_click;
	
		overlay_div.appendChild(o_icon_left);	
		overlay_div.appendChild(o_icon_right);
			
	main_div.appendChild(anchor);
	main_div.appendChild(overlay_div);
	
	//main_div.onmouseover = on_maindiv_in;
	//main_div.onmouseout = on_maindiv_out;
	
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
		const box_loop = Math.ceil(len/4);
		for(let i=0; i<box_loop; i++){
			const start = i*4;
			const end = (i+1)*4 > len ? len : (i+1)*4;
			const box_div = document.createElement("div"); 
			box_div.className = "gtk-shopping-row";
			for(let j=start;j<end;j++ ){
				box_div.append(thumbnailGenerator(datas[j]));
			}
			dom_arr.push(box_div);
		}
		
		jQuery("#"+render_id).empty().append(dom_arr);
	}).fail(function(e){
		//console.log("loadList failed..");
		console.log(e);
	}).always(function(){
		//console.log("loadList finished.")
	});
};
