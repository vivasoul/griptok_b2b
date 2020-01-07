$(document).ready(function() {
	if(registered=="failed"){
		alert("회원가입에 실패하였습니다.");
	}
});
var validation_check = {
	id_checked : false,
	biz_reg_number_checked: false,
	company_nm_checked: false,
	term_checked: false
}

// user_id_check button bind
$("#id_check").bind("click", function() {
	if (emptyCheck("user_id")) {
		$.ajax({
			url : "/sign_up/check/"+$("#user_id").val(),
			type : "get",
			success : function(responseData) {
				if (responseData == 0) {
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

$("#sign_up_cancel").bind("click", function(){
	location.href="/main";
})

// company_nm_check button bind
$("#company_nm_check").bind("click", function() {
	if (emptyCheck("company_nm")) {
		$.ajax({
			url : "/sign_up/check/"+$("#company_nm").val(),
			type : "get",
			success : function(responseData) {
				if (responseData == 0) {
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
			url : "/sign_up/check/"+$("#biz_reg_number").val(),
			type : "get",
			success : function(responseData) {
				if (responseData == 0) {
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


$(function() {
	bs_input_file();
	validationInitialize();
	validateAll("#sign_up_form");
})