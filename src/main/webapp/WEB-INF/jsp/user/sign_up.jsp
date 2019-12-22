<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="./lib/js/jquery.min.js"></script>
<script src="./lib/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./lib/css/register.css">
<link rel="stylesheet" href="./lib/bootstrap/css/bootstrap.min.css">
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- <link rel="stylesheet" href="/css/common/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="/css/common/font-awesome.min.css"> -->
<!-- <link rel="stylesheet" href="/css/common/googleapi.css"> -->
</head>
<body>

 <div class="custom-container container col-sm-offset-2">    
		<div class="mainbox col-sm-10" >
			<img class="login_top" src="./lib/img/griptok.png" onclick="location.href='/login';"/>
			<div class="login_top">
				<h2>그립톡 도매전용 쇼핑몰입니다.</h2>
				<h4>본 사이트는 사업자만 이용이 가능한 도매 사이트 입니다.<br>가입 승인 완료 후 이용이 가능 합니다.</h4>
			</div>
		</div>
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-sm-10">     
            <div class="panel panel-info" >
                    <div style="padding-top:30px" class="panel-body" >
                    	
                    	
		<form id="sign_up_form" method="post" action="/sign_up/sign_up" enctype="multipart/form-data">                    	
      	   <div class="row" >
            <div class="col-sm-4">
              	<div class="col-sm-12 input-group custom">
			    <input name="user_id" id="user_id" type="text" class="form-control input-sm" placeholder="아이디" required>
			    <span class="input-group-btn" style="width:0;">
			        <button id="id_check" class="btn-primary btn-sm" type="button">중복확인</button>
			    </span>
			   </div>
               <div class="col-sm-12 input-group custom"><input id="passwd" name="passwd" type="password" placeholder="비밀번호"  class="form-control input-sm" required></div>
               <div class="col-sm-12 input-group custom"><input id="passwd_check" name="passwd_check" type="password" placeholder="비밀번호 확인"  class="form-control input-sm" required></div>
               <div class="col-sm-12 input-group custom"><input id="contact_tel" name="contact_tel" maxlength="13" type="text" placeholder="전화번호" class="form-control input-sm" required></div>
            </div>
            <div class="col-sm-8">
            	<span class="input_chk">
					<input type="checkbox" id="termsService" name="termsService" class="chk" onclick="checkAll()" >
					<label for="termsService" onclick="checkAll()">전체 동의<span class="terms_necessary">(필수)</span></label>
				</span>
            	<div class="col-sm-12" style="border:1px solid #dadada; height:180px;">
	            <div class="col-sm-6 custom full_height" >
	            <span class="input_chk">
					<input type="checkbox" id="termsService2" name="termsService2" class="chk" onclick="checkEach()">
					<label  onclick="checkInput('termsService2')">이용약관 동의<span class="terms_necessary">(필수)</span></label>
				</span>
	              <div class="col-sm-12 eighty_height" style="background-color:#f5f6f7;overflow-y:scroll;overflow-x:hidden;">	
		            <p class="eighty_height"> 
		              yohan394yohan394yohan394yohan394
		              yohan394yohan394yohan394yohan394
		              </p>
	              </div>
	            </div>
	            <div class="col-sm-6 custom full_height">
	            <span class="input_chk">
					<input type="checkbox" id="termsService3" name="termsService3" class="chk" onclick="checkEach()">
					<label onclick="checkInput('termsService3')">개인정보 수집 및 이용 동의<span class="terms_necessary">(필수)</span></label>
				</span>
				<div class="col-sm-12 eighty_height" style="background-color:#f5f6f7;overflow-y:scroll;overflow-x:hidden;">	
		            <p class="eighty_height"> 
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
              	<input type="text" id="company_nm" name="company_nm" placeholder="회사명" class="form-control input-sm" required>
              	<span class="input-group-btn" style="width:0;">
			        <button id="company_nm_check" class="btn-primary btn-sm text-sm" type="button">중복확인</button>
			    </span>
              </div>
              <div class="col-sm-12 input-group custom">
              	<input type="text" id="biz_reg_number" name="biz_reg_number" maxlength="12" placeholder="사업자등록번호"  class="form-control input-sm" required>
              	<span class="input-group-btn" style="width:0;">
			        <button id="biz_reg_number_check" class="btn-primary btn-sm text-sm" type="button">중복확인</button>
			    </span>
              </div>
              <div class="col-sm-12 input-group custom input-file">
		    		<input id="file_nm" name="file_nm" type="text" class="form-control input-sm" placeholder='사업자등록증 사본 등록' required/>			
		            <span class="input-group-btn" style="width:0;">
		        		<button class="btn-sm btn-primary btn-choose" type="button">찾아보기</button>
		    		</span>
              </div>
              <div class="col-sm-12 input-group custom"><input type="text" id="ceo_nm" name="ceo_nm" placeholder="대표자명"  class="form-control input-sm"></div>
            </div>
            <div class="col-sm-4">
              <div class="col-sm-12 input-group custom"><input type="text" id="manger_nm" name="manager_nm" placeholder="담당자명" class="form-control input-sm" required></div>
              <div class="col-sm-12 input-group custom"><input type="text" id="manager_tel" maxlength="13" name="manager_tel" placeholder="담당자 휴대전화"  class="form-control input-sm" required></div>
              <div class="col-sm-12 input-group custom"><input type="text" id="manager_email" name="manager_email" placeholder="담당자 이메일" class="form-control input-sm" required></div>
            </div>
            <div class="col-sm-4">
	          <div class="col-sm-12 input-group custom">
	          		<input type="text" id="tax_email" name="tax_email" placeholder="세금계산서 발행 이메일" class="form-control input-sm" required>
	          </div>
              <div class="col-sm-12 input-group custom">
          		<input type="text" id="post_code" name="post_code" placeholder="우편번호" readonly="readonly" class="form-control input-sm">
	        	<span class="input-group-btn" style="width:0;">
		        	<button onclick="openDaumZipAddress()" class="btn-primary btn-sm text-sm" type="button">주소찾기</button>
			    </span>
	          </div>
              <div class="col-sm-12 input-group custom"><input type="text" id="address" name="biz_addr_1" placeholder="주소" class="form-control input-sm" readonly="readonly" required></div>
              <div class="col-sm-12 input-group custom"><input type="text" id="address_etc" name="biz_addr_2" placeholder="세부주소" class="form-control input-sm" required></div>
            </div>
           
           
           </div>
           <div class="row">
           		<div class="col-sm-12 submit">
           			 <button class="btn-warning btn-sm" type="button">취소</button>
           			 <button id="sign_up" class="btn-primary btn-sm" type="submit">가입하기</button>
           		</div>
           </div>
          	</form>
           </div>  
          </div>


</div>
<!-- div container -->
</div>
<script src="./js/user/sign_up.js" charset="utf-8"></script>
</body>
</html>