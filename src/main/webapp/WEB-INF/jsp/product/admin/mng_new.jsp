<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/js/product/common.js"></script>
<script type="text/javascript" src="/js/product/detail.js"></script>
<link rel="stylesheet" href="/css/product/detail.css" />
<style type="text/css">
.gtk-main-box { margin:20px 60px;padding:25px;border:1px solid #EAEAEA; }
.gtk-group-title { padding:10px 5px;font-size:20px;font-weight:600;color:#5E5E5E; }
.gtk-group-title .title-icon { font-size:15px;color:#CFCFCF; }
.gtk-input-group { font-size:15px;font-weight:400;color:#5E5E5E;padding:0px 30px;margin-bottom:12px; }
.gtk-input-group label { display:block;margin-bottom:5px;font-weight:400; }
.gtk-input-group input[type=text],
.gtk-input-group input[type=number] { display:block;width:100%;height:30px;border:1px solid #EAEAEA;padding:3px; }
.gtk-input-group select { height:30px;border:1px solid #EAEAEA;padding:3px; }
#v_craft_no,#v_brand_no,#v_category_no { width:32%; }

.gtk-file-upload { width:255px; height:255px; position:relative; }
.gtk-file-upload img,
.gtk-file-upload input[type="file"],
.gtk-file-upload p { position:absolute;top:0px;left:0px;width:100%;height:100%;border:2px dashed #CFCFCF;
					 text-align:center;line-height:255px;color:#CFCFCF; }
.gtk-file-upload p { display:block; } 
.gtk-file-upload input[type="file"] { display:block;opacity:0;outline: none;z-index:3; }
.gtk-file-upload img { display:none; }					 
					 
</style>
<script type="text/javascript">
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

jQuery(document).ready(function(e){
	loadCraftNo();
	loadPBrandNo();
	jQuery(".gtk-file-upload input[type=file]").on("change", function(e){
		const f = e.target.files[0];
		$this = jQuery(this);
		if(f){
			const s = URL.createObjectURL(f);
			$this.find("+p").hide();
			$this.find("+p+img").prop("src", s).show();
		}else{
			$this.find("+p").show();
			$this.find("+p+img").prop("src", "").hide();
		}
	});
	jQuery("#v_p_brand_no").on("change", loadBrandNo);
});
</script>
<div class="container-fluid" id="gtk-detail-main">
	<form action="/products" method="POST" enctype="multipart/form-data">
	<div class="gtk-main-box">
		<div style="display:inline-block;width:50%;vertical-align:top;">
			<div class="gtk-group-title"><span class="title-icon">●</span> 상품 이미지</div>
			<div class="gtk-input-group">
				<label for="v_file_1">썸네일 이미지</label>
				<div class="gtk-file-upload">
					<input type="file" id="v_file_1" name="thumb_file" accept="image/*" />
  					<p>파일을 드래그하세요.</p>
  					<img src=""/>
				</div>
			</div>
		</div><!-- 
	 --><div style="display:inline-block;width:50%;vertical-align:top;">
	 		<div class="gtk-group-title"><span class="title-icon">●</span> 상품 기본 정보</div>
	 		<div class="gtk-input-group">
	 			<label for="v_title">상품제목</label>
	 			<input type="text" id="v_title" name="title" value=""/>
	 		</div>
	 		<div class="gtk-input-group">
	 			<label for="v_retail_price">원가(원)</label>
	 			<input type="number" id="v_retail_price" name="retail_price" value=""/>
	 		</div>
	 		<div class="gtk-input-group">
	 			<label for="v_sales_price">판매가(원)</label>
	 			<input type="number" id="v_sales_price" name="sales_price" value=""/>
	 		</div>
	 		<div class="gtk-input-group">
	 			<label for="v_stocks">재고량</label>
	 			<input type="number" id="v_stocks" name="stocks" value=""/>
	 		</div>
	 		<div class="gtk-input-group">
	 			<label for="v_craft_no">카테고리</label>
	 			<select id="v_craft_no" name="craft_no">
	 				<option value="">::선택::</option>
	 			</select>
	 			<select id="v_p_brand_no" name="p_brand_no">
	 				<option value="">::선택::</option>
	 			</select>	 			
	 			<select id="v_brand_no" name="brand_no">
	 				<option value="">::선택::</option>
	 			</select>
	 		</div>
	 		 <div class="gtk-input-group">
	 			<label for="v_is_new">신상품 여부</label>
	 			<input type="checkbox" id="v_is_new" name="is_new" />
	 		 </div>
	 		 <div class="gtk-input-group">
	 			<label for="v_is_best">베스트상품 여부</label>
	 			<input type="checkbox" id="v_is_best" name="is_best" />
	 		</div>		 			
	 	</div> 
	 </div>
		<button type="submit">전송</button>
	</form>		
</div>	