<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
	boolean dc_only = request.getAttribute("dc_only") == null ?  false : (Boolean)request.getAttribute("dc_only");
%>
<link rel="stylesheet" href="/css/product/edit.css" />
<script type="text/javascript" src="/js/admin/product/detail.js"></script>
<script type="text/javascript" src="/js/common/uploader.js"></script>
<script type="text/javascript">
jQuery(document).ready(function(e){
	loadCraftNo();
	loadPBrandNo();
	jQuery("#v_p_brand_no").on("change", loadBrandNo);
	
	jQuery("#save-product-btn").on("click", function(e){
		e.preventDefault();
		insertData();
	});
});
</script>
<div class="container-fluid" id="gtk-detail-main">
	<form id="save-product-form">
	<div class="gtk-main-box">
		<div style="display:inline-block;width:50%;vertical-align:top;">
			<div class="gtk-group-title"><span class="title-icon">●</span> 상품 이미지</div>
			<div class="gtk-input-group">
				<label for="v_thumb_file">썸네일 이미지</label>
				<div class="gtk-file-upload">
					<input type="file" id="v_thumb_file" name="thumb_file" accept="image/*" required/>
				</div>
			</div>
			<div class="gtk-detail-imgs-group">
				<div class="gtk-input-group">
					<label for="v_file_1">이미지1</label>
					<div class="gtk-file-upload">
						<input type="file" id="v_file_1" name="files" accept="image/*" required/>
					</div>
				</div>
				<div class="gtk-input-group">
					<label for="v_file_2">이미지2</label>
					<div class="gtk-file-upload">
						<input type="file" id="v_file_2" name="files" accept="image/*" required/>
					</div>
				</div>
				<div class="gtk-input-group">
					<label for="v_file_3">이미지3</label>
					<div class="gtk-file-upload">
						<input type="file" id="v_file_3" name="files" accept="image/*" required/>
					</div>
				</div>
				<div class="gtk-input-group">
					<label for="v_file_4">이미지4</label>
					<div class="gtk-file-upload">
						<input type="file" id="v_file_4" name="files" accept="image/*" required/>
					</div>
				</div>												
			</div>
		</div><!-- 
	 --><div style="display:inline-block;width:50%;vertical-align:top;">
	 		<div class="gtk-group-title"><span class="title-icon">●</span> 상품 기본 정보</div>
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
	 		<%if(dc_only){%>
	 		<input type="hidden" id="v_is_dc" name="is_dc" value="Y" readOnly/>
	 		<%}%>
	 	</div> 
	 </div>
	 <div class="gtk-form-btn-group">
	 	<button id="save-product-btn" class="gtk-btn gtk-btn-blue" type="submit">등록</button>
	 </div>
	</form>		
</div>	