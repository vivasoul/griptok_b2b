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

.gtk-group-content { padding:10px; }

.gtk-table { width:100%; }
.gtk-table th, .gtk-table td { border: 1px solid #E0E0E0; border-collapse: collapse; padding: 13px; font-size: 12px; color: #7C7C7C; }
.gtk-table th { background-color: #FCFCFC; text-align: center; }
.gtk-table td.gtk-td-center { text-align:center; }
</style>
<script type="text/javascript" src="/js/admin/product/category.js"></script>
<script type="text/javascript">
jQuery(document).ready(function(e){
	loadCraft();
	loadBrand();
	loadCategory();
});
</script>
<div class="container-fluid">
	<div class="gtk-main-box">
		<div class="gtk-box-half">
			<div class="gtk-group-title"><span class="title-icon">●</span> 그립톡 종류 관리</div>
			<div class="gtk-group-content">
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
			</div>
		</div><!-- 
	 --><div class="gtk-box-half">
	 		<div class="gtk-group-title"><span class="title-icon">●</span> 브랜드 종류 관리</div>
			<div class="gtk-group-content">
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
			</div>	 		
	 	</div>
	</div>	
	<div class="gtk-main-box">
		<div class="gtk-group-title"><span class="title-icon">●</span> 카테고리 종류 관리</div>
		<div class="gtk-group-content">
			<table class="gtk-table" id="category-type-table">
				<colgroup>
					<col width="10%"/><col width="20%"/><col width="15%"/><col width="20%"/><col width="25%"/><col width="10%"/>
				</colgroup>			
				<thead>
					<tr>
						<th>번호</th>
						<th>그립톡명</th>
						<th>상위브랜드명</th>
						<th>브랜드명</th>
						<th>카테고리명</th>
						<th>사용</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>	
	</div>
</div>