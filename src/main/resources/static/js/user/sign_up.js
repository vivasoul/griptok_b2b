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


// user_id_check button bind
$("#id_check").bind("click",function(){
    $.ajax({
        url : "/sign_up/check/id",
        type: "post",
        data : { "user_id" : $("#user_id").val() },
        success : function(responseData){
        	if(responseData.result==0){
        		alert("사용가능한 Id입니다.");
        		id_checked = true;
        	}else{
        		alert("사용중인 Id입니다. 다른 Id를 사용해주세요.")
        	}
        }
    });
});


//company_nm_check button bind
$("#company_nm_check").bind("click",function(){
    $.ajax({
        url : "/sign_up/check/company_nm",
        type: "post",
        data : { "company_nm" : $("#company_nm").val() },
        success : function(responseData){
        	if(responseData.result==0){
        		company_checked=true;
        		alert("사용가능한 회사명입니다.");
        	}else{
        		alert("사용중인 회사명입니다. 다른 회사명을 사용해주세요.")
        	}
        }
    });
});

//biz_reg_number_check button bind
$("#biz_reg_number_check").bind("click",function(){
    $.ajax({
        url : "/sign_up/check/biz_reg_number",
        type: "post",
        data : { "biz_reg_number" : $("#biz_reg_number").val() },
        success : function(responseData){
        	if(responseData.result==0){
        		alert("사용가능한 사업자번호입니다.");
        		biz_reg_number_checked=true;
        	}else{
        		alert("사용중인 사업자번호입니다. 다른 사업자번호를 사용해주세요.")
        	}
        }
    });
});

jQuery.fn.serializeObject = function() {
    var obj = null;
    try {
        if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
            var arr = this.serializeArray();
            if (arr) {
                obj = {};
                jQuery.each(arr, function() {
                    obj[this.name] = this.value;
                });
            }//if ( arr ) {
        }
    } catch (e) {
        alert(e.message);
    } finally {
    }
    return obj;
};

function openDaumZipAddress() {

	new daum.Postcode({

		oncomplete:function(data) {

			jQuery("#postcode1").val(data.postcode1+"-"+data.postcode2);

			jQuery("#address").val(data.address);

			jQuery("#address_etc").focus();


		}

	}).open();

}
var password = document.getElementById("passwd");
var confirm_password = document.getElementById("passwd_check");

function validatePassword()
{
	if(password.value.trim() == "")
	{
	    password.setCustomValidity("Passwords must not be empty");
	    password.reportValidity();
	} 
    else if(password.value != confirm_password.value)
    {
        confirm_password.setCustomValidity("비밀번호가 다릅니다.");
        confirm_password.reportValidity();
    }  else
    {
       password_match = true;	
 	   confirm_password.setCustomValidity('');
    }
}

function validateRegextPassword(){
	if(!/[0-9a-zA-Z]{6,15}$/.test(password.value)){
		password.setCustomValidity("비밀번호는 6~15자 이내로 입력해야 합니다.");
		password.reportValidity();
	}else{
		password.setCustomValidity('');
	}
}

function emptyCheck(){
	
}

password.onchange = validatePassword;
password.onfocusout = validateRegextPassword;
confirm_password.onkeyup = validatePassword;


// validation checker
var password_match = false;
var id_checked = false;
var company_nm_checked = false;
var biz_reg_number_checked = false;
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
	console.log("aa");
	if($("#termsService2").is(':checked')&&$("#termsService3").is(':checked')){
		$("#termsService").prop("checked", true);
		term_checked = true;	
	}else{
		$("#termsService").prop("checked", false);
		term_checked = false;
	}
}

function checkInput(input_id){
	console.log("bb");
	$("#"+input_id).click();
}