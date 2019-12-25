<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<th class="col-md-2">제목</th>
				<td>
					<input type="text" name="title" class="form-control"/>
				</td>
			</tr>
			<tr>
				<th class="col-md-2">내용</th>
				<td>
					<textarea rows="10" cols="10" name="content" class="form-control"></textarea>
				</td>
			</tr>
			<tr>
				<th class="col-md-2">비밀번호</th>
				<td>
					<input type="password" name="passwd" class="form-control"/>
				</td>
			</tr>
		</table>
	</div>
	<div class="row">
		<input type="button" id="btn_cancel" value="취소">
		<input type="button" id="btn_insert" value="확인">
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
		alert('성공적으로 등록하였습니다');
		window.location.href = '../qna';
	});
	/****************************************
	* EVENT TRIGGER END
	*****************************************/
	
});
</script>
</html>