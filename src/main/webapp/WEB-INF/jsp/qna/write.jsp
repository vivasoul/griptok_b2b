<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../lib/js/jquery.min.js"></script>
<script src="../common/js/common.js"></script>

<link rel="stylesheet" href="../lib/bootstrap/css/bootstrap.min.css">

<script src="../lib/bootstrap/js/bootstrap.min.js"></script>
<script src="../lib/bootbox/bootbox.min.js"></script>
</head>
<body>
<div class="container-fluid">
	<form id="qna-write-form">
	<div class="row">
		<table class="table thead-light table-hover">
			<tr>
				<th class="col-md-2">제목</th>
				<td>
					<input type="text" name="title" class="form-control" required data-label="제목"/>
				</td>
			</tr>
			<tr>
				<th class="col-md-2">내용</th>
				<td>
					<textarea rows="10" cols="10" name="content" class="form-control" required data-label="내용"></textarea>
				</td>
			</tr>
			<tr>
				<th class="col-md-2">비밀번호</th>
				<td>
					<input type="password" name="passwd" class="form-control" required  data-label="비밀번호"/>
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
		const checkValid = griptok.form.validateSimple(f);
		
		if(checkValid.isValid){
			$.ajax({
				url : '/qnas',
				type : 'POST',
				contentType: 'application/json',
				data : griptok.form.toJSON($f),
				success : function(data){
					griptok.component.bootbox.alert({
						message : '성공적으로 등록하였습니다',
						callback : function(){
							window.location.href = '../qna';
						}
					});
				}
			});
		}else{
			griptok.component.bootbox.growl(checkValid.message);
		}
	});
	/****************************************
	* EVENT TRIGGER END
	*****************************************/
	
});
</script>
</html>