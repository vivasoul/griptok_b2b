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
		<div class="row">
			<table id="example" class="table table-striped table-bordered hover">
				<thead>
					<tr>
						<th><input name="select_all" value="1" id="example-select-all" type="checkbox" /></th>
						<th data-column = "title">상품</th>
						<th data-column = "reg_dt">가격</th>
						<th data-column = "view_count">관리</th>
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
				"select" : true,
			  	"title": "상품 관련 공지 입니다.",
			  	"reg_dt": "2011/04/25",
			  	"view_count" : 4,
			},
			{
				"notice_no" : 20,
				"select" : false,
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
	var table = exampleTable.create(initData,  {
	      'columnDefs': [{
	         'targets': 0,
	         'searchable':false,
	         'orderable':false,
	         'className': 'dt-body-center',
	         'render': function (data, type, full, meta){
	             return '<input type="checkbox" name="id[]" value="' 
	                + $('<div/>').text(data).html() + '">';
	         }
	      }],
	      'order': [1, 'asc']
	   });
	
	
	/****************************************
	* EVENT TRIGGER START
	*****************************************/
// 	$('#sel-category').on('change',function(){
// 		const optionValue = $(this).val();
		
// 		//replace with ajax later
// 		const filtered = initData.filter(function(x){
// 			return (x['category'] === optionValue) ? true : (optionValue === '전체' ? true:false)
// 		})
		
// 		exampleTable.reload(filtered);
// 	});
	
	$('#example-select-all').on('click', function(){
      // Check/uncheck all checkboxes in the table
      var rows = table.rows({ 'search': 'applied' }).nodes();
      $('input[type="checkbox"]', rows).prop('checked', this.checked);
   });
	
	$('#example tbody').on('change', 'input[type="checkbox"]', function(){
	      // If checkbox is not checked
	      if(!this.checked){
	         var el = $('#example-select-all').get(0);
	         // If "Select all" control is checked and has 'indeterminate' property
	         if(el && el.checked && ('indeterminate' in el)){
	            // Set visual state of "Select all" control 
	            // as 'indeterminate'
	            el.indeterminate = true;
	         }
	      }
	   });
	
// 	$('#example tbody').on('click','tr',function(){
// 		const rowdata = exampleTable.selectedRow(this);
// 		const noticeId = rowdata.notice_no;
// 		const _url = 'notice/' + noticeId;
// 		window.location.href = _url;
// 	})
	/****************************************
	* EVENT TRIGGER END
	*****************************************/
});
</script>
</body>
</html>