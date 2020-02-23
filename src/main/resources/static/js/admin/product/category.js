const loadBrandNo = function(){
	const p_brand_no = jQuery("#v_p_brand_no").val();
	loadSelect("#v_brand_no","/categories/brands?p_brand_no="+p_brand_no,"brand_no","brand_nm");
};

const loadPBrandNo = function(){
	loadSelect("#v_p_brand_no","/categories/brands","brand_no","brand_nm", loadBrandNo);
};

const loadPBrandNo2 = function(){
	loadSelect("#v_p_brand_no_2","/categories/brands","brand_no","brand_nm");
};

const loadCraftNo = function(){
	loadSelect("#v_craft_no","/categories/crafts","craft_no","craft_nm");
};

const renderCraft = function(datas, min_idx, max_idx){
	const $target = jQuery("#craft-type-table tbody");
	$target.empty();
	const trs = [];
	for(let i=min_idx;i<max_idx;i++){
		const d = datas[i];
		const tr = document.createElement("tr");
			const td1 = document.createElement("td");
			td1.className="gtk-td-center";
			td1.innerHTML = d["craft_no"];
			const td2 = document.createElement("td");
			td2.innerHTML = d["craft_nm"];
			const td3 = document.createElement("td");
			td3.className="gtk-td-center";
				const checkbox = document.createElement("input");
				checkbox.type="checkbox";
				checkbox.value="Y";
				checkbox.checked = d["use_yn"] === "Y"
			td3.appendChild(checkbox);
		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		
		trs.push(tr);
	}
	$target.append(trs);
};

const renderBrand = function(datas, min_idx, max_idx){
	const $target = jQuery("#brand-type-table tbody");
	$target.empty();	
	const trs = [];
	for(let i=min_idx;i<max_idx;i++){
		const d = datas[i];
		const tr = document.createElement("tr");
			const td1 = document.createElement("td");
			td1.className="gtk-td-center";
			td1.innerHTML = d["brand_no"];
			const td2 = document.createElement("td");
			td2.innerHTML = d["p_brand_nm"];
			const td3 = document.createElement("td");
			td3.innerHTML = d["brand_nm"];			
			const td4 = document.createElement("td");
			td4.className="gtk-td-center";
				const checkbox = document.createElement("input");
				checkbox.type="checkbox";
				checkbox.value="Y";
				checkbox.checked = d["use_yn"] === "Y"
			td4.appendChild(checkbox);
		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		tr.appendChild(td4);
		
		trs.push(tr);
	}
	$target.append(trs);
};

const renderCategory = function(datas, min_idx, max_idx){
	const $target = jQuery("#category-type-table tbody");
	$target.empty();
	const trs = [];
	for(let i=min_idx;i<max_idx;i++){
		const d = datas[i];
		const tr = document.createElement("tr");
			const td1 = document.createElement("td");
			td1.className="gtk-td-center";
			td1.innerHTML = d["category_no"];
			const td2 = document.createElement("td");
			td2.innerHTML = d["brand"]["p_brand_nm"];
			const td3 = document.createElement("td");
			td3.innerHTML = d["brand"]["brand_nm"];
			const td4 = document.createElement("td");
			td4.innerHTML = d["craft"]["craft_nm"];			
			const td5 = document.createElement("td");
			td5.innerHTML = d["category_nm"];
			const td6 = document.createElement("td");
			td6.className="gtk-td-center";
				const checkbox = document.createElement("input");
				checkbox.type="checkbox";
				checkbox.value="Y";
				checkbox.checked = d["use_yn"] === "Y"
			td6.appendChild(checkbox);
		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		tr.appendChild(td4);
		tr.appendChild(td5);
		tr.appendChild(td6);
		
		trs.push(tr);
	}
	$target.append(trs);
};

const refreshPager = function(){
	const callback = this["render_callback"];
	const datas = this["datas"];
	const current = this["current"];
	const row_per_page = this["row_per_page"];
	
	const total_cnt = datas.length;
	const min_idx = row_per_page*(current-1); //idx start from 0
	const max_idx = row_per_page*current > total_cnt ? total_cnt : row_per_page*current; //idx ends right before total_cnt
	
	callback(datas, min_idx, max_idx)
};

const updatePager = function(){
	const current = this["pager"]["current"];
	const $this = jQuery(this);
	$this.find(".gtk-pager-button").removeClass("active");
	$this.find(".gtk-pager-button.page-no-"+current).addClass("active");		
	this["pager"]["refresh_handler"]();
};


const renderPager = function(selector, render_callback, datas){
	const paging_data = { "total_cnt": datas.length, "current": 1, "row_per_page": 5 };
	
	const total_cnt = paging_data["total_cnt"];
	const current = Number(paging_data["current"]) || 1;
	const ROW_PER_PAGE = Number(paging_data["row_per_page"]) || 20;
	const page_cnt = Math.ceil(total_cnt/ROW_PER_PAGE);
	
	const $pager = jQuery(selector);
	const pager_obj = {
		"refresh_handler": refreshPager,
		"render_callback": render_callback,
		"datas": datas,
		"current": current,
		"page_cnt": page_cnt,
		"row_per_page": ROW_PER_PAGE
	};
		
	$pager.prop("pager", pager_obj);
	$pager.prop("updatePager", updatePager);
	$pager.addClass("gtk-pager");
	$pager.empty();
	
	const pages = [];
	const prev = document.createElement("a");
	prev.className = "gtk-pager-prev";
	prev.innerHTML = "이전";
	prev.onclick = function(e){
		const parent = e.target.parentNode;
		const current = parent["pager"]["current"];
		if(current > 1)	parent["pager"]["current"] = current - 1;
		updatePager.apply(parent);
	};
	pages.push(prev);
	
	for(let i=0; i<page_cnt; i++){
		const p = document.createElement("a");
		p.className = "gtk-pager-button page-no-"+(i+1);
		if(i==0) p.className += " active";
		p.innerHTML = (i+1)+"";
		p["page-no"] = i+1;
		p.onclick = function(e){
			const parent = e.target.parentNode;
			console.dir(parent["pager"]);
			parent["pager"]["current"] = this["page-no"];
			updatePager.apply(parent);
		};
		pages.push(p);
	}
	const next = document.createElement("a");
	next.className = "gtk-pager-next";
	next.innerHTML = "다음";
	next.onclick = function(e){
		const parent = e.target.parentNode;
		const current = parent["pager"]["current"];
		const page_cnt = parent["pager"]["page_cnt"];
		if(current < page_cnt)	parent["pager"]["current"] = current + 1;
		updatePager.apply(parent);
	};
	pages.push(next);
	
	$pager.append(pages);
	updatePager.apply($pager[0]);
};

const loadCraft = function(){
	jQuery.ajax({
		  url: "/categories/crafts",
		  method: "GET",
		  dataType: "json"
	}).done(function(datas){
		//renderCraft(datas);
		renderPager("#craft-type-pager", renderCraft, datas);
	}).fail(function(e){
		//console.log("loadList failed..");
		console.log(e);
	}).always(function(){
		//console.log("loadList finished.")
	});	
};

const loadBrand = function(){
	jQuery.ajax({
		  url: "/categories/brands/all",
		  method: "GET",
		  dataType: "json"
	}).done(function(datas){
		//renderBrand(datas);
		renderPager("#brand-type-pager", renderBrand, datas);
	}).fail(function(e){
		//console.log("loadList failed..");
		console.log(e);
	}).always(function(){
		//console.log("loadList finished.")
	});		
};

const loadCategory = function(){
	jQuery.ajax({
		  url: "/categories",
		  method: "GET",
		  dataType: "json"
	}).done(function(datas){
		//renderCategory(datas);
		renderPager("#category-type-pager", renderCategory, datas);
	}).fail(function(e){
		//console.log("loadList failed..");
		console.log(e);
	}).always(function(){
		//console.log("loadList finished.")
	});		
};

const insertCraft = function(craft_nm){
	jQuery.ajax({
	  url: "/categories/crafts",
	  method: "POST",
      contentType: "application/json", 
      processData: false,
      data: JSON.stringify({"craft_nm": craft_nm})
	}).done(function(data){
		alert("성공적으로 저장되었습니다.");
		loadCraft();
		loadCraftNo();
	}).fail(function(e){
		console.log(e);
	}).always(function(){
		
	});	
};

const insertBrand = function(p_brand_no, brand_nm){
	jQuery.ajax({
	  url: "/categories/brands",
	  method: "POST",
      contentType: "application/json", 
      processData: false,
      data: JSON.stringify({"p_brand_no": p_brand_no, "brand_nm": brand_nm})
	}).done(function(data){
		alert("성공적으로 저장되었습니다.");
		
		loadBrand();
		loadPBrandNo();
		loadPBrandNo2();
	}).fail(function(e){
		console.log(e);
	}).always(function(){
		
	});	
};

const insertCategory = function(craft_no, brand_no, category_nm){
	jQuery.ajax({
	  url: "/categories",
	  method: "POST",
      contentType: "application/json", 
      processData: false,
      data: JSON.stringify({"craft_no": craft_no, "brand_no": brand_no, "category_nm": category_nm})
	}).done(function(data){
		alert("성공적으로 저장되었습니다.");
		
		loadCategory();
	}).fail(function(e){
		console.log(e);
	}).always(function(){
		
	});		
};

const updateCraft = function(craft_no, use_yn){
	jQuery.ajax({
	  url: "/categories/crafts/"+craft_no,
	  method: "PUT",
      contentType: "application/json", 
      processData: false,
      data: JSON.stringify({"use_yn": use_yn})
	}).done(function(data){
		//alert("성공적으로 저장되었습니다.");
		//loadCraft();
		//loadCraftNo();
	}).fail(function(e){
		console.log(e);
	}).always(function(){
		
	});		
};

const updateBrand = function(brand_no, use_yn){
	jQuery.ajax({
	  url: "/categories/brands/"+brand_no,
	  method: "PUT",
      contentType: "application/json", 
      processData: false,
      data: JSON.stringify({"use_yn": use_yn})
	}).done(function(data){
		//alert("성공적으로 저장되었습니다.");
		//loadBrand();
		//loadPBrandNo();
		//loadPBrandNo2();
	}).fail(function(e){
		console.log(e);
	}).always(function(){
		
	});		
};

const updateCategory = function(category_no, use_yn){
	jQuery.ajax({
	  url: "/categories/"+category_no,
	  method: "PUT",
      contentType: "application/json", 
      processData: false,
      data: JSON.stringify({"use_yn": use_yn})
	}).done(function(data){
		//alert("성공적으로 저장되었습니다.");
		//loadCategory();
	}).fail(function(e){
		console.log(e);
	}).always(function(){
		
	});		
};