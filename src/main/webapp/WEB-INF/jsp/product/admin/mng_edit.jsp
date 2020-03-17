<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
	boolean dc_only = request.getAttribute("dc_only") == null ?  false : (Boolean)request.getAttribute("dc_only");
%>
<link rel="stylesheet" href="/css/product/edit.css" />
<script type="text/javascript" src="/js/admin/product/detail.js"></script>
<script type="text/javascript" src="/js/common/uploader.js"></script>
<script type="text/javascript">
jQuery(document).ready(function(e){
	jQuery("#v_p_brand_no").on("change", loadBrandNo);
	
	loadData(jQuery("#v_product_id").val());
	
	jQuery("#save-product-btn").on("click", function(e){
		e.preventDefault();
		/* disable input-fields related with file-upload to avoid buggy situation */
		jQuery(".gtk-file-upload input[type=file]").each(function(idx,elem){
			const $this = jQuery(elem);
			const key_input_id = $this.attr("key-input");
			
			if(!key_input_id) return;
			
			const $hidden = jQuery("#"+key_input_id);
			console.log($this.val());
			if($this.val()){
				if($hidden.val() === "") $hidden.val("-1");
			}else{
				$this.prop("disabled", true);
				$hidden.prop("disabled", true);
			}
		});
		updateData(jQuery("#v_product_id").val());
	});
});
</script>
<div class="container-fluid" id="gtk-detail-main">
	<form id="save-product-form">
	<div class="gtk-main-box">
		<div class="gtk-box-half">
			<div class="gtk-group-title"><span class="title-icon">●</span> 상품 이미지</div>
			<div class="gtk-input-group">
				<label for="v_thumb_file">썸네일 이미지</label>
				<div class="gtk-file-upload">
					<input type="hidden" id="v_thumb_img_no" name="thumb_img_no" value="" />
					<input type="file" id="v_thumb_file" name="thumb_file" accept="image/*" key-input="v_thumb_img_no"/>
				</div>
			</div>
			<div class="gtk-detail-imgs-group">
				<div class="gtk-input-group">
					<label for="v_file_1">이미지1</label>
					<div class="gtk-file-upload">
						<input type="hidden" id="v_img_no_1" name="img_nos" value="" />
						<input type="file" id="v_file_1" name="files" accept="image/*" key-input="v_img_no_1" />
					</div>
				</div>
				<div class="gtk-input-group">
					<label for="v_file_2">이미지2</label>
					<div class="gtk-file-upload">
						<input type="hidden" id="v_img_no_2" name="img_nos" value="" />
						<input type="file" id="v_file_2" name="files" accept="image/*" key-input="v_img_no_2"/>
					</div>
				</div>
				<div class="gtk-input-group">
					<label for="v_file_3">이미지3</label>
					<div class="gtk-file-upload">
						<input type="hidden" id="v_img_no_3" name="img_nos" value="" />
						<input type="file" id="v_file_3" name="files" accept="image/*" key-input="v_img_no_3"/>
					</div>
				</div>
				<div class="gtk-input-group">
					<label for="v_file_4">이미지4</label>
					<div class="gtk-file-upload">
						<input type="hidden" id="v_img_no_4" name="img_nos" value="" />
						<input type="file" id="v_file_4" name="files" accept="image/*" key-input="v_img_no_4"/>
					</div>
				</div>												
			</div>
		</div><!-- 
	 --><div class="gtk-box-half">
	 		<div class="gtk-group-title"><span class="title-icon">●</span> 상품 기본 정보</div>
	 		<div class="gtk-input-group">
	 			<label for="v_product_id">상품번호</label>
	 			<input type="text" id="v_product_id" name="product_id" value="<%=request.getAttribute("product_id")%>" readOnly required/>
	 		</div>	 		
	 		<div class="gtk-input-group">
	 			<label for="v_title">상품제목</label>
	 			<input type="text" id="v_title" name="title" value="" required/>
	 		</div>
	 		<div class="gtk-input-group">
	 			<label for="v_retail_price">원가(원)</label>
	 			<input type="number" id="v_retail_price" name="retail_price" value="" required/>
	 		</div>
	 		<div class="gtk-input-group">
	 			<label for="v_sales_price">판매가(원)</label>
	 			<input type="number" id="v_sales_price" name="sales_price" value="" required/>
	 		</div>
	 		<div class="gtk-input-group">
	 			<label for="v_stock_cnt">재고량</label>
	 			<input type="number" id="v_stock_cnt" name="stock_cnt" value="" required/>
	 		</div>
	 		<div class="gtk-input-group">
	 			<label for="v_craft_no">카테고리</label>
	 			<select id="v_craft_no" name="craft_no" required>
	 				<option value="">::선택::</option>
	 			</select>
	 			<select id="v_p_brand_no" name="p_brand_no">
	 				<option value="">::선택::</option>
	 			</select>	 			
	 			<select id="v_brand_no" name="brand_no" required>
	 				<option value="">::선택::</option>
	 			</select>
	 		</div>
	 		 <div class="gtk-input-group">
	 			<label for="v_is_new">신상품 여부</label>
	 			<input type="checkbox" id="v_is_new" name="is_new" value="Y"/>
	 		 </div>
	 		 <div class="gtk-input-group">
	 			<label for="v_is_best">베스트상품 여부</label>
	 			<input type="checkbox" id="v_is_best" name="is_best" value="Y"/>
	 		</div>
	 		<div class="gtk-input-group">
	 			<label for="v_description">정품인증 이미지 포함</label>
	 			<input type="checkbox" id="v_description" name="description" value="Y"/>
	 		</div>	 		
	 		<%if(dc_only){%>
	 		<input type="hidden" id="v_is_dc" name="is_dc" value="Y" readOnly/>
	 		<%}%>		 			
	 	</div> 
	 </div>
	 <div class="gtk-form-btn-group">
	 	<button id="save-product-btn" class="gtk-btn gtk-btn-blue" type="submit">수정</button>
	 </div>
	</form>		
</div>	