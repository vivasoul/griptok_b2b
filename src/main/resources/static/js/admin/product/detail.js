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
	
	jQuery("#gtk-options-added").append(row);
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

const addImg = function(img_link){
console.log(img_link);
	const MAX_CNT = (jQuery("#gtk-upload-links").prop("max-img-cnt") || 0)+1;

	const row = document.createElement("div");
	row.className = "gtk-file-upload gtk-file-upload-link";
		const input = document.createElement("input");
		input.type="hidden";
		input.required = true;
		input.name="imgs";
		input.id = "v_img_"+MAX_CNT;
		input.className="upload-link-input";
		input.value = img_link;
		
	row.appendChild(input);
	
	jQuery("#gtk-upload-links").append(row);
	jQuery("#gtk-upload-links").prop("max-img-cnt", MAX_CNT);
	createUpload.call(row);
	jQuery(input).on("change", onUploadLinkChange);
	if(img_link) jQuery(input).prop("defaultSrc",img_link).fire("change");
	return input.id;
};

const loadCategoryNo = function() {
	const craft_no = jQuery("#v_craft_no").val();
	const brand_no = jQuery("#v_brand_no").val();
	
	loadSelect("#v_category_no","/categories?brand_no="+brand_no+"&craft_no="+craft_no,"category_no","category_nm");
};

const loadBrandNo = function(){
	const p_brand_no = jQuery("#v_p_brand_no").val();
	loadSelect("#v_brand_no","/categories/brands?p_brand_no="+p_brand_no,"brand_no","brand_nm", loadCategoryNo);
};

const loadPBrandNo = function(){
	loadSelect("#v_p_brand_no","/categories/brands","brand_no","brand_nm", loadBrandNo);
};

const loadCraftNo = function(){
	loadSelect("#v_craft_no","/categories/crafts","craft_no","craft_nm", loadCategoryNo);
};

const setImage = function($this,img){
		$this.val(img).prop("defaultSrc",img).fire("change");	
};

const setData = function(data){
	jQuery("#v_title").val(data["title"]);
	jQuery("#v_retail_price").val(data["retail_price"]);
	jQuery("#v_sales_price").val(data["sales_price"]);
	jQuery("#v_stock_cnt").val(data["stock_cnt"]);
	
	const craft_no = data["craft_no"];
	const p_brand_no = data["p_brand_no"];
	const brand_no = data["brand_no"];
	const category_no = data["category_no"];
	
	jQuery("#v_craft_no").lazyVal(craft_no);
	jQuery("#v_p_brand_no").lazyVal(p_brand_no);
	jQuery("#v_brand_no").lazyVal(brand_no);
	jQuery("#v_category_no").lazyVal(category_no);
	
	loadSelect("#v_craft_no","/categories/crafts","craft_no","craft_nm");
	loadSelect("#v_p_brand_no","/categories/brands","brand_no","brand_nm");
	loadSelect("#v_brand_no","/categories/brands?p_brand_no="+p_brand_no,"brand_no","brand_nm");
	loadSelect("#v_category_no","/categories?brand_no="+brand_no+"&craft_no="+craft_no,"category_no","category_nm");
	
	jQuery("#v_is_new").prop("checked",data["is_new"] === "Y");
	jQuery("#v_is_best").prop("checked",data["is_best"] === "Y");
	jQuery("#v_is_dc").prop("checked",data["is_dc"] === "Y");
	jQuery("#v_description").prop("checked",data["description"] === "Y");
	
	const thumb_file = data["thumb_file"];
	const files = data["files"];
	if(thumb_file){
		setImage(jQuery("#v_thumb"), thumb_file.img_path);
	}
	const f_len = files.length;
	if(f_len > 0){
		setImage(jQuery("#v_img_top"), files[0].img_link);
		if(f_len > 1) {
			setImage(jQuery("#v_img_bot"), files[f_len-1].img_link);
		}
		if(f_len > 2){
			for(let i=1;i<f_len-1;i++){
				addImg(files[i].img_link);
			}
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
	jQuery("#gtk-options-added .gtk-option-row").each(function(idx,elem){
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

const openModal = function(src_id, old_val){
console.log(src_id);
console.log(old_val);
	jQuery("#target_id").val(src_id);
	jQuery("#v_new_img").val(old_val);
	jQuery("#img-update-modal").gMOpen();
};

const openModal_new = function(){
	jQuery("#img-update-modal").gMOpen({
		"beforeOK": function(){
			const src_id = addImg();
			jQuery("#target_id").val(src_id);
		}
	});
};

/* initial callback for admin product detail-page */
jQuery(document).ready(function(){
	jQuery("#v_p_brand_no").on("change", loadBrandNo);
	jQuery("#v_brand_no").on("change", loadCategoryNo);
	jQuery("#v_craft_no").on("change", loadCategoryNo);

	jQuery("#gtk-option-new-btn").on("click", function(){
		const txt = jQuery("#gtk-option-new").val();
		addOption(txt);
		jQuery("#gtk-option-new").val("");
	});
	
	jQuery("#gtk-options-added").on("click", ".gtk-option-btn", function(){
		const $parent = jQuery(this.parentNode);
		const deleted = $parent.find("input[name='option_del_yn']").val();
		if(deleted === "Y")	revertOption($parent);
		else							deleteOption($parent);
	});
	
	jQuery("#img-update-modal").gModal({
		"onOK": function(){
			const id = jQuery("#target_id").val();
			const value = jQuery("#v_new_img").val();
			jQuery("#"+id).val(value).fire("change");
			jQuery("#target_id").val("");
			jQuery("#v_new_img").val("");
		}
	});
	
	jQuery("#save-product-form").on("click", ".gtk-file-upload-link", function(){
		const $link = jQuery(this).find(".upload-link-input");
		console.log($link[0]);
		openModal($link.attr("id"), $link.val());
	});
	
	jQuery("#gtk-file-upload-add").on("click", function(){
		openModal_new();
	});	
});
