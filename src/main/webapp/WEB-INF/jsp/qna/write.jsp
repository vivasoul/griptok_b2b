<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../lib/js/jquery.min.js"></script>
<link rel="stylesheet" href="../lib/bootstrap/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<form id="qna-write-form">
	<div class="row">
		<table class="table thead-light table-hover">
			<tr>
				<th class="col-md-2">����</th>
				<td>
					<input type="text" name="title" class="form-control"/>
				</td>
			</tr>
			<tr>
				<th class="col-md-2">����</th>
				<td>
					<textarea rows="10" cols="10" name="content" class="form-control"></textarea>
				</td>
			</tr>
			<tr>
				<th class="col-md-2">��й�ȣ</th>
				<td>
					<input type="password" name="passwd" class="form-control"/>
				</td>
			</tr>
		</table>
	</div>
	<div class="row">
		<input type="button" id="btn_cancel" value="���">
		<input type="button" id="btn_insert" value="Ȯ��">
	</div>
	</form>
</div>
</body>
<script>
$(document).ready(function() {
	const $f = $('#qna-write-form'),f = $f[0];
	
	/****************************************
	* EVENT TRIGGER START
	*****************************************/
	$('#btn_cancel').on('click',function(){
		window.location.href = '../qna';
	});
	
	$('#btn_insert').on('click',function(){
		const sendData = $f.serializeArray();
		console.log('form validation check is not ready.');
		console.log(sendData);
		alert('���������� ����Ͽ����ϴ�');
		window.location.href = '../qna';
	});
	/****************************************
	* EVENT TRIGGER END
	*****************************************/
	
});
</script>
</html>