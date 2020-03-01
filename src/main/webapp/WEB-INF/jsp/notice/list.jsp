<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/lib/datatable/jquery.dataTables.min.js"></script>
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
		<table id="example" class="gtk-datatable">
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