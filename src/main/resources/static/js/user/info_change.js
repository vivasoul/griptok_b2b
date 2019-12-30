function bs_input_file() {
	$(".input-file").before(
		function() {
			if ( ! $(this).prev().hasClass('input-ghost') ) {
				var element = $("<input type='file' name='real_file' id='real_file' class='input-ghost' style='visibility:hidden; height:0'>");
				element.attr("name",$(this).attr("name"));
				element.change(function(){
					element.next(element).find('input').val((element.val()).split('\\').pop());
				});
				$(this).find("button.btn-choose").click(function(){
					element.click();
				});
				$(this).find("button.btn-reset").click(function(){
					element.val(null);
					$(this).parents(".input-file").find('input').val('');
				});
				$(this).find('input').css("cursor","pointer");
				$(this).find('input').mousedown(function() {
					$(this).parents('.input-file').prev().click();
					return false;
				});
				return element;
			}
		}
	);
}
$(function() {
	bs_input_file();
})



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

//company_nm_check button bind
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



var password = document.getElementById("new_passwd");
var confirm_password = document.getElementById("new_passwd_check");
var contact_tel = document.getElementById("contact_tel");
var user_id = document.getElementById("user_id");
var company_nm = document.getElementById("company_nm");
var biz_reg_number = document.getElementById("biz_reg_number");
var manager_email = document.getElementById("manager_email");
var manager_tel = document.getElementById("manager_tel");
var tax_email = document.getElementById("tax_email");
var receiver_tel = document.getElementById("receiver_tel");

function validatePassword()
{
	if(password.value.trim() == "")
	{
	    password.setCustomValidity("Passwords must not be empty");
	    password.reportValidity();
	} 
    else if(password.value != confirm_password.value)
    {
    	password_match = false;
        confirm_password.setCustomValidity("비밀번호가 다릅니다.");
        confirm_password.reportValidity();
    }  else
    {
       password_match = true;	
 	   confirm_password.setCustomValidity('');
    }
}




function validateRegex(){
	var regex_id = this.id;
	var regex_type = /(?=.{6,})/;
	var regex_msg = "비밀번호는 6~15자 이내로 입력해야 합니다.";
	
	if(regex_id=="passwd"){
		regex_type = /(?=.{6,})/;
		regex_msg = "비밀번호는 6~15자 이내로 입력해야 합니다."; 
	}else if(regex_id=="user_id"){
		regex_type = /([a-zA-Z0-9].{1,})/;
		regex_msg = "아이디는 2자리 이상의 영문 및 숫자의 조합만 가능합니다."; 
	}else if(regex_id=="contact_tel"||regex_id=="manager_tel"||regex_id=="receiver_tel"){
		regex_type = /^[0-9]{3}[-]+[0-9]{4}[-]+[0-9]{4}$/;
		regex_msg = "전화번호가 올바르지 않습니다.";
	}else if(regex_id=="manager_email"||regex_id=="tax_email"){
		regex_type = /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
		regex_msg = "이메일 형식을 다시 한번 확인해주세요.";
	}else if(regex_id=="biz_reg_number"){
		regex_type = /^[0-9]{3}[-]+[0-9]{2}[-]+[0-9]{5}$/;
		regex_msg = "사업자등록번호를 확인해주세요.";
	}
		
	if(!regex_type.test(this.value)){
		this.setCustomValidity(regex_msg);
		this.reportValidity();
	}else{
		this.setCustomValidity('');
	}
}




// ajax empty check
function emptyCheck(input_id){
	var input_val = jQuery('#'+input_id).val();
	if(input_val==""){
		return false;
	}else{
		return true;
	}
}

password.onchange = validatePassword;
password.onfocusout = validateRegex;
user_id.onfocusout = validateRegex;
contact_tel.onfocusout = validateRegex;
biz_reg_number.onfocusout = validateRegex;
manager_email.onfocusout = validateRegex;
manager_tel.onfocusout = validateRegex;
tax_email.onfocusout = validateRegex;
confirm_password.onkeyup = validatePassword;
receiver_tel.onfocusout = validateRegex;

contact_tel.onkeyup = autoHypenPhone;
manager_tel.onkeyup = autoHypenPhone;
receiver_tel.onkeyup = autoHypenPhone;
biz_reg_number.onkeyup = autoHypenBizNum;

// validation checker
var password_match = false;
var id_checked = false;
var biz_reg_number_checked = false;
var company_nm_checked = false;
var term_checked = false;


// check_box

function checkAll(){
    if( $("#termsService").is(':checked') ){
      term_checked = true;
      $("#termsService2").prop("checked", true);
      $("#termsService3").prop("checked", true);
    }else{
      term_checked = false;	
      $("#termsService2").prop("checked", false);
      $("#termsService3").prop("checked", false);
    }
}

function checkEach(){
	
	if($("#termsService2").is(':checked')&&$("#termsService3").is(':checked')){
		$("#termsService").prop("checked", true);
		term_checked = true;	
	}else{
		$("#termsService").prop("checked", false);
		term_checked = false;
	}
}

function checkInput(input_id){
	$("#"+input_id).click();
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

function autoHypenBizNum(){
  var str = this.value;
  str = str.replace(/[^0-9]/g, '');
  var tmp = '';
  if( str.length < 4){
	  tmp = str;
  }else if(str.length < 6){
    tmp += str.substr(0, 3);
    tmp += '-';
    tmp += str.substr(3);
  }else if(str.length < 11){
    tmp += str.substr(0, 3);
    tmp += '-';
    tmp += str.substr(3, 2);
    tmp += '-';
    tmp += str.substr(5);
  }else{
    tmp += str.substr(0, 3);
    tmp += '-';
    tmp += str.substr(3, 2);
    tmp += '-';
    tmp += str.substr(5);
  }
  this.value=tmp;
}

$('#sign_up_form').submit(function() {
	if(!id_checked){
		alert("아이디 중복을 체크해주세요.");
		return false;
	}else if(!term_checked){
		alert("이용 약관에 동의해주세요.");
		return false;
	}else if(!company_nm_checked){
		alert("회사 이름 중복을 체크해주세요.");
		return false;
	}else if(!biz_reg_number_checked){
		alert("사업자 등록번호 중복을 체크해주세요.");
		return false;
	}else{
		return true; 
	}
});