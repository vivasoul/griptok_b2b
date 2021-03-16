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
			
			o_icon_left.title = "관심상품";
			o_icon_left.setAttribute("data-id", id);
			o_icon_left.onclick = on_interested_click;
			
			const o_icon_right = document.createElement("div");
			o_icon_right.title = "장바구니";
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

const ACTIVE_CLASS = "active";
const resizeBannerBox = function(){
	const width = window.document.body.clientWidth;
	let left = 600 - width/2	;
	if(left > 0) left = 0;
	jQuery("#main-banners").css("width", width+"px").css("left", left+"px");
	
	const $img = jQuery(".main-banner.active img");
	const naturalWidth = $img.prop("naturalWidth") || 2000;
	const naturalHeight = $img.prop("naturalHeight") || 900;
	const img_height = width/naturalWidth*naturalHeight;
	
	const height =img_height*0.75+5;
	const top = img_height/4*-1-5;
	const banner_top = img_height/15*-1;
	
	jQuery("#main-banners").css("top", top+"px").css("height", height+"px");
	jQuery("#main-banner-links").css("top", banner_top+"px");
};

const renderBanners = function(banners) {
	const len = banners && banners.length;
	if(len) {
		const bs = []; 
		const ls = [];
		for(let i=0; i<len; i++){
			const is_active = i === 0;
			const b = banners[i];
			const id = "banner_"+b["banner_no"];
			const b_div = document.createElement("div");
			b_div.className = is_active ? "main-banner active" : "main-banner";
			b_div.id = id;
				const b_img = document.createElement("img");
				b_img.src = b["banner_img"];
			b_div.appendChild(b_img);
			bs.push(b_div);
			
			const l_div = document.createElement("div");
			l_div.className = is_active ? "banner-link active" : "banner-link";
			l_div.innerHTML = b["banner_txt"];
			l_div.setAttribute("banner-id", id);
			
			ls.push(l_div);			
		}
		jQuery("#main-banners").append(bs);
		jQuery("#main-banner-links").append(ls);
	}
	setTimeout(resizeBannerBox, 1);
};

const loadBanners = function() {
	jQuery.ajax({
		  url: "/banners",
		  method: "GET",
		  dataType: "json"
		}).done(renderBanners).fail(function(e){
			console.log(e);
		}).always(function(){
			
		});
};