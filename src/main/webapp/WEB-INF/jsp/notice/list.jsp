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
				"notice_no" : 1,
				"category": "이벤트",
			  	"title": "상품 관련 공지 입니다.",
			  	"reg_dt": "2011/04/25",
			  	"view_count" : 4,
			},
			{
				"notice_no" : 20,
				"category": "일반",
			  	"title": "행사 관련 공지 입니다.",
			  	"reg_dt": "2011/03/25",
			  	"view_count" : 499,
			},
		]
		return griptok.wrangle.mockdata(originalData,10,['notice_no','title','view_count']);
	}
	
	// initial data : later replace with API
	const initData = get_query();
	// DataTable initialisation 
	const exampleTable = griptok.component.datatable('example');
	exampleTable.create(initData);
	
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
		const rowdata = exampleTable.selectedRow(this);
		const noticeId = rowdata.notice_no;
		const _url = 'notice/' + noticeId;
		window.location.href = _url;
	})
	/****************************************
	* EVENT TRIGGER END
	*****************************************/
});
</script>
</body>
</html>