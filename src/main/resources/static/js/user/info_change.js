$(document).ready(function() {
	if(user_no=="null"){
		alert("세션이 만료되었습니다.");
		location.href="/login";
	}else if(info_changed!="null"){
		if(info_changed=="failed"){
			alert("정보 변경에 실패하였습니다.");
		}else{
			alert("정보 변경에 성공하였습니다.");
		}
	}
	bs_input_file();
	validationInitialize();
	validateAll("#info_change_form");
	validateAll("#password_form");
	$.ajax({
        url : "/info_change/load",
        type: "get",
        success : function(responseData){
        	$("#user_id").val(responseData.user_id);
        	$("#ceo_nm").val(responseData.ceo_nm);
        	$("#company_nm").val(responseData.company_nm);
        	$("#manager_nm").val(responseData.manager_nm);
        	$("#manager_tel").val(responseData.manager_tel);
        	$("#manager_email").val(responseData.manager_email);
        	$("#biz_reg_number").val(responseData.biz_reg_number);
        	$("#biz_category").val(responseData.biz_category);
        	$("#file_nm").val(responseData.file_nm);
        	$("#addr").val("("+responseData.post_code+") "+responseData.biz_addr_1+" "+responseData.biz_addr_2);
        	$("#contact_tel").val(responseData.contact_tel);
        	$("#tax_email").val(responseData.tax_email);
        	$("#user_no").val(user_no);
        }
    });
});

$("#info_change_cancel").bind("click",function(){
	location.href="/main"
});

function password_modal_initialize(){
	$('#old_passwd').val("");
	$('#new_passwd').val("");
	$('#new_passwd_check').val("");
}

$("#btn_passwd_change").bind("click",function(){
	if(emptyCheck("old_passwd")&&emptyCheck("new_passwd")&&emptyCheck("new_passwd_check")){
	    $.ajax({
	        url : "/passwd/change",
	        type: "put",
    		data : JSON.stringify({ 
    			"old_passwd" : $("#old_passwd").val(),
       	     	"new_passwd" : $("#new_passwd").val()
    		}),
	     	contentType: "application/json",		
	        success : function(responseData){	        	
	        	if(responseData==0){
	        		alert("기존 비밀번호를 확인해주세요.");
	        	}else{
	        		alert("비밀번호 변경이 완료되었습니다.");
	        		$("#passwd_change_close").click();
	        		password_modal_initialize();
	        	}
	        }
	    });
	}else{
		alert("값을 채워주세요.");
	}
});


function loadMainShipping(){
	$.ajax({
        url : "/shiptos/main",
        type: "get",
        success : function(responseData){
        	var result = responseData;
        	loadShippingdata(result);
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



$("#shipto_change").bind("click",function(){
	if(emptyCheck("post_code")&&emptyCheck("shipto_addr_1")&&emptyCheck("shipto_addr_2")&&emptyCheck("shipto_nm")&&emptyCheck("receiver_nm")&&emptyCheck("receiver_tel")){
	    $.ajax({
	        url : "/shiptos",
	        type: "put",
	        data : JSON.stringify({ 
	        		 "receiver_nm" : $("#receiver_nm").val(),
	        	     "receiver_tel" : $("#receiver_tel").val(),
	        	     "shipto_nm" : $("#shipto_nm").val(),
	        	     "post_code" : $("#post_code").val(),
	        	     "shipto_addr1" : $("#shipto_addr1").val(),
	        	     "shipto_addr2" : $("#shipto_addr2").val(),
	        	     "shipto_no" : $("#shipto_no").val(),
	        	     "main_shipping" : "Y"
	        		}),
	    	contentType: "application/json",
	        success : function(responseData){
	        	if(responseData.result==0){
	        		alert("배송지 변경에 실패했습니다.");
	        	}else{
	        		alert("배송지 정보가 업데이트 되었습니다.");
	        		$("#addr").val("("+$("#post_code").val()+") "+$("#shipto_addr1").val()+" "+$("#shipto_addr2").val());
	        		$("#shipto_change_close").click();
	        	}
	        }
	    });
	}else{
		alert("값을 채워주세요.");
	}
});
