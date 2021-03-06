<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
	boolean dc_only = request.getAttribute("dc_only") == null ?  false : (Boolean)request.getAttribute("dc_only");
%>
<link rel="stylesheet" href="/css/product/edit.css" />
<script type="text/javascript" src="/js/admin/product/detail.js"></script>
<script type="text/javascript" src="/js/common/uploader.js"></script>
<script type="text/javascript" src="/js/common/modal.js"></script>
<script type="text/javascript">

jQuery(document).ready(function(e){
	loadCraftNo();
	loadPBrandNo();
	
	jQuery("#save-product-btn").on("click", function(e){
		e.preventDefault();
		insertData();
	});
});
</script>
<div class="container-fluid" id="gtk-detail-main">
	<form id="save-product-form">
	<div class="gtk-main-box">
		<div class="gtk-box-half">
			<div class="gtk-group-title"><span class="title-icon">●</span> 상품 이미지</div>
			<div class="gtk-input-group">
				<label for="v_thumbnail">썸네일</label>
				<div class="gtk-file-upload gtk-file-upload-link">
					<input type="hidden" class="upload-link-input" id="v_thumb" name="thumb" />
				</div>
			</div>
			<div class="gtk-detail-imgs-group">
		 		<div class="gtk-input-group">
		 			<label for="v_img_top">상세이미지(최상단)</label>
					<div class="gtk-file-upload gtk-file-upload-link">
						<input type="hidden" class="upload-link-input" id="v_img_top" name="imgs" />
					</div> 
					<br/>	
					<label for="v_thumbnail">상세이미지(본문)</label>
					<div id="gtk-upload-links">
					</div><!-- 	
			   --><div id="gtk-file-upload-add">
						<p>
							<i class="fa fa-plus"></i>
						</p>
					</div>
		 		</div>	
		 		<br/>
		 		<div class="gtk-input-group">
		 			<label for="v_img_bot">상세이미지(최하단)</label>
					<div class="gtk-file-upload gtk-file-upload-link">
						<input type="hidden" class="upload-link-input" id="v_img_bot" name="imgs" />
					</div>
				</div>	
	 		</div>
		</div><!-- 
	 --><div class="gtk-box-half">
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
	 			<select id="v_category_no" name="category_no" required>
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
	 		<div class="gtk-input-group">
	 			<label>옵션</label>
	 			<div id="gtk-options-added">
	 			</div>
	 			<div id="gtk-options-addable">
	 				<div class="gtk-option-row"><!-- 
	 					 --><input type="text" class="gtk-option-txt" id="gtk-option-new"/><!-- 
	 					 --><button type="button" class="gtk-option-btn" id="gtk-option-new-btn"><i class="fa fa-plus"></i></button><!-- 
	 		   --></div>
	 			</div>
	 		</div>
	 	</div> 
	 </div>
	 <div class="gtk-form-btn-group">
	 	<button id="save-product-btn" class="gtk-btn gtk-btn-blue" type="submit">등록</button>
	 </div>
	</form>		
</div>	
<div class="gtk-modal"  id="img-update-modal">
	<div class="gtk-modal-main">
		<div class="gtk-modal-header">이미지 등록</div>
		<div class="gtk-modal-body">
			<div class="gtk-input-group no-addon">
				<input type="text" id="v_new_img" value=""/>
				<input type="hidden" id="target_id" value=""/>
			</div>
		</div>
		<div class="gtk-modal-footer">
			<button type="button" class="gtk-btn gtk-btn-sm gtk-btn-blue modal-ok">등록</button>
			<button type="button" class="gtk-btn gtk-btn-sm modal-close" data-id="img-update-modal">취소</button>
		</div>
	</div>
</div>