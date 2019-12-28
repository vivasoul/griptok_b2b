var validation_check = {
	id_checked : false,
	biz_reg_number_checked: false,
	company_nm_checked: false,
	term_checked: false
}

//validation checker
const validation = [{
	id : "passwd",
	reg_id : "passwd",
	focus : validateRegex,
	change : validatePassword
}, {
	id : "passwd_check",
	keyup : validatePassword
}, {
	id : "contact_tel",
	reg_id : "tel",
	focus : validateRegex,
	keyup : autoHypenPhone
}, {
	id : "user_id",
	reg_id : "id",
	focus : validateRegex
}, {
	id : "company_nm",
	reg_id : "company_nm"
	
}, {
	id : "biz_reg_number",
	reg_id : "biz_reg_number",
	focus : validateRegex,
	keyup : autoHypenBizNum
}, {
	id : "manager_email",
	reg_id : "email",
	focus : validateRegex
}, {
	id : "manager_tel",
	reg_id : "tel",
	focus : validateRegex,
	keyup : autoHypenPhone
}, {
	id : "tax_email",
	reg_id : "email",
	focus : validateRegex
}]


function bs_input_file() {
	$(".input-file")
			.before(
					function() {
						if (!$(this).prev().hasClass('input-ghost')) {
							var element = $("<input type='file' name='real_file' id='real_file' class='input-ghost' style='visibility:hidden; height:0'>");
							element.attr("name", $(this).attr("name"));
							element.change(function() {
								element.next(element).find('input').val(
										(element.val()).split('\\').pop());
								validation_check.file_checked=true;
							});
							$(this).find("button.btn-choose").click(function() {
								element.click();
							});
							$(this).find("button.btn-reset").click(
									function() {
										element.val(null);
										$(this).parents(".input-file").find(
												'input').val('');
									});
							$(this).find('input').css("cursor", "pointer");
							$(this).find('input').mousedown(function() {
								$(this).parents('.input-file').prev().click();
								return false;
							});
							return element;
						}
					});
}


// user_id_check button bind
$("#id_check").bind("click", function() {
	if (emptyCheck("user_id")) {
		$.ajax({
			url : "/sign_up/check/id",
			type : "post",
			data : {
				"user_id" : $("#user_id").val()
			},
			success : function(responseData) {
				if (responseData.result == 0) {
					alert("사용가능한 Id입니다.");
					validation_check.id_checked = true;
				} else {
					alert("사용중인 Id입니다. 다른 Id를 사용해주세요.")
				}
			}
		});
	} else {
		alert("값을 채워주세요.");
	}
});

// company_nm_check button bind
$("#company_nm_check").bind("click", function() {
	if (emptyCheck("company_nm")) {
		$.ajax({
			url : "/sign_up/check/company_nm",
			type : "post",
			data : {
				"company_nm" : $("#company_nm").val()
			},
			success : function(responseData) {
				if (responseData.result == 0) {
					validation_check.company_nm_checked = true;
					alert("사용가능한 회사명입니다.");
				} else {
					alert("사용중인 회사명입니다. 다른 회사명을 사용해주세요.")
				}
			}
		});
	} else {
		alert("값을 채워주세요.");
	}
});

// biz_reg_number_check button bind
$("#biz_reg_number_check").bind("click", function() {
	if (emptyCheck("biz_reg_number")) {
		$.ajax({
			url : "/sign_up/check/biz_reg_number",
			type : "post",
			data : {
				"biz_reg_number" : $("#biz_reg_number").val()
			},
			success : function(responseData) {
				if (responseData.result == 0) {
					alert("사용가능한 사업자번호입니다.");
					validation_check.biz_reg_number_checked = true;
				} else {
					alert("사용중인 사업자번호입니다. 다른 사업자번호를 사용해주세요.")
				}
			}
		});
	} else {
		alert("값을 채워주세요");
	}
});

function validatePassword() {
	var password = document.getElementById("passwd");
	var confirm_password = document.getElementById("passwd_check");

	if (password.value.trim() == "") {
		password.setCustomValidity("Passwords must not be empty");
		password.reportValidity();
	} else if (password.value != confirm_password.value) {
		password_match = false;
		confirm_password.setCustomValidity("비밀번호가 다릅니다.");
		confirm_password.reportValidity();
	} else {
		password_match = true;
		confirm_password.setCustomValidity('');
	}
}

function validateRegex(regex_id, _this) {
	var regex_type = /(?=.{6,})/;
	var regex_msg = "비밀번호는 6~15자 이내로 입력해야 합니다.";

	if (regex_id == "passwd") {
		regex_type = /(?=.{6,})/;
		regex_msg = "비밀번호는 6~15자 이내로 입력해야 합니다.";
	} else if (regex_id == "id") {
		regex_type = /([a-zA-Z0-9].{1,})/;
		regex_msg = "아이디는 2자리 이상의 영문 및 숫자의 조합만 가능합니다.";
	} else if (regex_id == "tel") {
		regex_type = /^[0-9]{3}[-]+[0-9]{4}[-]+[0-9]{4}$/;
		regex_msg = "전화번호가 올바르지 않습니다.";
	} else if (regex_id == "email") {
		regex_type = /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
		regex_msg = "이메일 형식을 다시 한번 확인해주세요.";
	} else if (regex_id == "biz_reg_number") {
		regex_type = /^[0-9]{3}[-]+[0-9]{2}[-]+[0-9]{5}$/;
		regex_msg = "사업자등록번호를 확인해주세요.";
	}

	if (!regex_type.test(_this.value)) {
		_this.setCustomValidity(regex_msg);
		_this.reportValidity();
	} else {
		_this.setCustomValidity('');
	}
}



function checkInput(input_id) {
	$("#" + input_id).click();
}
// check_box
function checkAll() {
	if ($("#termsService").is(':checked')) {
		validation_check.term_checked = true;
		$("#termsService2").prop("checked", true);
		$("#termsService3").prop("checked", true);
	} else {
		validation_check.term_checked = false;
		$("#termsService2").prop("checked", false);
		$("#termsService3").prop("checked", false);
	}
}

function checkEach() {
	if ($("#termsService2").is(':checked')
			&& $("#termsService3").is(':checked')) {
		$("#termsService").prop("checked", true);
		validation_check.term_checked = true;
	} else {
		$("#termsService").prop("checked", false);
		validation_check.term_checked = false;
	}
}

function validationInitialize(){
	validation_check = {
		id_checked : false,
		biz_reg_number_checked : false,
		company_nm_checked : false,
		term_checked : false,
		file_checked : false,
		addr_checked : false
	}
}


$(function() {
	bs_input_file();
	validationInitialize();
	validation.forEach(function(item, index){
	    if(item.focus){
	        $('#'+item.id).focusout(function() {
	          item.focus(item.reg_id,this);
	        });
	    }
	    if(item.keyup){
	    	$('#'+item.id).keyup(function() {
		      item.keyup(this);
		    });
	    }
	    if(item.change){
	    	$('#'+item.id).change(function() {
	  	      item.change(this);
	  	    });
	    }
	});
	
	$('#sign_up_form').submit(function() {
		if (!validation_check.id_checked) {
			alert("아이디 중복을 체크해주세요.");
			return false;
		} else if (!validation_check.term_checked) {
			alert("이용 약관에 동의해주세요.");
			return false;
		} else if (!validation_check.company_nm_checked) {
			alert("회사 이름 중복을 체크해주세요.");
			return false;
		} else if (!validation_check.biz_reg_number_checked) {
			alert("사업자 등록번호 중복을 체크해주세요.");
			return false;
		} else if (!validation_check.file_checked) {
			alert("사업자등록증을 업로드 해주세요.");
			return false;
		} else if (!validation_check.addr_checked) {
			alert("주소를 입력해주세요.");
			return false;
		} else {
			return true;
		}
	});
})