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

const loadData = function(product_id) {
	jQuery.ajax({
		  url: "/products/"+product_id,
		  method: "GET",
		  dataType: "json"
		}).done(function(data){
			console.log(data);
			//renderData(data);
			//jQuery("#gtk-detail-main").prop("data",data);
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
}