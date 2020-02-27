<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="./common/js/common.js"></script>
<script src="./lib/js/jquery.min.js"></script>
<link rel="stylesheet" href="./lib/bootstrap/css/bootstrap.min.css">
<script src="./common/js/util.js" charset="utf-8"></script>
<link rel="stylesheet" href="./css/service/interested.css">
<link rel="stylesheet" href="./css/margin.css">
<link rel="stylesheet" href="./lib/datatable/jquery.dataTables.min.css">
<script src="./lib/datatable/jquery.dataTables.min.js"></script>
<script>
	var user_no = "<%= session.getAttribute( "user_no" ) %>";
</script>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<button id="addall" onclick="addToCart()" class="gtk-btn gtk-btn-sm gtk-btn-blue text-sm" type="button">전체 상품 장바구니 담기</button>
			<button id="deleteall" onclick="deleteInterested()" class="gtk-btn gtk-btn-sm text-sm" type="button">전체 상품 삭제</button>
		</div>
		<div class="row">
			<table id="interested-tbl" class="table table-striped table-bordered hover">
				<colgroup>
					<col width = "11%"/>
					<col width = "57%"/>
					<col width = "13%"/>
					<col width = "19%"/>
				</colgroup>
				<thead>
					<tr>
						<th data-column = "sales_price">선택</th>
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
</body>
</html>