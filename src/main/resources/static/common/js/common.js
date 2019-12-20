/*
object : griptok common module wrapper
object-name : griptok
module-depth : 1
*/
var griptok = {}; 


/*
object : griptok date util wrapper
object-name : griptok
module-depth : 2
*/
griptok.date = {};

/*
object : griptok date util function
object-name : date.isDateValid
explanation : check if object can be parsed as a date object
module-depth : 3
*/
griptok.date.isDateValid = function(pDate){
	const dateToCheck = new Date(pDate);
	return (dateToCheck instanceof Date) && !isNaN(dateToCheck)
}

/*
object : griptok date util function
object-name : date.manipulate
explanation : add or subtract month,year,day from date object
module-depth : 3
*/
griptok.date.manipulate = function(pDate,pOptions){
	const defaultOptions = {
		"year" : 0,
		"month" : 0,
		"day" : 0,
		"sep" : "/"
	};
	
	const useDate = new Date(pDate);
	
	if(typeof pOptions === 'object'){
		if(!griptok.date.isDateValid(pDate)){
			console.log('[griptok.date.manipulate()]failed to parse your date')
			return pDate;
		}else{
			var returnDate = new Date();
			
			returnDate.setFullYear(useDate.getFullYear() + parseInt((pOptions['year'] === undefined ? defaultOptions['year'] : pOptions['year'])));
			returnDate.setMonth(useDate.getMonth() + parseInt((pOptions['month'] === undefined ? defaultOptions['month'] : pOptions['month'])));
			returnDate.setDate(useDate.getDate() + parseInt((pOptions['day'] === undefined ? defaultOptions['day'] : pOptions['day'])));
			
			const separation = pOptions['sep'] === undefined ? defaultOptions['sep'] : pOptions['sep'];
			
			const finalDate = returnDate.getFullYear() + separation + 
				(returnDate.getMonth() + 1) + separation + 
				returnDate.getDate();
			
			if(griptok.date.isDateValid(finalDate)){
				return finalDate;
			}else{
				console.log('[griptok.date.manipulate()]invalid value for your pOptions parameters.[griptok.date.manipulate()]');
				return pDate;
			}
		}
	}else{
		console.log('[griptok.date.manipulate()]no date manipulation was done. check your pOptions parameters.')
		return pDate;
	}
}

/*
object : griptok wrangle wrapper
object-name : griptok
module-depth : 2
*/
griptok.wrangle = {};

/*
object : griptok wrangle function
object-name : wrangle.seq_len
explanation : create an int array with with given size starting from 0
module-depth : 3
*/
griptok.wrangle.seq_len = function(arrSize){
	let intArr = [];
	for(let i = 0; i < arrSize; i++){
		intArr.push(i);
	}
	return intArr;
};


/*
object : griptok wrangle function
object-name : wrangle.mockdata
explanation : given an array, containing key value objects, create multiple objects with different values for the given keys.
example-usage : griptok.wrangle.mockdata([{a:1,b:'hello'},{a:4,b:'bye'}],10,['a','b'])
module-depth : 3
*/

griptok.wrangle.mockdata = function(
	originalArray,
	mockSize,
	keyArray
){
	return griptok.wrangle.seq_len(mockSize).map(function(intElem){
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
object : griptok component wrapper
object-name : griptok
module-depth : 2
*/
griptok.component = {};

/*
object : griptok component function
object-name : component.datatable
explanation : wrapper for DataTable library. Currently available functions - [create],[reload],[selectedRow]
module-depth : 3
*/
griptok.component.datatable = function(p_tableId){
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
	
	$this.updateRow = function(new_data,indice){
		let $table = $('#' + $this.tableId);
		$table.DataTable().row(indice).data(new_data);
	};
	
	$this.selectedRow = function(){
		let $table = $('#' + $this.tableId);
		return $table.DataTable().row({selected : true}).data();
	};
	
	$this.getRow = function(rowIndex){
		let $table = $('#' + $this.tableId);
		return $table.DataTable().row(rowIndex).data();
	};
	
return $this;
}