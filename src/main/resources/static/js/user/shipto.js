const shiptoTable = griptok.component.datatable('shipto-tbl');
var table = null;
$(document).ready(function() {
	if(user_no=="null"){
		alert("세션이 만료되었습니다.");
		location.href="/login";
	}
	
	loadMainShippingList();
//	else if(info_changed!="null"){
//		if(info_changed=="failed"){
//			alert("정보 변경에 실패하였습니다.");
//		}else{
//			alert("정보 변경에 성공하였습니다.");
//		}
//	}
	
});


const update = {
		clicked : {
			remove : function(indice){
				var confirmed = confirm("정말로 해당 주소를 삭제 하시겠습니까?")
				if(confirmed){
					$('#shipto_no').val(indice);
					$.ajax({
				        url : "/shipto/delete/"+indice,
				        type: "post",
				        data : { "user_no" : user_no},
				        success : function(responseData){
				        	var result = responseData.result;
				        	if(result==1){
				        		alert("삭제 되었습니다.");
				        		loadMainShippingList(true);
				        	}else{
				        		alert("삭제에 실패하였습니다. 관리자에게 문의하세요.");
				        	}
				        	
				        }
				    })
				}
			},
			change : function(indice){
				$('#shipto_no').val(indice);
				$('#modal_title').html("배송지 정보 변경");
				$.ajax({
			        url : "/shipto/info/"+indice,
			        type: "post",
			        data : { "user_no" : user_no},
			        success : function(responseData){
			        	var result = responseData.result;
			        	$('#shipto_add').css("display", "none");
			        	$('#shipto_change').css("display", "");
			        	loadShippingdata(result);
			        }
			    });
			}
		}
}

function loadMainShippingList(reload){
	
		$.ajax({
	        url : "/shipto/info",
	        type: "post",
	        data : {"user_no" : user_no},
	        success : function(responseData){
	        	if(reload){
	        		table.clear().draw();
	        		table.rows.add(responseData.result); // Add new data
	        		table.columns.adjust().draw(); // Redraw the DataTable
	        	}else{
		        	table = shiptoTable.create(responseData.result,  {
		        		"lengthChange": false,
		        		columnDefs: [
		        			{"className": "dt-body-center", "targets": [0,3,4]},
		        			{"className": "dt-head-center", "targets": "_all"},
		        			{
		        				"targets": [0],
		        				render: function (shipto_no,type,row,obj) { 
		        					const checkedString = row.checked == 'true' ? 'checked' : '';
		        					return '<input type="checkbox" class="form-group js-chk" value ="'+ shipto_no +'" data-row-indice="'+ obj.row +'"'+ checkedString +'/>'; 
		        				} 
		        			},
		        			{
		        				"targets": [5], 
		        				render: function (shipto_no,type,row,obj) { 
		        					const btnDiv = 
		        						'<div class="row">' +
		        							'<div class="col-md-offset-3">' + 
		        							'<button class="btn btn-primary form-group js-change-now" data-toggle="modal" data-target="#addrModal"  data-row-indice="'+shipto_no+'">수정</button>' +
		        							'</div>' +
		        						'</div>' + 
		        						'<div class="row">' +
		        							'<div class="col-md-offset-3">' + 
		        							'<button class="btn btn-secondary-outline form-group js-delete-now" data-row-indice="'+shipto_no+'">삭제</button>' +
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

function loadShippingdata(result){
	$('#shipto_no').val(result.shipto_no);
	$('#receiver_nm').val(result.receiver_nm);
	$('#shipto_addr1').val(result.shipto_addr1);
	$('#shipto_addr2').val(result.shipto_addr2)
	$('#receiver_tel').val(result.receiver_tel);
	$('#shipto_nm').val(result.shipto_nm);
	$('#post_code').val(result.post_code);
}

function changeDefaultShipping(){
	// check if only one is checked(0 or multiple X)
	const checkedIndices =
		$('.js-chk').
		toArray().
		filter(function(x){return $(x).is(':checked')}).
		map(function(x){return shiptoTable.getRow($(x).attr('data-row-indice'))});
	// ajax update
	
	if(checkedIndices.length==0){
		alert("체크된 배송지가 없습니다.");
	}else if(checkedIndices.length>1){
		alert("기본 배송지 설정은 한 주소만 가능합니다.");
	}else{
		// ajax
		// () post_code 설정하기
		console.log(checkedIndices);
		var indice = checkedIndices[0].shipto_no;
		$.ajax({
	        url : "/shipto/default/"+indice,
	        type: "post",
	        data : { "user_no" : user_no},
	        success : function(responseData){
	        	var result = responseData.result;
	        	if(result==1){
	        		alert("기본 배송지 설정이 완료되었습니다.");
	        		loadMainShippingList(true);
	        	}else{
	        		alert("기본 배송지 설정에 실패하였습니다.");
	        	}
	        }
	    });
	}
}

function deleteShipping(){
	
	const checkedIndices =
		$('.js-chk').
		toArray().
		filter(function(x){return $(x).is(':checked')}).
		map(function(x){return shiptoTable.getRow($(x).attr('data-row-indice')).shipto_no});
	// ajax update
	console.log(checkedIndices);
	if(checkedIndices.length==0){
		alert("삭제할 배송지를 선택해 주세요.");
	}else{
		if(!confirm("정말로 삭제하시겠습니까?")){
			return false;
		}
		$.ajax({
	        url : "/shipto/delete/bulk",
	        type: "post",
	        data : { "user_no" : user_no,
	        		 "shipto_no_arr" : checkedIndices
	        	   },
	        success : function(responseData){
	        	var result = responseData.result;
	        	if(result==1){
	        		alert("삭제되었습니다.");
	        		loadMainShippingList(true);
	        	}else{
	        		alert("삭제에 실패하였습니다.");
	        	}
	        }
	    });
	}
}

function addShipping(){
	// clear form
	$('#modal_title').html("배송지 새로 입력");
	$('#shipto_add').css("display", "");
	$('#shipto_change').css("display", "none");
	clearShippingdata();
	
}


function clearShippingdata(){
	$('#shipto_no').val('');
	$('#receiver_nm').val('');
	$('#shipto_addr1').val('');
	$('#shipto_addr2').val('');
	$('#receiver_tel').val('');
	$('#shipto_nm').val('');
	$('#post_code').val('');
}

$(document).on('click','.js-change-now',function(){
	update.clicked.change($(this).attr('data-row-indice'));
});

$(document).on('click','.js-delete-now',function(){
	update.clicked.remove($(this).attr('data-row-indice'));
});

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


function openDaumZipAddress() {

	new daum.Postcode({

		oncomplete:function(data) {
			jQuery("#post_code").val(data.postcode1+"-"+data.postcode2);

			if(data.postcode1==""){
				jQuery("#post_code").val(data.zonecode);
			}
			
			jQuery("#shipto_addr1").val(data.address);

			jQuery("#shipto_addr2").focus();

		}

	}).open();

}

$("#shipto_change").bind("click",function(){
	if(emptyCheck("post_code")&&emptyCheck("shipto_addr_1")&&emptyCheck("shipto_addr_2")&&emptyCheck("shipto_nm")&&emptyCheck("receiver_nm")&&emptyCheck("receiver_tel")){
	    $.ajax({
	        url : "/shipto/change",
	        type: "post",
	        data : JSON.stringify({ 
	        		 "receiver_nm" : $("#receiver_nm").val(),
	        	     "receiver_tel" : $("#receiver_tel").val(),
	        	     "shipto_nm" : $("#shipto_nm").val(),
	        	     "post_code" : $("#post_code").val(),
	        	     "shipto_addr1" : $("#shipto_addr1").val(),
	        	     "shipto_addr2" : $("#shipto_addr2").val(),
	        	     "user_no" : user_no,
	        	     "shipto_no" : $("#shipto_no").val()
	        		}),
	    	contentType: "application/json",
	        success : function(responseData){
	        	if(responseData.result==0){
	        		alert("배송지 변경에 실패했습니다.");
	        	}else{
	        		alert("배송지 정보가 업데이트 되었습니다.");
	        		loadMainShippingList(true);
	        		$("#shipto_change_close").click();
	        	}
	        }
	    });
	}else{
		alert("값을 채워주세요.");
	}
});

$("#shipto_add").bind("click",function(){
	if(emptyCheck("post_code")&&emptyCheck("shipto_addr_1")&&emptyCheck("shipto_addr_2")&&emptyCheck("shipto_nm")&&emptyCheck("receiver_nm")&&emptyCheck("receiver_tel")){
	    $.ajax({
	        url : "/shipto/add",
	        type: "post",
	        data : JSON.stringify({ 
	        		 "receiver_nm" : $("#receiver_nm").val(),
	        	     "receiver_tel" : $("#receiver_tel").val(),
	        	     "shipto_nm" : $("#shipto_nm").val(),
	        	     "post_code" : $("#post_code").val(),
	        	     "shipto_addr1" : $("#shipto_addr1").val(),
	        	     "shipto_addr2" : $("#shipto_addr2").val(),
	        	     "user_no" : user_no,
	        	     "shipto_no" : null
	        		}),
	    	contentType: "application/json",
	        success : function(responseData){
	        	if(responseData.result==0){
	        		alert("배송지 추가에 실패하였습니다.");
	        	}else{
	        		alert("배송지 추가에 성공하였습니다.");
	        		loadMainShippingList(true);
	        		$("#shipto_change_close").click();
	        	}
	        }
	    });
	}else{
		alert("값을 채워주세요.");
	}
});




function emptyCheck(input_id){
	var input_val = jQuery('#'+input_id).val();
	if(input_val==""){
		return false;
	}else{
		return true;
	}
}

var receiver_tel = document.getElementById("receiver_tel");
receiver_tel.onfocusout = validateRegex;
receiver_tel.onkeyup = autoHypenPhone;

function validateRegex(){
	var regex_id = this.id;
	var regex_type = /(?=.{6,})/;
	var regex_msg = "비밀번호는 6~15자 이내로 입력해야 합니다.";
	
	if(regex_id=="receiver_tel"){
		regex_type = /^[0-9]{3}[-]+[0-9]{4}[-]+[0-9]{4}$/;
		regex_msg = "전화번호가 올바르지 않습니다.";
	}
	if(!regex_type.test(this.value)){
		this.setCustomValidity(regex_msg);
		this.reportValidity();
	}else{
		this.setCustomValidity('');
	}
}
function autoHypenPhone(){
	  var str = this.value;
	  str = str.replace(/[^0-9]/g, '');
	  var tmp = '';
	  if( str.length < 4){
		  tmp = str;
	  }else if(str.length < 7){
	    tmp += str.substr(0, 3);
	    tmp += '-';
	    tmp += str.substr(3);
	  }else if(str.length < 11){
	    tmp += str.substr(0, 3);
	    tmp += '-';
	    tmp += str.substr(3, 3);
	    tmp += '-';
	    tmp += str.substr(6);
	  }else{
	    tmp += str.substr(0, 3);
	    tmp += '-';
	    tmp += str.substr(3, 4);
	    tmp += '-';
	    tmp += str.substr(7);
	  }
	  this.value=tmp;
	}
