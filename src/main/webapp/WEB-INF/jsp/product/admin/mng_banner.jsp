<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/js/common/modal.js"></script>
<script type="text/javascript" src="/js/common/uploader.js"></script>
<link rel="stylesheet" href="/css/admin/banner.css" />
<script type="text/javascript" src="/js/admin/product/banner.js"></script>
<div class="container-fluid">
	<div class="gtk-main-box">
		<form id="save-banner-form">
		<div id="gtk-banners-added"></div>
		</form>
		<div class="gtk-banner-box">
			<div id="gtk-banner-upload-add" class="gtk-banner-content">
				<p>
					<i class="fa fa-plus"></i> 배너 이미지 등록
				</p>
			</div>	
		</div>
	</div>
	<div class="gtk-form-btn-group">
		<button id="save-banner-btn" class="gtk-btn gtk-btn-blue" type="submit">저장</button>
	</div>	
</div>
<div class="gtk-modal"  id="img-update-modal">
	<div class="gtk-modal-main">
		<div class="gtk-modal-header">배너 이미지 등록</div>
		<div class="gtk-modal-body">
			<div class="gtk-input-group no-addon">
				<label for="v_new_img">배너 이름</label>
				<input type="text" id="v_new_txt" value=""/>
			</div>		
			<div class="gtk-input-group no-addon">
				<label for="v_new_img">이미지 링크</label>
				<input type="text" id="v_new_img" value=""/>
			</div>
			<div class="gtk-input-group no-addon">
				<label for="v_new_img">클릭 링크</label>
				<input type="text" id="v_new_link" value=""/>
			</div>
			<input type="hidden" id="target_id" value=""/>
		</div>
		<div class="gtk-modal-footer">
			<button type="button" class="gtk-btn gtk-btn-sm gtk-btn-blue modal-ok">등록</button>
			<button type="button" class="gtk-btn gtk-btn-sm modal-close" data-id="img-update-modal">취소</button>
		</div>
	</div>
</div>