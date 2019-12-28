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