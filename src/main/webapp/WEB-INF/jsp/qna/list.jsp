<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <link rel="stylesheet" href="./lib/datatable/jquery.dataTables.min.css"> -->
<script src="/lib/datatable/jquery.dataTables.min.js"></script>
<div class="container-fluid">
	<div class="row gtk-filter-group">
		<select id="sel-proc-yn">
		  <option>문의 전체</option>
		  <option>답변 완료</option>
		  <option>답변 준비중</option>
		</select>
	</div>
	<div class="row">
		<table id="example" class="gtk-table">
			<thead>
				<tr>
					<th data-column = "qna_no">번호</th>
					<th data-column = "title">문의내용</th>
					<th data-column = "req_dt">문의일자</th>
					<th data-column = "proc_yn">처리여부</th>
					<th data-column = "isViewYN" data-visible="false">상세 페이지 요청 가능여부</th>
				</tr>
			</thead>
			<tbody>
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
			const qnaId = rowData.qna_no;
			const canViewChange = rowData.isViewYN == 'Y';
			
			if(!canViewChange){
				alert("본인이 작성하신 글에 대해서만 열람 가능합니다.");
				return false;
			}
			
			if(qnaId !== undefined){
				const _url = 'qna/view?id=' + qnaId;
				window.location.href = _url;
			}
		}
	});
	
	var initData = exampleTable.getRows();
	
	$.ajax({
		url : "/qnas",
        type: "get",
        success : function(result){
        	exampleTable.reload(result);
        	initData = exampleTable.getRows();
        }
	});
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
	/****************************************
	* EVENT TRIGGER END
	*****************************************/
});
</script>