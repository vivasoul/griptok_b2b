/* detail javascript for /admin/product */
const loadSelect = function(selector, url, cd_key, cd_nm_key, callback){
	cd_key = cd_key || "cd";
	cd_nm_key = cd_nm_key || "cd_nm";
	
	jQuery.ajax({
		url:url,
		method:"GET",
		dataType:"json"
	}).done(function(datas){
		const $dom = jQuery(selector);
		$dom.empty();
		const options = [];
		for(let i=0; i<datas.length; i++){
			const d = datas[i];
			const option = document.createElement("option");
			option.value = d[cd_key];
			option.innerHTML = d[cd_nm_key];
			options.push(option);
		}
		$dom.append(options);
		
		const lazyValue = $dom.lazyVal();
		if(lazyValue !== null) $dom.val(lazyValue);
		
		if(callback instanceof Function) callback();
	}).fail(function(e){
		/* error callback */
	}).always(function(e){
		/* always.. */
	});	
};

const loadBrandNo = function(){
	const p_brand_no = jQuery("#v_p_brand_no").val();
	loadSelect("#v_brand_no","/categories/brands?p_brand_no="+p_brand_no,"brand_no","brand_nm");
};

const loadPBrandNo = function(){
	loadSelect("#v_p_brand_no","/categories/brands","brand_no","brand_nm", loadBrandNo);
};

const loadCraftNo = function(){
	loadSelect("#v_craft_no","/categories/crafts","craft_no","craft_nm");
};

const setData = function(data){
	console.log(data);
	jQuery("#v_title").val(data["title"]);
	jQuery("#v_retail_price").val(data["retail_price"]);
	jQuery("#v_sales_price").val(data["sales_price"]);
	jQuery("#v_stock_cnt").val(data["stock_cnt"]);
	jQuery("#v_craft_no").lazyVal(data["craft_no"]);
	loadCraftNo();
	jQuery("#v_p_brand_no").lazyVal(data["p_brand_no"]);
	jQuery("#v_brand_no").lazyVal(data["brand_no"]);
	loadPBrandNo();
	jQuery("#v_is_new").prop("checked",data["is_new"] === "Y");
	jQuery("#v_is_best").prop("checked",data["is_best"] === "Y");
	jQuery("#v_is_dc").prop("checked",data["is_dc"] === "Y");
	
	const thumb_file = data["thumb_file"];
	const files = data["files"];
	if(thumb_file){
		jQuery("#v_thumb_img_no").val(thumb_file.img_no);
		jQuery("#v_thumb_file").prop("defaultSrc",thumb_file.img_path).fire("change");
	}
	if(files.length){
		for(let i=0;i<files.length;i++){
			jQuery("#v_img_no_"+(i+1)).val(files[i].img_no);
			jQuery("#v_file_"+(i+1)).prop("defaultSrc",files[i].img_path).fire("change");		
		}
	}
};

const loadData = function(product_id) {
	jQuery.ajax({
		  url: "/products/"+product_id+"/edit",
		  method: "GET",
		  dataType: "json"
		}).done(function(data){
			setData(data);
		}).fail(function(e){
			console.log(e);
		}).always(function(){
			
		});
};

const insertData = function(){
    const form = jQuery('#save-product-form')[0];
    
    if(!form.reportValidity()) return false;
    // Create an FormData object 
    const formData = new FormData(form);

   // disabled the submit button
    jQuery("#save-product-btn").prop("disabled", true);
   
	jQuery.ajax({
	  url: "/products",
	  method: "POST",
	  enctype:"multipart/form-data",
      contentType: false, 
      processData: false,
      data: formData
	}).done(function(data){
		alert("성공적으로 저장되었습니다.");
		location.href="/admin/products";
	}).fail(function(e){
		console.log(e);
	}).always(function(){
		
	});
};

const updateData = function(product_id){
    const form = jQuery('#save-product-form')[0];
    
    if(!form.reportValidity()) return false;
    // Create an FormData object 
    const formData = new FormData(form);

   // disabled the submit button
    jQuery("#save-product-btn").prop("disabled", true);
   
	jQuery.ajax({
	  url: "/products/"+product_id,
	  method: "POST",
	  enctype:"multipart/form-data",
      contentType: false, 
      processData: false,
      data: formData
	}).done(function(data){
		alert("성공적으로 수정되었습니다.");
		location.href="/admin/products";
	}).fail(function(e){
		console.log(e);
	}).always(function(){
		
	});
};