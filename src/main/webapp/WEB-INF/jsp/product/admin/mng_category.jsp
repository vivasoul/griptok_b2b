<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/product/edit.css" />
<script type="text/javascript" src="/js/admin/product/category.js"></script>
<script type="text/javascript">
jQuery(document).ready(function(e){
	loadBrand();
	loadCraft();
	loadCategory();
	
	loadCraftNo();
	loadPBrandNo();
	jQuery("#v_p_brand_no").on("change", loadBrandNo);
	
	loadPBrandNo2();
	
	jQuery("#save-brand-btn").on("click",function(){
		const brand_nm = jQuery("#v_brand_nm").val();
		const p_brand_no = Number(jQuery("#v_p_brand_no_2").val()) || 0;
		if(!brand_nm) {
			alert("브랜드명을 입력하세요.");
		}else if(!p_brand_no){
			alert("상위브랜드 종류를 선택하세요.");
		}else{
			insertBrand(p_brand_no, brand_nm);	
		}
	});
	jQuery("#save-craft-btn").on("click",function(){
		const craft_nm = jQuery("#v_craft_nm").val();
		if(!craft_nm) {
			alert("그립톡명을 입력하세요.");
		}else{
			insertCraft(craft_nm);
		}		
		
	});
	jQuery("#save-category-btn").on("click",function(){
		const category_nm = jQuery("#v_category_nm").val();
		const craft_no = Number(jQuery("#v_craft_no").val()) || 0;
		const brand_no = Number(jQuery("#v_brand_no").val()) || 0;
		if(!category_nm) {
			alert("카테고리명을 입력하세요.");
		}else if(!craft_no){
			alert("그립톡 종류를 선택하세요.");
		}else if(!brand_no){
			alert("브랜드 종류를 선택하세요.");
		}else{
			insertCategory(craft_no, brand_no, category_nm);
		}
	});
	
	jQuery("#brand-type-table").on("click", ".gtk-code-useyn", function(e){
		const data_id = e.target["data-id"];
		const use_yn = e.target.checked ? "Y" : "N";
		
		updateBrand(data_id, use_yn);
	});
	
	jQuery("#craft-type-table").on("click", ".gtk-code-useyn", function(e){
		const data_id = e.target["data-id"];
		const use_yn = e.target.checked ? "Y" : "N";
		
		updateCraft(data_id, use_yn);
	});
	
	jQuery("#category-type-table").on("click", ".gtk-code-useyn", function(e){
		const data_id = e.target["data-id"];
		const use_yn = e.target.checked ? "Y" : "N";
		
		updateCategory(data_id, use_yn);
	});	
});
</script>
<div class="container-fluid">
	<div class="gtk-main-box">
		<div class="gtk-box-half">
	 		<div class="gtk-group-title"><span class="title-icon">●</span> 브랜드 종류 관리</div>
			<div class="gtk-group-content">
				<div class="gtk-category-form">
					<select id="v_p_brand_no_2" name="p_brand_no"></select><!-- 
				 --><input type="text" id="v_brand_nm" name="brand_nm" placeholder="브랜드명"/><!-- 
				 --><button type="button" class="gtk-btn gtk-btn-blue" id="save-brand-btn">추가</button>
				</div>
				<table class="gtk-table" id="brand-type-table">
					<colgroup>
						<col width="15%"/><col width="30%"/><col width="40%"/><col width="15%"/>
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>상위브랜드명</th>
							<th>브랜드명</th>
							<th>사용</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div id="brand-type-pager"></div>
			</div>
		</div><!-- 
	 --><div class="gtk-box-half">
			<div class="gtk-group-title"><span class="title-icon">●</span> 그립톡 종류 관리</div>
			<div class="gtk-group-content">
				<div class="gtk-category-form">
					<input type="text" id="v_craft_nm" name="craft_nm" placeholder="그립톡명"/><!-- 
				 --><button type="button" class="gtk-btn gtk-btn-blue" id="save-craft-btn">추가</button>
				</div>
				<table class="gtk-table" id="craft-type-table">
					<colgroup>
						<col width="20%"/><col width="60%"/><col width="20%"/>
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>그립톡명</th>
							<th>사용</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="gtk-td-center">1</td>
							<td>테스트</td>
							<td class="gtk-td-center"><input type="checkbox" /></td>
						</tr>
					</tbody>
				</table>
				<div id="craft-type-pager"></div>
			</div>
	 	</div>
	</div>	
	<div class="gtk-main-box">
		<div class="gtk-group-title"><span class="title-icon">●</span> 카테고리 종류 관리</div>
		<div class="gtk-group-content">
			<div class="gtk-category-form">
				<select id="v_p_brand_no" name="p_brand_no"></select><!-- 
			 --><select id="v_brand_no" name="brand_no"></select><!-- 
			 --><select id="v_craft_no" name="craft_no"></select><!-- 
			 --><input type="text" id="v_category_nm" name="category_nm" placeholder="카테고리명"/><!-- 
			 --><button type="button" class="gtk-btn gtk-btn-blue" id="save-category-btn">추가</button>
			</div>
			<table class="gtk-table" id="category-type-table">
				<colgroup>
					<col width="10%"/><col width="20%"/><col width="15%"/><col width="20%"/><col width="25%"/><col width="10%"/>
				</colgroup>			
				<thead>
					<tr>
						<th>번호</th>
						<th>상위브랜드명</th>
						<th>브랜드명</th>
						<th>그립톡명</th>
						<th>카테고리명</th>
						<th>사용</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div id="category-type-pager"></div>
		</div>	
	</div>
</div>