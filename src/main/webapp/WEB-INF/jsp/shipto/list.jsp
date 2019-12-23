<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="./common/js/common.js"></script>
<script src="./lib/js/jquery.min.js"></script>
<link rel="stylesheet" href="./lib/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" href="./css/user/shipto.css">
<link rel="stylesheet" href="./lib/datatable/jquery.dataTables.min.css">
<script src="./lib/datatable/jquery.dataTables.min.js"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	var user_no = "<%= session.getAttribute( "user_no" ) %>";
</script>
</head>
<body>

	<div class="container">
		<h3 class="grey_back_title">배송지 관리</h3>
		<br>	
		<div class="row">
			<table id="example" class="table table-striped table-bordered hover">
				<thead>
					<tr>
						<th data-column = "shipto_no">선택</th>
						<th data-column = "shipto_nm">배송지 이름</th>
						<th data-column = "addr">배송지 주소</th>
						<th data-column = "receiver_nm">받는 사람</th>
						<th data-column = "receiver_tel">휴대폰번호</th>
						<th data-column = "user_no">비고</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
<script src="./js/user/shipto.js"></script>
</body>
</html>