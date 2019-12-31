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
	<div class="container">
		<div class="row pull-right">
			<select class="form-control" id="sel-proc-yn">
			  <option>문의 전체</option>
			  <option>답변 완료</option>
			  <option>답변 준비중</option>
			</select>
		</div>
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
					<c:forEach var="each" items="${arr }">
						<tr data-row-id="${each.qna_no }">
							<td>${each.qna_no }</td>
							<td>${each.title }</td>
							<td>${each.req_dt }</td>
							<td>${each.proc_yn }</td>
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
	$('#sel-proc-yn').on('change',function(){
		const optionValue = $(this).val();
		
		//replace with ajax later
		const filtered = initData.filter(function(x){
			return (x['proc_yn'] === optionValue) ? true : (optionValue === '문의 전체' ? true:false)
		})
		
		exampleTable.reload(filtered);
	});
	
	$('#example tbody').on('click','tr',function(){
		const qnaId = $(this).attr('data-row-id');
		
		if(qnaId !== undefined){
			const _url = 'qna/view?id=' + qnaId;
			window.location.href = _url;
		}
	})
	/****************************************
	* EVENT TRIGGER END
	*****************************************/
});
</script>
</body>
</html>