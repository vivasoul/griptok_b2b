<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="../common/js/common.js"></script>
<script src="../lib/js/jquery.min.js"></script>
<link rel="stylesheet" href="../lib/bootstrap/css/bootstrap.min.css">

<script src="../lib/datatable/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="../lib/datatable/jquery.dataTables.min.css">
</head>
<body>
	<div class="container">
		<div class="row margin-bottom-lg">
			<div style="background-color: LightGray">
				<font style="font-weight: bold">주문 배송 조회/ 주문 상세 내역</font>
			</div>
		</div>
		<div class="row">
			<table class="table table-bordered">
				<tr>
					<td class="col-md-4">
						<div class="col-md-3"><font style="font-weight: bold">주문일자</font></div>
						<div class="col-md-9">${one.reg_dt } </div>
					</td>
					<td class="col-md-6">
						<div class="col-md-3"><font style="font-weight: bold">주문 번호</font></div>
						<div class="col-md-9">${one.order_no } </div>
					</td>
					<td class="col-md-2">
						<div class="row col-md-12 text-center">
							<input type="button" value="거래명세서 발급" id="btn-transaction" class="btn btn-secondary-outline pull-center"/>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
<script>
$(document).ready(function() {
	
});
</script>
</body>
</html>