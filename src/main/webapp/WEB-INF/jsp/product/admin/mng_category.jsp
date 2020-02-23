<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<style type="text/css">
.gtk-main-box { margin:20px 60px;padding:25px;border:1px solid #EAEAEA; }
.gtk-main-box>.gtk-box-half { display:inline-block;width:50%;vertical-align:top; }
.gtk-group-title { padding:10px 5px;font-size:20px;font-weight:600;color:#5E5E5E; }
.gtk-group-title .title-icon { font-size:15px;color:#CFCFCF; }
.gtk-input-group { font-size:15px;font-weight:400;color:#5E5E5E;padding:0px 30px;margin-bottom:12px; }
.gtk-input-group label { display:block;margin-bottom:5px;font-weight:400; }
.gtk-input-group input[type=text],
.gtk-input-group input[type=number] { display:block;width:100%;height:30px;border:1px solid #EAEAEA;padding:3px; }
.gtk-input-group select { height:30px;border:1px solid #EAEAEA;padding:3px; }

.gtk-group-content { padding:0px 10px; }

.gtk-table { width:100%;border-collapse: collapse; }
.gtk-table th, .gtk-table td { border:1px solid #E0E0E0; padding:14px;font-size:12px;line-height:12px;color:#7C7C7C;vertical-align:middle; }
.gtk-table th { background-color:#FCFCFC;text-align:center; }
.gtk-table td.gtk-td-center { text-align:center; }
.gtk-table td input { margin:0px; }

.gtk-pager { text-align:center;margin:5px; }
.gtk-pager a { text-decoration:none;color:#7c7c7c }
.gtk-pager a:hover { text-decoration:none;color:#000;cursor:pointer; }
.gtk-pager .gtk-pager-button { display:inline-block;width:25px;height:25px;padding:1px;
							   text-align: center;vertical-align: middle;margin: 5px;
							   color: #7C7C7C; border:1px solid #E0E0E0; background-color: #FFF; }
.gtk-pager .gtk-pager-button.active { color: #FFF; border:1px solid #00A1E3; background-color: #19B4F0; } 
.gtk-pager .gtk-pager-prev, 
.gtk-pager .gtk-pager-next {  }

.gtk-category-form { margin:10px; }
.gtk-category-form input,
.gtk-category-form select { margin-right:5px; }
.gtk-category-form input,
.gtk-category-form select, 
.gtk-category-form button{ height:20px;vertical-align:middle; }
.gtk-category-form button.gtk-btn { width:50px;font-size:12px;font-weight:400; }  
</style>
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