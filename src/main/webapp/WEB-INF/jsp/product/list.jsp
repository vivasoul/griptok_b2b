<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/product/list.css" />
<script type="text/javascript" src="/js/product/common.js"></script>
<script type="text/javascript" src="/js/product/list.js"></script>
<style type="text/css">
.main-shopping-list{ margin-top:0px; }
</style>
<script type="text/javascript">
jQuery(window).on("resize", resizeBannerBox);

jQuery(document).ready(function(){	
	loadList("/products/new","new-product-list");
	loadList("/products/best","best-product-list");
	loadList("/products/dc","special-product-list");

	
	jQuery("#main-banner-links").on("click", ".banner-link", function(){		
		jQuery(".banner-link."+ACTIVE_CLASS).removeClass(ACTIVE_CLASS);
		jQuery(".main-banner."+ACTIVE_CLASS).removeClass(ACTIVE_CLASS);
		
		const $this = jQuery(this);
		const banner_id = $this.attr("banner-id");
		
		$this.addClass(ACTIVE_CLASS);
		jQuery("#"+banner_id).addClass(ACTIVE_CLASS);
	});
	
	loadBanners();
});
</script>
<div class="container-fluid main-shopping-list">
	<div class="row">
		<div class="col-sm-12">
			<div class="main-banner-slide">
				<div  id="main-banners">
									
				</div>
				<div  id="main-banner-links">
					
				</div>
			</div>
		</div>
	</div>
	<div class="row"><div class="col-sm-12"><div class="event-header">신상품</div></div></div>
	<div class="row">
		<div class="col-sm-12 product-list full-content " id="new-product-list"></div>
	</div>
	<div class="row"><div class="col-sm-12"><div class="event-header">베스트 상품</div></div></div>
	<div class="row">
		<div class="col-sm-12 product-list full-content " id="best-product-list"></div>
	</div>
	<div class="row"><div class="col-sm-12"><div class="event-header">특가 상품</div></div></div>
	<div class="row">
		<div class="col-sm-12 product-list full-content " id="special-product-list"></div>
	</div>
</div>	
