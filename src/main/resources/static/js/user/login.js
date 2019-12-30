// 모달 불러오기
var modal = document.getElementById('id_finder');
var modal2 = document.getElementById('pwd_finder');

function openFinder(evt, method, type) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName(type+"_tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName(type+"_tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(method).style.display = "block";
  evt.currentTarget.className += " active";
}


// 모달 열기
function openModal(type){
	document.getElementById(type+'_finder').style.display='block'
	document.getElementById(type+'_finder_initial').click();
}	

// 빈 값 여부 체커
function form_checker(_vals, highlight_needed){
	var return_val = true;
	if(_vals.length>0){
		_vals.forEach(function(item, index){
			if($("#"+item).val()==""){
				if(highlight_needed) $("#"+item).css("border-color","red");
				return_val = false;
			}
		})
	}
	return return_val;
}

$(document).ready(function(){
	// 로그인 버튼 클릭
	$("#btn_login").bind("click",function(){
		var checker_vals = ["login_user_id", "login_passwd"];
		if(form_checker(checker_vals)){
		    $.ajax({
		        url : "/login/connect",
		        type: "post",
		        data : JSON.stringify({ 
		        			"user_id" : $("#login_user_id").val(),
		        			"passwd" : $("#login_passwd").val()
		        	   }),
		    	contentType: "application/json",
		        success : function(responseData){
		        	console.log(responseData);
		        	var result = responseData.result;
		        	var aprv_status = responseData.aprv_status;
		        	if(responseData.result==0){
		        		alert("아이디 또는 비밀번호가 올바르지 않습니다.")
		        	}else{
		        		if(aprv_status=="A"){
			        		location.href="/main";
		        		}else if(aprv_status=="W"){
		        			alert("탈퇴한 아이디입니다.");
		        		}else{
		        			alert("승인대기중입니다.");
		        		}
		        	}
		        }
		    });
		}else{
			alert("빈칸을 다 채워주세요.");
		}
	});
	
	// 핸드폰 번호를 통한 아이디 찾기
	$("#id_cell_finder").bind("click",function(){
		var checker_vals = ["id_cell_ceo_nm", "id_cell_contact_tel1","id_cell_contact_tel2","id_cell_contact_tel3"];
		if(form_checker(checker_vals)){
		    $.ajax({
		        url : "/login/find/id",
		        type: "post",
		        data : JSON.stringify({ 
		        			"ceo_nm" : $("#id_cell_ceo_nm").val(),
		        			"contact_tel" : $("#id_cell_contact_tel1").val()+"-"+$("#id_cell_contact_tel2").val()+"-"+$("#id_cell_contact_tel3").val()
		        	   }),
		     	contentType: "application/json",
		        success : function(responseData){
		        	var user_id = responseData;
		        	if(user_id==null){
		        		alert("해당 정보로 등록된 아이디가 존재하지 않습니다.");
		        	}else{
		        		alert("회원님의 아이디는 " + user_id + "입니다.");
		        		$('#id_finder_close').click();
		        	}
		        }
		    });
		}else{
			alert("빈 칸을 다 채워주세요.");
		}
	});

	// 이메일을 통한 아이디 찾기
	$("#id_email_finder").bind("click",function(){
		var checker_vals = ["id_email_ceo_nm", "id_email_email"];
		if(form_checker(checker_vals)){
		    $.ajax({
		        url : "/login/find/id",
		        type: "post",
		        data : JSON.stringify({ 
		        			"ceo_nm" : $("#id_email_ceo_nm").val(),
		        			"tax_email" : $("#id_email_email").val()
		        	   }),
		   	    contentType: "application/json",
		        success : function(responseData){
		        	console.log(responseData);
		        	var user_id = responseData;
		        	if(user_id==null){
		        		alert("해당 정보로 등록된 아이디가 존재하지 않습니다.");
		        	}else{
		        		alert("회원님의 아이디는 " + user_id + "입니다.");
		        		$('#id_finder_close').click();
		        	}
		        }
		    });
		}else{
			alert("빈 칸을 다 채워주세요");
		}   
		    
	});

	// 핸드폰번호를 통한 비밀번호 찾기
	$("#passwd_cell_finder").bind("click",function(){
	    $.ajax({
	        url : "/login/find/passwd",
	        type: "post",
	        data : JSON.stringify({ 
	        			"user_id" : $("#passwd_cell_user_id").val(),
	        			"ceo_nm" : $("#passwd_cell_ceo_nm").val(),
	        			"contact_tel" : $("#passwd_cell_contact_tel1").val()+"-"+$("#passwd_cell_contact_tel2").val()+"-"+$("#passwd_cell_contact_tel3").val()
	        	   }),
	     	contentType: "application/json",
	        success : function(responseData){
	        	console.log(responseData);
	        	var result = responseData;
	        	if(result==null){
	        		alert("해당 정보로 등록된 아이디가 존재하지 않습니다.");
	        	}else{
	        		if(result==-1){
	        			alert("비밀번호 전송에 실패하였습니다.");
	        		}else if(result==-2){
	        			alert("해당 정보로 등록된 사용자가 없습니다.");
	        		}else if(result==1){
	        			alert("회원님의 이메일로 임시 비밀번호가 발송되었습니다.");
	        			$('#passwd_finder_close').click()
	        		}
	        		
	        	}
	        }
	    });
	});

	// 이메일을 통한 비밀번호 찾기
	$("#passwd_email_finder").bind("click",function(){
	    $.ajax({
	        url : "/login/find/passwd",
	        type: "post",
	        data : JSON.stringify({ 
	        			"user_id" : $("#passwd_email_user_id").val(),
	        			"ceo_nm" : $("#passwd_email_ceo_nm").val(),
	        			"tax_email" : $("#passwd_email_email").val()
	        	   }),
	   	    contentType: "application/json",
	        success : function(responseData){
	        	var result = responseData;
	        	if(result==null){
	        		alert("해당 정보로 등록된 아이디가 존재하지 않습니다.");
	        	}else{
	        		if(result==-1){
	        			alert("비밀번호 전송에 실패하였습니다.");
	        		}else if(result==-2){
	        			alert("해당 정보로 등록된 사용자가 없습니다.");
	        		}else if(result==1){
	        			alert("회원님의 이메일로 임시 비밀번호가 발송되었습니다.");
	        			$('#passwd_finder_close').click();
	        		}
	        		
	        	}
	        }
	    });
	});

	// 비밀번호 입력 후 엔터 시 로그인 지원
	$("#login_passwd").keypress(function (e) {
	    if (e.which == 13){
	    	$("#btn_login").click();
	    }
	});
	
	// 모달 종료
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }else if(event.target == modal2){
	    	modal2.style.display = "none";
	    }
	}

});