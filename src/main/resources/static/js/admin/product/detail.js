/* detail javascript for /admin/product */
const addOption = function(option_txt, option_no){
	const row = document.createElement("div");
	row.className = "gtk-option-row";
		const input = document.createElement("input");
		input.type="text";
		input.required = true;
		input.name="option_txt";
		input.className="gtk-option-txt";
		input.value = option_txt;
		const button = document.createElement("button");
		button.type="button";
		button.className="gtk-option-btn";
			const icon = document.createElement("i");
			icon.className = "fa fa-minus";
		button.appendChild(icon);
		const input1 = document.createElement("input");
		input1.name="option_del_yn";
		input1.type="hidden";
		input1.value="N";
		const input2 = document.createElement("input");
		input2.name="option_no";
		input2.type="hidden";
		input2.value=option_no || "-1";
		
	row.appendChild(input);
	row.appendChild(button);
	row.appendChild(input1);
	row.appendChild(input2);
	
	jQuery("#gtk-inputs-added").append(row);
};

const deleteOption = function($parent){
	$parent.find("input[name='option_del_yn']").val("Y");
	$parent.find("input[name='option_txt']").prop("readOnly", true);
	$parent.find(".gtk-option-btn .fa").removeClass("fa-minus").addClass("fa-refresh");	
};

const revertOption = function($parent){
	$parent.find("input[name='option_del_yn']").val("N");
	$parent.find("input[name='option_txt']").prop("readOnly", false);
	$parent.find(".gtk-option-btn .fa").removeClass("fa-refresh").addClass("fa-minus");
};

const loadCategoryNo = function() {
	const craft_no = jQuery("#v_craft_no").val();
	const brand_no = jQuery("#v_brand_no").val();
	
	loadSelect("#v_category_no","/categories?brand_no="+brand_no+"&craft_no="+craft_no,"category_no","category_nm");
};

const loadBrandNo = function(no_callback){
	const p_brand_no = jQuery("#v_p_brand_no").val();
	loadSelect("#v_brand_no","/categories/brands?p_brand_no="+p_brand_no,"brand_no","brand_nm", no_callback ? null : loadCategoryNo);
};

const loadPBrandNo = function(){
	loadSelect("#v_p_brand_no","/categories/brands","brand_no","brand_nm", loadBrandNo);
};

const loadCraftNo = function(no_callback){
	loadSelect("#v_craft_no","/categories/crafts","craft_no","craft_nm", no_callback ? null : loadCategoryNo);
};

const setData = function(data){
	jQuery("#v_title").val(data["title"]);
	jQuery("#v_retail_price").val(data["retail_price"]);
	jQuery("#v_sales_price").val(data["sales_price"]);
	jQuery("#v_stock_cnt").val(data["stock_cnt"]);
	jQuery("#v_craft_no").lazyVal(data["craft_no"]);
	loadCraftNo(true);
	jQuery("#v_p_brand_no").lazyVal(data["p_brand_no"]);
	jQuery("#v_brand_no").lazyVal(data["brand_no"]);
	jQuery("#v_category_no").lazyVal(data["category_no"]);
	loadPBrandNo();
	jQuery("#v_is_new").prop("checked",data["is_new"] === "Y");
	jQuery("#v_is_best").prop("checked",data["is_best"] === "Y");
	jQuery("#v_is_dc").prop("checked",data["is_dc"] === "Y");
	jQuery("#v_description").prop("checked",data["description"] === "Y");
	
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
	const options = data["options"];
	if(options.length){
		for(let i=0;i<options.length;i++){
			const opt = options[i];
			addOption(opt.option_txt, opt.option_no);
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

const preprocessOption = function(){
	jQuery("#gtk-inputs-added .gtk-option-row").each(function(idx,elem){
		const $this = jQuery(elem);
		const option_no = Number($this.find("input[name='option_no']").val()) || -1;
		const option_del_yn = $this.find("input[name='option_del_yn']").val();
		
		if(option_no < 0 && option_del_yn === "Y"){
			$this.find("input").prop("disabled",true);
		}
	});
};

const insertData = function(){
    const form = jQuery('#save-product-form')[0];
    preprocessOption();
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
    preprocessOption();
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

/* initial callback for admin product detail-page */
jQuery(document).ready(function(){
	jQuery("#gtk-option-new-btn").on("click", function(){
		const txt = jQuery("#gtk-option-new").val();
		addOption(txt);
		jQuery("#gtk-option-new").val("");
	});
	
	jQuery("#gtk-inputs-added").on("click", ".gtk-option-btn", function(){
		const $parent = jQuery(this.parentNode);
		const deleted = $parent.find("input[name='option_del_yn']").val();
		if(deleted === "Y")	revertOption($parent);
		else							deleteOption($parent);
	});
});
