<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="./common/js/common.js"></script>
<script src="./lib/js/jquery.min.js"></script>
<link rel="stylesheet" href="./lib/bootstrap/css/bootstrap.min.css">

<script src="./lib/datatable/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="./lib/datatable/jquery.dataTables.min.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row pull-right">
			<select class="form-control" id="sel-category">
			  <option>전체</option>
			  <option>배송지연</option>
			  <option>일반</option>
			  <option>이벤트</option>
			</select>
		</div>
		<div class="row">
			<table id="example" class="table table-striped table-bordered hover">
				<thead>
					<tr>
						<th data-column = "category">구분</th>
						<th data-column = "title">제목</th>
						<th data-column = "reg_dt">작성일</th>
						<th data-column = "view_count">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="each" items="${arr }">
						<tr data-row-id="${each.notice_no }">
							<td>${each.category }</td>
							<td>${each.title }</td>
							<td>${each.reg_dt }</td>
							<td>${each.view_cnt }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
<script>
$(document).ready(function() {
	// DataTable initialisation 
	const exampleTable = griptok.component.datatable('example');
	exampleTable.create(null);
	const initData = exampleTable.getRows();
	/****************************************
	* EVENT TRIGGER START
	*****************************************/
	$('#sel-category').on('change',function(){
		const optionValue = $(this).val();
		//replace with ajax later
		const filtered = initData.filter(function(x){
			return (x['category'] === optionValue) ? true : (optionValue === '전체' ? true:false)
		})
		exampleTable.reload(filtered);
	});
	
	$('#example tbody').on('click','tr',function(){
		const noticeId = $(this).attr('data-row-id');
		if(noticeId !== undefined){
			const _url = 'notice/view?id=' + noticeId;
			const send = {notice_no : noticeId};
			
			$.ajax({
				url : '/notices',
				data : JSON.stringify(send),	
				type : 'PUT',
				contentType : 'application/json',
				complete : function() {
					window.location.href = _url;   
			    }
			});
		}
	})
	/****************************************
	* EVENT TRIGGER END
	*****************************************/
});
</script>
</body>
</html>