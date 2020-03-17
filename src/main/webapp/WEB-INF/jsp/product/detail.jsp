<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/js/product/common.js"></script>
<script type="text/javascript" src="/js/product/detail.js"></script>
<link rel="stylesheet" href="/css/product/detail.css" />
<script type="text/javascript">
const getProductId = function(){
	return Number(jQuery("#gtk-detail-main .data-id").text());
};

const getCartedCnt = function(){
	return Number(jQuery("#gtk-detail-main .input-quantity").val());
};

jQuery(document).ready(function(){
	loadData("<%=request.getAttribute("product_id").toString()%>");
	jQuery(".gtk-detail-images-thumbs").on("click", "img", function(e){
		jQuery(".gtk-detail-images-big>img").prop("src", e.target.src);
	});
	
	jQuery("input.input-quantity").on("change", function(e){
		let cnt = e.target.value;
		if(cnt < 1) cnt = 1;
		this.value = cnt;
		updateCount(cnt);
	});
	
	jQuery(".gtk-detail-quantity .quantity-down-btn").on("click", function(e){
		let q = Number(jQuery("input.input-quantity").val()) || 0;
		q--;
		q = q < 1 ? 1 : q;
		jQuery("input.input-quantity").val(q);
		updateCount(q);
	});
	
	jQuery(".gtk-detail-quantity .quantity-up-btn").on("click", function(e){
		let q = Number(jQuery("input.input-quantity").val()) || 0;
		q++;
		q = q < 1 ? 1 : q;
		jQuery("input.input-quantity").val(q);		
		updateCount(q);
	});
	
	jQuery("#goto-cart-btn").on("click", function(){
		const product_id = getProductId();
		const carted_cnt = getCartedCnt();
		
		moveToCart(product_id, carted_cnt);
	});
	
	jQuery("#goto-buy-btn").on("click", function(){
		const product_id = getProductId();
	});
	
	jQuery("#goto-interset-btn").on("click", function(){
		const product_id = getProductId();
		moveToInterested(product_id);
	});	
});
</script>
<div id="gtk-detail-main" class="container-fluid">
	<div class="row gtk-detail">
		<div class="col-sm-6 gtk-detail-images">
			<div class="gtk-detail-images-big"></div>
			<div class="gtk-detail-images-thumbs"></div>
		</div>
		<div class="col-sm-6">
			<div class="gtk-detail-id">상품 번호:<span class="data-id"></span></div>
			<div class="gtk-detail-title data-title"></div>
			<div class="gtk-detail-price"><span class="data-retail-price"></span><span class="data-sales-price"></span></div>
			<div class="gtk-detail-quantity">수량<button class="quantity-down-btn">-</button><input class="input-quantity" type="text" value="1"/><button class="quantity-up-btn">+</button></div>
			<div class="gtk-detail-summary">
				<span class="detail-summary-1">총 수량 <span class="data-total-count"></span>개</span> / 
				<span class="detail-summary-2">총 상품 금액</span>
				<span class="detail-summary-3 data-total-amount"></span></div>
			<div class="gtk-detail-btn-group"><!-- 
				 --><button type="button" class="gtk-btn" id="goto-cart-btn"><img src="/img/product/cart_btn_icon.png"/> 장바구니</button><!-- 
				 --><button type="button" class="gtk-btn gtk-btn-blue" id="goto-buy-btn">바로구매</button><!--
				 --><button type="button" class="gtk-btn" id="goto-interset-btn"><img src="/img/product/love_btn_icon.png"/> 관심상품</button>
			</div>
			<input id="sales-price" type="hidden" value="0" />
		</div>
	</div>
	<div class="row gtk-detail" style="margin-top:20px"><div class="col-sm-12"><div class="gtk-description-header">상품 상세 설명</div></div></div>
	<div class="row gtk-detail">
		<div class="col-sm-12 gtk-description-body">
			<div class="gtk-detail-genuine"><img src="http://www.griptok.com/shop/common/common_top.png"/></div>
			<div class="gtk-detail-images"></div>
			<div class="gtk-detail-manual">
				<img src="http://www.griptok.com/shop/common/common_btm1.png"/><br/><!-- 
			 --><img src="http://www.griptok.com/shop/common/common_btm2.png"/>
			</div>
			<div class="gtk-detail-guide">
				<div class="guide-left">
					<div class="guide-box">
						<div class="guide-head">상품 결제 정보</div>
						<div class="guide-body">
							상품 구매 금액은 무통장 입금을 기본으로 하며 변동시 담당자의 별도 안내가 있을 예정입니다.<br/>
							무통장 입금(상품 구매 대금)은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹, 혹은 가까운 은행에서 직접<br/>
							입금하시면 됩니다.<br/>
							<br/>
							주문시 입력한 입금자명과 실제 입금자의 성명이 반드시 일치하여야 하고 7일 이내로 입금을 <br/>
							하셔야 하며  입금되지 않은 주문은 자동으로 취소 처리됩니다.<br/> 
							<br/>
						</div>
					</div>
					<div class="guide-box">
						<div class="guide-head">교환 및 반품 정보</div>
						<div class="guide-body">
							교환 및 반품이 가능한 경우<br/>
							- 상품을 공급 받으신 날로부터 7일 이내, 단 포장을 개봉하였거나 포장이 회손되어 상품가치가<br/>
							&nbsp;&nbsp;상실되었을 경우에는 교환/반품이 불가능 합니다.<br/>
							- 공급받으신 상품 및 용역의 내용이 표시 광고 내용과 다르거나 다르게 이행된 경우에는 공급받은<br/>
							&nbsp;&nbsp;날로부터 3개월 이내, 인지하게된 날로부터 30일 이내 교환/반품이 가능합니다.<br/>
							<br/>
							교환 및 반품이 불가능한 경우<br/>
							- 고객님의 책임 있는 사유로 상품등이 멸실 또는 회손된 경우
						</div>
					</div>					
				</div><!-- 
			 --><div class="guide-right">
					<div class="guide-box">
						<div class="guide-head">배송 정보</div>
						<div class="guide-body">
							배송방법: 택배<br/>
							배송지역: 전국 전지역<br/>
							배송비용: 2,500원<br/>
							배송기간: 3일 ~ 7일<br/>
							배송안내: 산간벽지나 도서 지방은 별도의 추가금액을 지불 하셔야 할 수도 있습니다.<br/>
							고객님께서 주문하신 상품은 입금 확인 후 배송해 드립니다.<br/>
							상품재고에 따라서 상품의 배송이 다소 지연될 수 있습니다.<br/>
						</div>
					</div>
					<div class="guide-box">
						<div class="guide-head">서비스 문의</div>
						<div class="guide-body">
							<span style="font-weight:900">고객센터</span><br/>
							주 소: 서울시 마포구 월드컵 북로 7길 34 인턱스빌 2층<br/>
							이메일: nemong@iburster.com<br/>
							<span style="font-size:23px;font-weight:700;line-height:35px;">1644-1633</span>
						</div>
					</div>										
				</div>
			</div>
		</div>
	</div>
</div>	