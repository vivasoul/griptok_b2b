<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="./lib/js/jquery.min.js"></script>
<script src="./lib/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="./lib/css/register.css">
<link rel="stylesheet" href="./lib/bootstrap/css/bootstrap.min.css">

<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- <link rel="stylesheet" href="/css/common/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="/css/common/font-awesome.min.css"> -->
<!-- <link rel="stylesheet" href="/css/common/googleapi.css"> -->
</head>
<body>

 <div class="custom-container container">    
		<div class="mainbox col-sm-10 col-sm-offset-2" >
			<img class="login_top" src="./lib/img/griptok.png" onclick="location.href='/login';"/>
			<div class="login_top">
				<h2>그립톡 도매전용 쇼핑몰입니다.</h2>
				<h4>본 사이트는 사업자만 이용이 가능한 도매 사이트 입니다.<br>가입 승인 완료 후 이용이 가능 합니다.</h4>
			</div>
		</div>

        <div id="loginbox" style="margin-top:50px;" class="mainbox col-sm-12">     
            <div class="panel panel-info" >
                    <div style="padding-top:30px" class="panel-body" >
                    	
                    	
		<form id="sign_up_form" method="post" action="/sign_up/sign_up" enctype="multipart/form-data">                    	
      	   <div class="row" >
            <div class="col-sm-4">
              	<div class="col-sm-12 input-group custom">
			    <input name="user_id" id="user_id" type="text" class="form-control input-lg" placeholder="아이디" required>
			    <span class="input-group-btn" style="width:0;">
			        <button id="id_check" class="btn-primary btn-lg" type="button">중복확인</button>
			    </span>
			   </div>
               <div class="col-sm-12 input-group custom"><input id="passwd" name="passwd" type="password" placeholder="비밀번호"  class="form-control input-lg" required></div>
               <div class="col-sm-12 input-group custom"><input id="passwd_check" name="passwd_check" type="password" placeholder="비밀번호 확인"  class="form-control input-lg" required></div>
               <div class="col-sm-12 input-group custom"><input id="contact_tel" name="contact_tel" type="text" placeholder="전화번호" class="form-control input-lg" required></div>
            </div>
            <div class="col-sm-8">
            	<span class="input_chk">
					<input type="checkbox" id="termsService" name="termsService" class="chk" >
					<label for="termsService">전체 동의<span class="terms_necessary">(필수)</span></label>
				</span>
            	<div class="col-sm-12" style="border:1px solid #dadada">
	            <div class="col-sm-6 custom" >
	            <span class="input_chk">
					<input type="checkbox" id="termsService2" name="termsService2" class="chk">
					<label for="termsService">이용약관 동의<span class="terms_necessary">(필수)</span></label>
				</span>
	              <div class="col-sm-12" style="background-color:#f5f6f7;overflow-y:scroll;">	
		            <p> 
		              yohan394yohan394yohan394yohan394
		              yohan394yohan394yohan394yohan394
		              </p>
	              </div>
	            </div>
	            <div class="col-sm-6 custom">
	            <span class="input_chk">
					<input type="checkbox" id="termsService3" name="termsService3" class="chk">
					<label for="termsService">개인정보 수집 및 이용 동의<span class="terms_necessary">(필수)</span></label>
				</span>
				<div class="col-sm-12" style="background-color:#f5f6f7;overflow-y:scroll;">	
		            <p> 
		              yohan394yohan394yohan394yohan394
		              yohan394yohan394yohan394yohan394
		              </p>
	              </div>
	            </div>
	            </div>
           	</div>
           </div>
           
           <hr style="border: 1px dashed black;" />
           <div class="row">
            <div class="col-sm-4 ">
              <div class="col-sm-12 input-group custom">
              	<input type="text" id="company_nm" name="company_nm" placeholder="회사명" class="form-control input-lg" required>
              	<span class="input-group-btn" style="width:0;">
			        <button id="company_nm_check" class="btn-primary btn-lg text-sm" type="button">중복확인</button>
			    </span>
              </div>
              <div class="col-sm-12 input-group custom">
              	<input type="number" id="biz_reg_number" name="biz_reg_number" placeholder="사업자등록번호"  class="form-control input-lg" required>
              	<span class="input-group-btn" style="width:0;">
			        <button id="biz_reg_number_check" class="btn-primary btn-lg text-sm" type="button">중복확인</button>
			    </span>
              </div>
              <div class="col-sm-12 input-group custom">
              	<div class="input-group input-file">
		    		<input id="file_nm" name="file_nm" type="text" class="form-control" placeholder='Choose a file...' required/>			
		            <span class="input-group-btn">
		        		<button class="btn btn-default btn-choose" type="button">Choose</button>
		    		</span>
				</div>
              </div>
              <div class="col-sm-12 input-group custom"><input type="text" id="ceo_nm" name="ceo_nm" placeholder="대표자명"  class="form-control input-lg"></div>
            </div>
            <div class="col-sm-4">
              <div class="col-sm-12 input-group custom"><input type="text" id="manger_nm" name="manager_nm" placeholder="담당자명" class="form-control input-lg" required></div>
              <div class="col-sm-12 input-group custom"><input type="text" id="manager_tel" name="manager_tel" placeholder="담당자 휴대전화"  class="form-control input-lg" required></div>
              <div class="col-sm-12 input-group custom"><input type="text" id="manager_email" name="manager_email" placeholder="담당자 이메일" class="form-control input-lg" required></div>
            </div>
            <div class="col-sm-4">
	          <div class="col-sm-12 input-group custom">
	          		<input type="text" id="tax_email" name="tax_email" placeholder="세금계산서 발행 이메일" class="form-control input-lg" required>
	          </div>
              <div class="col-sm-12 input-group custom">
          		<input type="text" id="postcode1" placeholder="우편번호"  class="form-control input-lg">
	        	<span class="input-group-btn" style="width:0;">
		        	<button onclick="openDaumZipAddress()" class="btn-primary btn-lg text-sm" type="button">주소찾기</button>
			    </span>
	          </div>
	          	
              <div class="col-sm-12 input-group custom"><input type="text" id="address" name="biz_addr" placeholder="주소" class="form-control input-lg" required></div>
              <div class="col-sm-12 input-group custom"><input type="text" id="address_etc" name="biz_addr_etc" placeholder="세부주소" class="form-control input-lg" required></div>
            </div>
           
           
           </div>
           <div class="row">
           		<div class="col-sm-12 submit">
           			 <button class="btn-warning btn-lg" type="button">취소</button>
           			 <button id="sign_up" class="btn-primary btn-lg" type="submit">가입하기</button>
           		</div>
           </div>
          	</form>
           </div>  
          </div>


</div>
<!-- div container -->
</div>

  
<script>
// Get the modal
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
        	}else{
        		alert("사용중인 사업자번호입니다. 다른 사업자번호를 사용해주세요.")
        	}
        }
    });
});

// $("#sign_up").bind("click",function(){
//     $.ajax({
//         url : "/sign_up/sign_up",
//         type: "post",
//         data : JSON.stringify(jQuery('#sign_up_form').serializeObject()),
//         contentType: "application/json",
//         success : function(responseData){
//         	console.log(responseData);
//         }
//     });
// });

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

// 			jQuery("#zonecode").val(data.zonecode);

			jQuery("#address").val(data.address);

			jQuery("#address_etc").focus();


		}

	}).open();

}





</script>


</body>
</html>