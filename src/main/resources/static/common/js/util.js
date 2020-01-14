// ajax empty check
function emptyCheck(input_id){
	var input_val = $('#'+input_id).val();
	if(input_val==""){
		return false;
	}else{
		return true;
	}
}


function autoHypenPhone(_this){
  var str = _this.value;
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
  _this.value=tmp;
}

function autoHypenBizNum(_this){
  var str = _this.value;
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
  _this.value=tmp;
}


function openDaumZipAddress(post_code, addr1, addr2, validation_needed) {
	new daum.Postcode({

		oncomplete:function(data) {
			jQuery('#'+post_code).val(data.postcode1+"-"+data.postcode2);

			if(data.postcode1==""){
				jQuery('#'+post_code).val(data.zonecode);
			}
			
			jQuery('#'+addr1).val(data.address);

			jQuery('#'+addr2).focus();
			
			if(validation_needed) validation_check.addr_checked=true;

		}

	}).open();

}


validateAll = function($param_f){
	
	const $f = $param_f instanceof jQuery ? $param_f : $($param_f);
	$f.find( 'input').each(function(){
		var reg_id = $(this).attr('reg_id');
	    var keyup = $(this).attr('data-keyup');
	    var regex = $(this).attr('data-regex');
	    
	    if(keyup==="P"){
			var parent = $(this).attr('parent_id');
        	$(this).keyup(function() {
  	          validatePassword($('#'+parent),this);
  	        });
  	    }else if(keyup==="B"){
  	    	$(this).keyup(function() {
  	    		autoHypenBizNum(this);
	        });
  	    }else if(keyup==="T"){
  	    	$(this).keyup(function() {
  	    		autoHypenPhone(this);
	        });
  	    }
	    
		if(regex==="T"){
        	$(this).keyup(function() {
        		validateRegex(reg_id,this);
  	        });
  	    }

		
    });
}


function validatePassword(_p, _this) {

	if (_p.val() != _this.value) {
		_this.setCustomValidity("비밀번호가 다릅니다.");
		_this.reportValidity();
	} else {
		_this.setCustomValidity('');
	}
}

function validateRegex(regex_id, _this) {
	var regex_type = /(?=.{6,})/;
	var regex_msg = "비밀번호는 6~15자 이내로 입력해야 합니다.";

	if (regex_id == "passwd"||regex_id=="new_passwd") {
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

function listMaker(key, indices){
	var list = [];
	indices.forEach(function(val){
		var obj = {};
		obj[key] = val;
		list.push(obj);
	});
	
	return list;
}