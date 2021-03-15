const addBanner = function(data){
	data = data || {};
	const banner_txt = data["banner_txt"] || "";
	const banner_link = data["banner_link"] || "";
	const img_link = data["banner_img"] || "";
	const no = data["banner_no"] || -1;
	const MAX_CNT = (jQuery("#gtk-banners-added .gtk-banner-content").length || 0) + 1;
	
	const box = document.createElement("div");
	box.className = "gtk-banner-box";
		const row = document.createElement("div");
		row.className = "gtk-banner-content";
		row.id="v_banner_"+MAX_CNT;
			const input1 = document.createElement("input");
			input1.type="hidden"
			input1.className="gtk-banner-no";
			input1.name="nos";
			input1.value = no;
			const input3 = document.createElement("input");
			input3.type="hidden";
			input3.className="gtk-banner-txt";
			input3.name="txts";
			input3.value = banner_txt;
			const input4 = document.createElement("input");
			input4.type="hidden";
			input4.className="gtk-banner-link";
			input4.name="links";
			input4.value = banner_link;
			const input5 = document.createElement("input");
			input5.type="hidden"
			input5.className="gtk-banner-img";
			input5.name="imgs";
			input5.value = img_link;	

		
		row.appendChild(input1);
		row.appendChild(input3);
		row.appendChild(input4);
		row.appendChild(input5);
			
		const sorts = document.createElement("div");
		sorts.className = "gtk-banner-sorts";
			const sort_up = document.createElement("button");
			sort_up.type="button";
			sort_up.className  ="gtk-banner-sort-up";
				const i_up = document.createElement("i");
				i_up.className = "fa fa-caret-up";
			sort_up.appendChild(i_up);
			const sort_down = document.createElement("button");
			sort_down.type="button";
			sort_down.className  ="gtk-banner-sort-down";
				const i_down = document.createElement("i");
				i_down.className = "fa fa-caret-down";
			sort_down.appendChild(i_down);				
		sorts	.appendChild(sort_up);
		sorts	.appendChild(sort_down);
			
	box.appendChild(row);
	box.appendChild(sorts);
		
	jQuery("#gtk-banners-added").append(box);
	createUpload.call(row);
	jQuery(input5).on("change", onUploadLinkChange);
	if(img_link) jQuery(input5).prop("defaultSrc",img_link).fire("change");
	
	return row.id;
};

const initModal = function(){
	jQuery("#target_id").val("");
	jQuery("#v_new_txt").val("");
	jQuery("#v_new_link").val("");
	jQuery("#v_new_img").val("");	
};

const openModal = function(src_id, data){
	jQuery("#target_id").val(src_id);
	jQuery("#v_new_txt").val(data["txt"]);
	jQuery("#v_new_link").val(data["link"]);
	jQuery("#v_new_img").val(data["img"]);
	jQuery("#img-update-modal").gMOpen();
};

const openModal_new = function(){
	initModal();
	jQuery("#img-update-modal").gMOpen({
		"beforeOK": function(){
			const src_id = addBanner();
			jQuery("#target_id").val(src_id);
		}
	});
};

const getData2Update = function(){
	const $banners = jQuery("#gtk-banners-added .gtk-banner-content");
	const datas = [];
	
	$banners.each(function(idx,el) {
		const $el = jQuery(el);
		const data = {
			"banner_no": $el.find(".gtk-banner-no").val(), 
			"banner_txt": $el.find(".gtk-banner-txt").val(),
			"banner_img": $el.find(".gtk-banner-img").val(),
			"banner_link": $el.find(".gtk-banner-link").val(),
			"sort_no": idx+1,
		};
		datas.push(data);
	});
	
	return datas;
}; 

const loadBanners = function(){
	jQuery.ajax({
	  url: "/banners",
	  method: "GET",
	  dataType: "json"
	}).done(function(data){
		const len = data && data.length;
		if(len) {
			for(let i=0; i<len; i++){
				addBanner(data[i]);
			}
		}
	}).fail(function(e){
		console.log(e);
	}).always(function(){
		
	});
};

const saveBanners = function(){
 	const form = jQuery('#save-banner-form')[0];
 	if(!form.reportValidity()) return false;
	 // disabled the submit button
    jQuery("#save-banner-btn").prop("disabled", true);
    const data = getData2Update();
    //console.log(data);
	jQuery.ajax({
	  url: "/banners",
	  method: "POST",
	  contentType: "application/json",
      data: JSON.stringify(data)
	}).done(function(data){
		alert("성공적으로 저장되었습니다.");
		//location.href="/admin/m_banner";
		jQuery("#save-banner-btn").prop("disabled", false);
	}).fail(function(e){
		console.log(e);
	}).always(function(){
		
	});    
};

jQuery(document).ready(function(e){
	jQuery("#img-update-modal").gModal({
		"onOK": function(){
			const id = jQuery("#target_id").val();
			const value1 = jQuery("#v_new_txt").val();
			const value2 = jQuery("#v_new_link").val();
			const value3 = jQuery("#v_new_img").val();
			jQuery("#"+id+" .gtk-banner-txt").val(value1);
			jQuery("#"+id+" .gtk-banner-link").val(value2);
			jQuery("#"+id+" .gtk-banner-img").val(value3).fire("change");
			initModal();	
		}
	});

	jQuery("#gtk-banner-upload-add").on("click", function(){
		openModal_new();
	});		
	
	jQuery("#gtk-banners-added").on("click", ".gtk-banner-content", function(){
		const $this = jQuery(this);
		const data = {
				"txt": $this.find(".gtk-banner-txt").val(),
				"link": $this.find(".gtk-banner-link").val(),
				"img": $this.find(".gtk-banner-img").val()
		};
		openModal($this.attr("id"), data);
	});	
	
	jQuery("#gtk-banners-added").on("click", ".gtk-banner-sort-up", function(){
		const $this = jQuery(this).parent().parent();
		if($this.prev()) 	$this.prev().before($this);
	});	
	jQuery("#gtk-banners-added").on("click", ".gtk-banner-sort-down", function(){
		const $this = jQuery(this).parent().parent();
		if($this.next()) 	$this.next().after($this);	
	});
	jQuery("#save-banner-btn").on("click", saveBanners);	
	
	loadBanners();
});