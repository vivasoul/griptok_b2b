<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<script src="/common/js/util.js" charset="utf-8"></script>
<link rel="stylesheet" href="/css/service/interested.css">
<!-- <link rel="stylesheet" href="./lib/datatable/jquery.dataTables.min.css"> -->
<script src="./lib/datatable/jquery.dataTables.min.js"></script>
<script>
	var user_no = "<%= session.getAttribute( "user_no" ) %>";
</script>
<div class="container-fluid">
	<div class="row">
		<div class="m-b-lg">
			<div class="col-md-12">
				<p class="m-t-sm m-b-md margin_l_18 margin_t_15 margin_b_17 grey_font">
					전체 상품을 한번에 장바구니에 담거나 개별로 장바구니에 담을 수 있습니다.<br>
					선택을 누르시면 전체 상품이 선택됩니다.
				</p>
			</div>
		</div>
	</div>
	<div class="row" style="margin-bottom:15px;">
		<button id="addall" onclick="addToCart()" class="gtk-btn gtk-btn-sm gtk-btn-blue text-sm" type="button">전체 상품 장바구니 담기</button>
		<button id="deleteall" onclick="deleteInterested()" class="gtk-btn gtk-btn-sm text-sm" type="button">전체 상품 삭제</button>
	</div>
	<div class="row">
		<table id="interested-tbl" class="gtk-table">
			<colgroup>
				<col width = "11%"/>
				<col width = "57%"/>
				<col width = "13%"/>
				<col width = "19%"/>
			</colgroup>
			<thead>
				<tr>
					<th id="selectAll"  data-column = "sales_price">선택</th>
					<th data-column = "title">상품</th>
					<th data-column = "retail_price">가격</th>
					<th data-column = "product_id">관리</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</div>
<script src="./js/service/interested.js"></script>