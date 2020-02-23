<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="./common/js/common.js"></script>
<link rel="stylesheet" href="./lib/bootstrap/css/bootstrap.min.css">
<!--  link rel="stylesheet" href="./lib/datatable/jquery.dataTables.min.css" -->
<script src="./lib/js/jquery.min.js"></script>
<script src="./lib/datatable/jquery.dataTables.min.js"></script>
<style type="text/css">
.gtk-table { border-collapse:collapse;margin:14px 0px;width:100%; }
.gtk-table th,
.gtk-table td { border:1px solid #E0E0E0;color:#7c7c7c;font-size:12px;line-height:12px;padding:14px 20px; }
.gtk-table th { background-color:#FCFCFC;text-align:center; }
.gtk-table td {  }
.dataTables_paginate { float: right; margin-top: -20px; color: #7c7c7c; }
.dataTables_paginate a { text-decoration:none;color:#7c7c7c }
.dataTables_paginate a:hover { text-decoration:none;color:#000; }

.dataTables_paginate .paginate_button:hover { cursor:pointer; }
.dataTables_paginate span>.paginate_button { display:inline-block;width:25px;height:25px;padding:1px;
										text-align: center;vertical-align: middle;margin: 5px;
										color: #7C7C7C; border:1px solid #E0E0E0; background-color: #FFF; }
.dataTables_paginate span>.paginate_button.current { color: #FFF; border:1px solid #00A1E3; background-color: #19B4F0; } 
.dataTables_paginate .paginate_button.previous, 
.dataTables_paginate .paginate_button.next {  }
</style>
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
			<table id="example" class="gtk-table">
				<thead>
					<tr>
						<th data-column = "notice_no" data-visible="false">공지번호</th>
						<th data-column = "category">구분</th>
						<th data-column = "title">제목</th>
						<th data-column = "reg_dt">작성일</th>
						<th data-column = "view_count">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="each" items="${arr }">
						<tr>
							<td>${each.notice_no }</td>
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
	exampleTable.create(null,{
		onRowClick : function(){
			const rowIndex = $(this)[0]._DT_RowIndex;
			const rowData = exampleTable.getRow(rowIndex);
			const noticeId = rowData.notice_no;
			
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
		}
	});
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
	/****************************************
	* EVENT TRIGGER END
	*****************************************/
});
</script>
</body>
</html>