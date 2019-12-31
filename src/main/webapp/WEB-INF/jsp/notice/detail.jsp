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
<div class="container-fluid">
	<div class="row">
		<table id="example2" class="table table-striped table-bordered hover">
			<thead>
				<tr>
					<th data-column = "category">구분</th>
					<th data-column = "title">제목</th>
					<th data-column = "reg_dt">작성일</th>
					<th data-column = "view_count">조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${answerObject.category}</td>
					<td>${answerObject.title}</td>
					<td>${answerObject.reg_dt}</td>
					<td>${answerObject.view_count}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="row">
		<table class="table table-bordered">
			<tr>
				<td colspan="2">
					<textarea rows="10" cols="10" class="form-control" readonly >${answerObject.content }</textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="row text-center">
		<input type="button" id="btn_list" value="목록" class="btn btn-primary col-md-push-6">
	</div>
</div>
<script>
$(document).ready(function() {
	// DataTable initialisation
	const $f = $('#notice-detail-form'), f = $f[0];
	
	const onInit = function(){
		const toDoList = {
			'createInitialTable' : function(){
				griptok.component.datatable('example2').create(null,{
					"paging": false
				});
			},
		}
		Object.keys(toDoList).forEach(function(actionName){toDoList[actionName]()})
	}
	
	onInit();
	/****************************************
	* EVENT TRIGGER START
	*****************************************/
	$('#btn_list').on('click',f,function(){
		window.location.href = '../notice';
	})
	/****************************************
	* EVENT TRIGGER END
	*****************************************/
});
</script>
</body>
</html>