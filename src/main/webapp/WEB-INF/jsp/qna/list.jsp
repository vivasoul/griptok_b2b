<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<th data-column = "board_no">번호</th>
						<th data-column = "title">문의내용</th>
						<th data-column = "reg_dt">문의일자</th>
						<th data-column = "proc_yn">처리여부</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
<script>
$(document).ready(function() {
	const get_query = function(){
		//replace with ajax later
		const originalData = [
			{
			  "board_no": "1",
			  "title": "답변완료됬나요",
			  "reg_dt": "2011/04/25",
				  "content" : "답변완료됬군요./n 오케이.",
				"proc_yn": "답변 완료"
			},
			{
				"board_no": "2",
				"title": "답변준비중이신가요",
				"reg_dt": "2011/04/28",
				"content": "답변완료됬군요./n 오케이.",
				"proc_yn": "답변 준비중"
			},
		]
		return griptok.wrangle.mockdata(originalData,100,['board_no','title','content']);
	}
	
	// initial data : later replace with API
	const initData = get_query();
	// DataTable initialisation 
	const exampleTable = griptok.component.datatable('example');
	exampleTable.create(initData);
	
	
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
		const rowdata = exampleTable.selectedRow(this);
		const qnaId = rowdata.board_no;
		const _url = 'qna/' + qnaId;
		window.location.href = _url;
	})
	/****************************************
	* EVENT TRIGGER END
	*****************************************/
});
</script>
</body>
</html>