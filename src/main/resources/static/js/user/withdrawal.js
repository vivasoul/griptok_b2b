function radioCheck(){
	var radio_val = $(":input:radio[name=withdraw_reason]:checked").val();
	console.log(radio_val);
	if(radio_val=="E"){
		$("#remark").removeAttr("readonly");
	}else{
        $("#remark").attr("readonly",true);
	}
}

$(document).ready(function() {
	$.ajax({
        url : "/withdraw/load",
        type: "get",
        success : function(responseData){
        	$("#user_id").html(responseData);
        }
    });
});

//user_id_check button bind
$("#withdraw").bind("click",function(){
	
	
	
	var user_id = $('#user_id').html();
	var radio_val = $(":input:radio[name=withdraw_reason]:checked").val();
	var remark = $("#remark").val();
	
	if(radio_val==undefined){
		alert("탈퇴사유를 선택해주세요");
		return;
	}
	
	$.ajax({
        url : "/passwd/check",
        type: "post",
        data : JSON.stringify({  
        		 "passwd" : $("#passwd").val()
               }),
        contentType: "application/json",
        success : function(responseData){
        	if(responseData==0){
        		alert("비밀번호가 올바르지 않습니다.");
        	}else{
	        	$.ajax({
	    	        url : "/withdraw/send",
	    	        type: "post",
	    	        data : JSON.stringify({ 
	    	        	"user_id" : user_id,
	    	        	"code" : radio_val,
	    	        	"remark" : remark
	    	        }),
	    	        contentType: "application/json",
	    	        success : function(responseData){
	    	        	if(responseData==0){
	    	        		alert("탈퇴 중 오류가 발생하였습니다. 관리자에게 문의하세요.")
	    	        	}else{
	    	        		alert("탈퇴가 완료되었습니다.")
	    	        		location.href="/login";
	    	        	}
	    	        }
	    	    });
        	}
        }
    });
	
	
	    
});


