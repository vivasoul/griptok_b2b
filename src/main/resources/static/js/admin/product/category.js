const renderCraft = function(datas){
	const $target = jQuery("#craft-type-table tbody");
	$target.empty();
	const trs = [];
	for(let i=0;i<datas.length;i++){
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

const renderBrand = function(datas){
	const $target = jQuery("#brand-type-table tbody");
	$target.empty();	
	const trs = [];
	for(let i=0;i<datas.length;i++){
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

const renderCategory = function(datas){
	const $target = jQuery("#category-type-table tbody");
	$target.empty();
	const trs = [];
	for(let i=0;i<datas.length;i++){
		const d = datas[i];
		const tr = document.createElement("tr");
			const td1 = document.createElement("td");
			td1.className="gtk-td-center";
			td1.innerHTML = d["category_no"];
			const td2 = document.createElement("td");
			td2.innerHTML = d["craft"]["craft_nm"];
			const td3 = document.createElement("td");
			td3.innerHTML = d["brand"]["p_brand_nm"];
			const td4 = document.createElement("td");
			td4.innerHTML = d["brand"]["brand_nm"];
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

const loadCraft = function(){
	jQuery.ajax({
		  url: "/categories/crafts",
		  method: "GET",
		  dataType: "json"
	}).done(function(datas){
		renderCraft(datas);
	}).fail(function(e){
		//console.log("loadList failed..");
		console.log(e);
	}).always(function(){
		//console.log("loadList finished.")
	});	
};

const loadBrand = function(){
	jQuery.ajax({
		  url: "/categories/brands",
		  method: "GET",
		  dataType: "json"
	}).done(function(datas){
		renderBrand(datas);
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
		renderCategory(datas);
	}).fail(function(e){
		//console.log("loadList failed..");
		console.log(e);
	}).always(function(){
		//console.log("loadList finished.")
	});		
};