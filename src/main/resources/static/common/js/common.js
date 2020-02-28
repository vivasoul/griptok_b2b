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
object : griptok form util wrapper
object-name : griptok
module-depth : 2
*/
griptok.form = {};

/*
object : griptok form util function
object-name : form.toJSON
explanation : convert to named values of the form into json object used for @RequestBody in spring serverside
module-depth : 3
*/
griptok.form.toJSON = function($param_f){
	const $f = $param_f instanceof jQuery ? $param_f : $($param_f);
	
	const jsonObj = $f.serializeArray().map(function(x){
	    const obj = {};
	    obj[x.name] = x.value;
	    return obj;
	}).reduce(function(x,y){return $.extend(x,y)});
	
	return JSON.stringify(jsonObj);
}

/*
object : griptok form util function
object-name : form.validateSimple
explanation : check if named element with 'required' tag has value mapped to it. Creates message if otherwise.
module-depth : 3
*/
griptok.form.validateSimple = function($param_f){
	const $f = $param_f instanceof jQuery ? $param_f : $($param_f);
	const resultObj = {isValid : true,message : ''};
	
	$f.find( 'select, textarea, input').each(function(){
        if($(this).prop('required')){
        	if(!$( this ).val()){
        		const label = $( this ).attr('data-label') === undefined ? '':$( this ).attr('data-label');
                resultObj.isValid = false;
                resultObj.message = label + " 값을 입력해주세요.";
            }
        }
    });
	return resultObj;
}


/*
object : griptok form util function
object-name : form.validateSimple
explanation : check if named element with 'required' tag has value mapped to it. Creates message if otherwise.
module-depth : 3
*/
griptok.form.bindData = function($param_f,param_data){
	const $f = $param_f instanceof jQuery ? $param_f : $($param_f),f = $f[0];
	
	if(!param_data instanceof Object | !$f.is('form')){
		return;
	}else{
		Object.keys(param_data).forEach(function(key){
			const target = f[key];
			if(target !== undefined){
				target.value = param_data[key];
			}
		});
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
object-name : wrangle.flatten
explanation : deeply flatten param array. <EX> [1,[3,[[2]]],[5,4,[6,[7,[8]]]]] -> [1, 3, 2, 5, 4, 6, 7, 8]
module-depth : 3
*/
griptok.wrangle.flatten = function(p_arr){
	const res = p_arr.map(function(x){
    	if(Array.isArray(x)){
        	return flatten(x.flat())
        }else{
        	return x
        }
    });
	return res.flat();
};

/*
object : griptok wrangle function
object-name : wrangle.removeKey
explanation : return object without a certain key <EX> griptok.wrangle.removeKey({a: 1,b: 2,c: 3},'a') -> {b:2,c:3}
module-depth : 3
*/
griptok.wrangle.removeKey = function(object,key){
  const {[key]: removeKey, ...otherKeys} = object;
  return otherKeys;
}

/*
object : griptok wrangle function
object-name : wrangle.removeKeys
explanation : return object without a certain key <EX> griptok.wrangle.removeKeys({a: 1,b: 2,c: 3},['a','b']) -> {c:3}
module-depth : 3
*/
griptok.wrangle.removeKeys = function(object,keyArr){
  const useArr = griptok.wrangle.flatten(keyArr);
	  
  if($.isArray(useArr) & useArr.length > 0){
  	const reducedArr = useArr.slice(1);
    const removed = useArr.shift();
    const newObject = griptok.wrangle.removeKey(object,removed);
    return griptok.wrangle.removeKeys(newObject,reducedArr);
  }else{
  	return object;
  }
}


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
griptok.component.datatable = function(p_tableId,p_margin_bottom){
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
				"next": ">",
				"previous": "<"
			}
		},
		"paging": true,
		"lengthChange":false,
		"autoWidth": false,
		"searching": false,
		"ordering": false,
		"bInfo" : false
	};
	
	$this.customOptions = {
		onRowClick : function(){
			const rowIndex = $(this)[0]._DT_RowIndex;
			const rowData = $this.getRow(rowIndex);
			console.log('this is DEFAULT EVENT FOR datatable ROWCLICK.')
			console.log(rowData);
		}
	};
	
	$this.create = function(p_data,newOptions){
		let tableId = $this.tableId;
		let $table = $('#' + tableId);
		let useOptions = $this.defaultOptions;
		
		let columnOptions = $table.find('thead > tr > th').map(function(){
			return {
				data : this.getAttribute('data-column'),
				visible : this.getAttribute('data-visible') === 'false' ? false : true
			}
		});
		useOptions = $.extend(useOptions, {columns : columnOptions});
		
		let rowClickEvent = newOptions['onRowClick'];
		
		$table.find('tbody').unbind('click');
		
		if(rowClickEvent !== undefined &&  typeof rowClickEvent === 'function'){
			$this.customOptions.onRowClick = rowClickEvent;
		}
		
		let datatableOptions = griptok.wrangle.removeKeys(newOptions,['onRowClick']);
		
		if(newOptions !== undefined){
		  useOptions = $.extend(useOptions, datatableOptions);
		}
		
		if(p_data !== null){
			useOptions = $.extend(useOptions,{data : p_data});
		}
		
		const $returnTable = $table.DataTable(useOptions);
		
		$table.find('tbody').on('click','tr',$this.customOptions.onRowClick);
		
		// COMMON-CSS
		if($table.hasClass('table-striped')){$table.removeClass('table-striped')};
//		if($table.hasClass('table')){$table.removeClass('table')};
//		$table.css({'margin-top':'13px'});
//		
//		const $tableWrapper = $('#' + tableId + "_wrapper");
//		
//		if(p_margin_bottom == undefined){
//			$tableWrapper.css({'margin-bottom' : '50px'});
//		}else{
//			const use_m_b = p_margin_bottom + 'px';
//			$tableWrapper.css({'margin-bottom' : use_m_b});
//		}
		
		return $returnTable;
	};
	
	$this.reload = function(new_data){
		let $table = $('#' + $this.tableId);
		$table.DataTable().clear().rows.add(new_data).draw();
		$('#' + $this.tableId + ' tbody').unbind('click');
		$('#' + $this.tableId + ' tbody').on('click','tr',$this.customOptions.onRowClick);
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
	
	$this.getRows = function(){
		let $table = $('#' + $this.tableId);
		return $table.DataTable().rows().data();
	}
		
return $this;
}

/*
object : griptok component function
object-name : component.bootbox
explanation : wrapper for bootbox library. Currently available functions - [alert],[confirm]
required : bootstrap.min.js, bootbox.min.js
module-depth : 3
*/
griptok.component.bootbox = {
		growl : function(message,pColor,pMilliseconds){
			const milliseconds = pMilliseconds === undefined ? 1000 : pMilliseconds;
			const useColor = pColor === undefined ? 'transparent' : pColor;
			
		    const dialog = bootbox.dialog({
		        message: message 
		    });
		    
		    dialog.init(function() {
		        $(dialog).find(".modal-body").css({"background-color": pColor});
		    });
		    
		    setTimeout(function(){ 
		        dialog.modal('hide');
		    }, milliseconds);
		},
		alert : function(pOptions){
			const size = pOptions.size === undefined ? 'small' : pOptions.size;
			const title = pOptions.title === undefined ? '' : pOptions.title;
			const message = pOptions.message === undefined ? '' : pOptions.message;
			const callback = pOptions.callback === undefined ? function(){} : pOptions.callback;
			
			return bootbox.alert({
				title : title,
				size : size,
				message : message,
				callback : callback,
				buttons : {
					ok : {
						label : '<i class="fa fa-check"></i> 확인'
					}
				}
			})
		},
		confirm : function(pOptions,btnLabels){
			const defaultCallback = function(result){
				console.log('no callback was defined for bootbox.confirm. result = ' + result);
				return result;
			}
			
			const message = pOptions.message === undefined ? '진행하시겠어요?' : pOptions.message;
			const title = pOptions.title === undefined ? '': pOptions.title;
			const callback = typeof pOptions.callback !== 'function' ? defaultCallback : pOptions.callback;
			
			
			const cancelText = btnLabels !== undefined ? btnLabels.cancel : '취소';
			const confirmText = btnLabels !== undefined ? btnLabels.confirm : '확인';
			
			return bootbox.confirm({
			    title: title,
			    message: message,
			    buttons: {
			        cancel: {
			            label: '<i class="fa fa-times"></i> ' + cancelText
			        },
			        confirm: {
			            label: '<i class="fa fa-check"></i> ' + confirmText
			        }
			    },
			    callback: callback
			});
		},
		
}