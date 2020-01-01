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
<link rel="stylesheet" href="../css/margin.css">

<script src="../lib/bootstrap/js/bootstrap.min.js"></script>
<script src="../lib/bootbox/bootbox.min.js"></script>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<table id="example" class="table table-striped table-bordered hover">
			<thead>
				<tr>
					<th data-column = "qna_no">번호</th>
					<th data-column = "title">문의내용</th>
					<th data-column = "req_dt">문의일자</th>
					<th data-column = "proc_yn">처리여부</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${detailObject.qna_no}</td>
					<td>${detailObject.title}</td>
					<td>${detailObject.req_dt}</td>
					<td>${detailObject.proc_yn}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<form id="qna-detail-form">
	<div class="row">
			<input type="hidden" name="qna_no" value="${detailObject.qna_no }"/>
			<input type="hidden" name="proc_yn" value="${detailObject.proc_yn }"/>
			<input type="hidden" id="initContent" value="${detailObject.content }"/>
			
			<table class="table table-bordered">
				<tr>
					<td colspan="2">
						<textarea rows="10" cols="10" class="form-control" name="content">${detailObject.content }</textarea>
					</td>
				</tr>
				<tr class="js-display-answer">
					<th class="col-md-2">답변</th>
					<td>
						<textarea rows="10" cols="10" class="form-control" name="answer" readonly >${answerObject.answer }</textarea>
					</td>
				</tr>
			</table>
		
	</div>
	<div class="row text-center m-b-md">
		<input type="button" id="btn_list" class="gtk-btn gtk-btn-blue" value="목록">
		<input type="button" id="btn_write" class="gtk-btn gtk-btn-blue" value="글쓰기">
		<input type="button" id="btn_edit" class="gtk-btn gtk-btn-blue" value="수정">
	</div>
	</form>
</div>
<script>
$(document).ready(function() {
	// DataTable initialisation
	const $f = $('#qna-detail-form'), f = $f[0];
	const $content = $(f.content);
	
	const onInit = function(){
		const toDoList = {
			'createInitialTable' : function(){
				griptok.component.datatable('example').create(null,{
					"paging": false
				});
			},
			'controlAnswerDisplay' : function(){
				const $trAnswer = $('.js-display-answer',f);
				const answerValue = f.answer.value;
				
				if(answerValue.length === 0 | answerValue === null){
					$trAnswer.hide();
				}else{
					$trAnswer.show();
				}
			}
		}
		
		Object.keys(toDoList).forEach(function(actionName){toDoList[actionName]()})
	}
	
	onInit();
	/****************************************
	* EVENT TRIGGER START
	*****************************************/
	$('#btn_list').on('click',f,function(){
		window.location.href = '../qna';
	})
	
	$('#btn_write').on('click',f,function(){
		window.location.href = '../qna/edit';
	});
	
	$('#btn_edit').on('click',f,function(){
		const nowContent = f.content.value;
		const initContent = $('#initContent').val();
		
		console.log(JSON.stringify($f.serialize()))
		
		if(nowContent.length == 0){
			griptok.component.bootbox.growl('수정하실 내용을 입력해주세요.');
		}else{
			if(nowContent === initContent){
				griptok.component.bootbox.growl('변경사항이 존재하지 않습니다.');
			}else{
				$.ajax({
					url : '/qnas',
					type : 'PUT',
					contentType: 'application/json',
					data : griptok.form.toJSON(f),
					success : function(data){
						f.proc_yn.value='답변 준비중';
						$('#initContent').val(nowContent);
						griptok.component.bootbox.growl('수정되었습니다.');
					}
				});
			}
		}
	});
	/****************************************
	* EVENT TRIGGER END
	*****************************************/
});
</script>
</body>
</html>