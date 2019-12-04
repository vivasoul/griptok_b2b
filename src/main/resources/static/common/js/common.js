/*
object : griptalk common module wrapper
object-name : griptalk
module-depth : 1
*/
var griptalk = {}; 

/*
object : griptalk wrangle wrapper
object-name : griptalk
module-depth : 2
*/
griptalk.wrangle = {};

griptalk.wrangle.seq_len = function(arrSize){
	let intArr = [];
	for(let i = 0; i < arrSize; i++){
		intArr.push(i);
	}
	return intArr;
};

griptalk.wrangle.mockdata = function(
	originalArray,
	mockSize,
	keyArray
){
	return griptalk.wrangle.seq_len(mockSize).map(function(intElem){
		return originalArray.map(function(eachElem){
			return Object.keys(eachElem).map(function(k){
				let eachValue = eachElem[k];

				if(keyArray != undefined && keyArray.indexOf(k) >= 0){
					eachValue = eachValue + intElem;
				}
				let mockObj = {}; 
				mockObj[k] = eachValue;

				return mockObj;
			}).reduce(function(x,y){return $.extend(x,y)});
		})
	}).flat();
}

/*
object : griptalk component wrapper
object-name : griptalk
module-depth : 2
*/
griptalk.component = {};

/*
object : griptalk datatable wrapper
object-name : datatable
module-depth : 3
*/
griptalk.component.datatable = function(p_tableId){
	let $this = $(this);

	$this.tableId = p_tableId;
	$this.defaultOptions = {
		"responsive" : true,
		"language": {
			"emptyTable": "조회된 데이터가 없습니다.",
			"lengthMenu": "페이지당 _MENU_ 개씩 보기",
			"info": "현재 _START_ - _END_ / _TOTAL_건",
			"infoEmpty": "데이터가 존재하지 않습니다.",
			"infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
			"search": "에서 검색: ",
			"zeroRecords": "일치하는 데이터가 없습니다.",
			"loadingRecords": "로딩중입니다...",
			"processing":     "처리중입니다...",
			"paginate": {
				"next": "다음",
				"previous": "이전"
			}
		},
		"paging": true,
		"autoWidth": true,
		"searching": false,
	};

	$this.create = function(p_data,newOptions){
		let tableId = $this.tableId;
		let $table = $('#' + tableId);
		let useOptions = $this.defaultOptions;

		let columnOptions = $table.find('thead > tr > th').map(function(){return {data : this.getAttribute('data-column')}});

		useOptions = $.extend(useOptions, {columns : columnOptions});

		if(newOptions != undefined){
		  useOptions = $.extend(useOptions, newOptions);
		}
		
		if(p_data != null){
			useOptions = $.extend(useOptions,{data : p_data});
		}
		
		return $table.DataTable(useOptions);
	};
	
	$this.reload = function(new_data){
		let $table = $('#' + $this.tableId);
		$table.DataTable().clear().rows.add(new_data).draw();
	};
	
	$this.selectedRow = function(rowHtml){
		let $table = $('#' + $this.tableId);
		return $table.DataTable().row(rowHtml).data();
	};
	
	
return $this;
}