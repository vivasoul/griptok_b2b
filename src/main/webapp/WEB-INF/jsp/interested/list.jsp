<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="./common/js/common.js"></script>
<script src="./lib/js/jquery.min.js"></script>
<link rel="stylesheet" href="./lib/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" href="./css/service/interested.css">
<link rel="stylesheet" href="./lib/datatable/jquery.dataTables.min.css">
<script src="./lib/datatable/jquery.dataTables.min.js"></script>
<script>
	var user_no = "<%= session.getAttribute( "user_no" ) %>";
</script>
</head>
<body>

	<div class="container">
		<h3 class="grey_back_title">관심상품 관리</h3>
		<br>	
		<div class="row">
			<button onclick="addToCart()" class="btn-primary btn-sm text-sm" type="button">장바구니 담기</button>
			<button onclick="deleteInterested()" class="btn-primary btn-sm text-sm" type="button">삭제</button>
		</div>
		<div class="row">
			<table id="interested-tbl" class="table table-striped table-bordered hover">
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