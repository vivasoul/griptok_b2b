const interestedTable = griptok.component.datatable('interested-tbl');
var table = null;
$(document).ready(function() {
	if(user_no=="null"){
		alert("세션이 만료되었습니다.");
		location.href="/login";
	}
	
	loadMainInterestedList();
	
});


const update = {
		clicked : {
			remove : function(indice){
				var confirmed = confirm("정말로 해당 상품을 관심상품에서 삭제 하시겠습니까?")
				if(confirmed){
					$.ajax({
				        url : "/interested/delete/"+indice,
				        type: "post",
				        data : { "user_no" : user_no},
				        success : function(responseData){
				        	var result = responseData.result;
				        	if(result==1){
				        		alert("삭제 되었습니다.");
				        		loadMainInterestedList(true);
				        	}else{
				        		alert("삭제에 실패하였습니다.");
				        	}
				        	
				        }
				    })
				}
			},
			change : function(indice){
				if(!confirm("해당 상품을 장바구니에 담으시겠습니까?")){
					return;
				}
				$.ajax({
			        url : "/interested/add/"+indice,
			        type: "post",
			        data : { "user_no" : user_no},
			        success : function(responseData){
			        	var result = responseData.result;
			        	if(result==1){
			        		alert("장바구니에 담겼습니다.");
			        	}else{
			        		alert("장바구니 담기에 실패하였습니다.");
			        	}
			        	loadMainInterestedList(true);
			        }
			    });
			}
		}
}

function loadMainInterestedList(reload){
	
		$.ajax({
	        url : "/interested/info",
	        type: "post",
	        data : {"user_no" : user_no},
	        success : function(responseData){
	        	if(reload){
	        		table.clear().draw();
	        		table.rows.add(responseData.result); // Add new data
	        		table.columns.adjust().draw(); // Redraw the DataTable
	        	}else{
		        	table = interestedTable.create(responseData.result,  {
		        		"lengthChange": false,
		        		columnDefs: [
		        			{"className": "dt-body-center", "targets": [0,2,3]},
		        			{"className": "dt-head-center", "targets": "_all"},
		        			{
		        				"targets": [0],
		        				render: function (product_id,type,row,obj) { 
		        					const checkedString = row.checked == 'true' ? 'checked' : '';
		        					return '<input type="checkbox" class="form-group js-chk" value ="'+ product_id +'" data-row-indice="'+ obj.row +'"'+ checkedString +'/>'; 
		        				} 
		        			},
		        			{
		        				"targets": [3], 
		        				render: function (product_id,type,row,obj) { 
		        					const btnDiv = 
		        						'<div class="row">' +
		        							'<div class="col-md-offset-3">' + 
		        							'<button class="btn btn-primary form-group js-change-now" data-toggle="modal" data-target="#addrModal"  data-row-indice="'+product_id+'">장바구니 담기</button>' +
		        							'</div>' +
		        						'</div>' + 
		        						'<div class="row">' +
		        							'<div class="col-md-offset-3">' + 
		        							'<button class="btn btn-secondary-outline form-group js-delete-now" data-row-indice="'+product_id+'">삭제</button>' +
		        							'</div>' + 
		        						'</div>' 
		
		        					return btnDiv;
		        				} 
		        			},
		        		]
		        	
		        });
	        	}
	        }
	    });
}


function deleteInterested(){
	const checkedIndices =
		$('.js-chk').
		toArray().
		filter(function(x){return $(x).is(':checked')}).
		map(function(x){return interestedTable.getRow($(x).attr('data-row-indice')).product_id});
	// ajax update
	console.log(checkedIndices);
	if(checkedIndices.length==0){
		alert("삭제할 관심상품을 선택해 주세요.");
	}else{
		if(!confirm("정말로 삭제하시겠습니까?")){
			return false;
		}
		$.ajax({
	        url : "/interested/delete/bulk",
	        type: "post",
	        data : { "user_no" : user_no,
	        		 "product_id_arr" : checkedIndices
	        	   },
	        success : function(responseData){
	        	var result = responseData.result;
	        	console.log(result);
	        	if(result==1){
	        		alert("삭제되었습니다.");
	        		loadMainInterestedList(true);
	        	}else{
	        		alert("삭제에 실패하였습니다.");
	        	}
	        }
	    });
	}
}

function addToCart(){
	const checkedIndices =
		$('.js-chk').
		toArray().
		filter(function(x){return $(x).is(':checked')}).
		map(function(x){return interestedTable.getRow($(x).attr('data-row-indice')).product_id});
	// ajax update
	console.log(checkedIndices);
	if(checkedIndices.length==0){
		alert("장바구니에 담을 상품을 선택해 주세요.");
	}else{
		if(!confirm("장바구니에 담으시겠습니까?")){
			return false;
		}
		$.ajax({
	        url : "/interested/add/bulk",
	        type: "post",
	        data : { "user_no" : user_no,
	        		 "product_id_arr" : checkedIndices
	        	   },
	        success : function(responseData){
	        	var result = responseData.result;
	        	console.log(result);
	        	if(result==1){
	        		alert("장바구니에 상품을 담았습니다.");
	        	}else{
	        		alert("장바구니 담기에 실패하였습니다.");
	        	}
	        	loadMainInterestedList(true);
	        }
	    });
	}
}

$(document).on('click','.js-change-now',function(){
	update.clicked.change($(this).attr('data-row-indice'));
});

$(document).on('click','.js-delete-now',function(){
	update.clicked.remove($(this).attr('data-row-indice'));
});




