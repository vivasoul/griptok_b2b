<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>

<script>
	var registered = "<%= session.getAttribute( "registered" ) %>";
</script>
<%
	session.invalidate();
%>

 <div class="custom-container container-fluid">
 	<div class="row">
 		<div class="col-sm-12" id="gtk-signup-title">
 			회원가입
 		</div>
 	</div>
 	<div class="row gtk-login-process-box">
 		<div class="col-sm-4 gtk-process-bar gtk-process-active">
 			<img src="/img/common/process_bar_active_l.png"/><!-- 
 			 --><button class="" type="button" disabled>정보입력</button><!--
 			 --><img src="/img/common/process_bar_active_r.png"/>
 		</div>
 		<div class="col-sm-4 gtk-process-bar">
 			<img src="/img/common/process_bar_l.png"/><!-- 
 			 --><button class="" type="button" disabled>승인대기</button><!--
 			 --><img src="/img/common/process_bar_r.png"/>
 		</div>
 		<div class="col-sm-4 gtk-process-bar">
 			<img src="/img/common/process_bar_l.png"/><!-- 
 			 --><button class="" type="button" disabled>승인완료</button><!--
 			 --><img src="/img/common/process_bar_r.png"/>
 		</div> 	
 	</div>	
 	<div class="row">
      <div id="loginbox" class="mainbox col-sm-12">
		<form id="sign_up_form" method="post" action="/sign_up/sign_up" enctype="multipart/form-data">                    	
      	   <div class="row">
            <div class="col-sm-4">
              <div class="col-sm-12 input-group custom"><!-- 
			     --><input name="user_id" reg_id = "id" data-regex="T" id="user_id" type="text" class="form-control" placeholder="아이디" required><!-- 
			     --><button id="id_check" class="gtk-btn gtk-btn-sm gtk-btn-blue" type="button">중복확인</button><!-- 
			   --></div>
              <div class="col-sm-12 input-group no-addon custom"><input id="passwd" reg_id = "passwd" data-regex="T" name="passwd" type="password" placeholder="비밀번호"  class="form-control input-sm" required></div>
              <div class="col-sm-12 input-group no-addon custom"><input id="passwd_check" name="passwd_check" reg_id = "passwd_check" data-keyup="P" parent_id="passwd" type="password" placeholder="비밀번호 확인"  class="form-control input-sm" required></div>
              <input id="contact_tel" reg_id = "tel" data-regex="T" data-keyup="T" name="contact_tel" maxlength="13" type="hidden" placeholder="전화번호" class="form-control input-sm" value="010-0000-0000">
            </div>
            <div class="col-sm-8">
            	<span class="input_chk">
					<input type="checkbox" id="termsService" name="termsService" class="chk" onclick="checkAll()" >
					<label for="termsService" onclick="checkAll()">전체 동의<span class="terms_necessary">(필수)</span></label>
				</span>
            	<div class="col-sm-12 gtk-term-condition-group">
	            <div class="col-sm-6 custom full_height" >
	            <span class="input_chk">
					<input type="checkbox" id="termsService2" name="termsService2" class="chk" onclick="checkEach()">
					<label  onclick="checkInput('termsService2')">이용약관 동의<span class="terms_necessary">(필수)</span></label>
				</span>
	              <div class="col-sm-12 gtk-term-condition-box">	
		            <pre>
이용약관 페이지입니다.
이용약관 페이지입니다.
이용약관 페이지입니다.
이용약관 페이지입니다.
이용약관 페이지입니다.
이용약관 페이지입니다.
이용약관 페이지입니다.
이용약관 페이지입니다.
이용약관 페이지입니다.
이용약관 페이지입니다.
		            </pre>
	              </div>
	            </div>
	            <div class="col-sm-6 custom full_height">
	            <span class="input_chk">
					<input type="checkbox" id="termsService3" name="termsService3" class="chk" onclick="checkEach()">
					<label onclick="checkInput('termsService3')">개인정보 수집 및 이용 동의<span class="terms_necessary">(필수)</span></label>
				</span>
				<div class="col-sm-12 gtk-term-condition-box">	
		            <pre>
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
		            </pre>
	              </div>
	            </div>
	            </div>
           	</div>
           </div>
           <hr style="border: 1px dashed #999" />
           <div class="row">
            <div class="col-sm-4">
              <div class="col-sm-12 input-group custom"><!-- 
              	--><input type="text" id="company_nm" name="company_nm" placeholder="회사명" class="form-control input-sm" required><!-- 
			    --><button id="company_nm_check" class="gtk-btn gtk-btn-sm gtk-btn-blue" type="button">중복확인</button><!-- 
              --></div>
              <div class="col-sm-12 input-group custom"><!-- 
              	--><input type="text" reg_id = "biz_reg_number" data-regex="T" data-keyup="B" id="biz_reg_number" name="biz_reg_number" maxlength="12" placeholder="사업자등록번호"  class="form-control input-sm" required><!--
			    --><button id="biz_reg_number_check" class="gtk-btn gtk-btn-sm gtk-btn-blue" type="button">중복확인</button><!-- 
              --></div>
              <div class="col-sm-12 input-group custom input-file"><!-- 
	    		--><input id="file_nm" name="file_nm" type="text" class="form-control input-sm" placeholder='사업자등록증 사본 등록' readonly="readonly" required/><!-- 
	        	--><button class="gtk-btn gtk-btn-sm gtk-btn-blue btn-choose" type="button">찾아보기</button><!-- 
              --></div>
              <div class="col-sm-12 input-group no-addon custom"><input type="text" id="ceo_nm" name="ceo_nm" placeholder="대표자명"  class="form-control input-sm" required></div>
            </div>
            <div class="col-sm-4">
              <div class="col-sm-12 input-group no-addon custom"><input type="text" id="manger_nm" name="manager_nm" placeholder="담당자명" class="form-control input-sm" required></div>
              <div class="col-sm-12 input-group no-addon custom"><input type="text" reg_id="tel" data-regex="T" data-keyup="T" id="manager_tel" maxlength="13" name="manager_tel" placeholder="담당자 휴대전화"  class="form-control input-sm" required></div>
              <div class="col-sm-12 input-group no-addon custom"><input type="text" reg_id="email" id="manager_email" data-regex="T" name="manager_email" placeholder="담당자 이메일" class="form-control input-sm" required></div>
            </div>
            <div class="col-sm-4">
	          <div class="col-sm-12 input-group no-addon custom">
	          		<input type="text" reg_id = "email" id="tax_email" data-regex="T" name="tax_email" placeholder="세금계산서 발행 이메일" class="form-control input-sm" required>
	          </div>
              <div class="col-sm-12 input-group custom">
          		<input type="text" id="post_code" name="post_code" placeholder="우편번호" readonly="readonly" class="form-control input-sm">
		        <button onclick="openDaumZipAddress('post_code', 'address', 'address_etc', true)" class="gtk-btn gtk-btn-sm gtk-btn-blue" type="button">주소찾기</button>
	          </div>
              <div class="col-sm-12 input-group no-addon custom"><input type="text" id="address" name="biz_addr_1" placeholder="주소" class="form-control input-sm" readonly="readonly" required></div>
              <div class="col-sm-12 input-group no-addon custom"><input type="text" id="address_etc" name="biz_addr_2" placeholder="세부주소" class="form-control input-sm" required></div>
            </div>
           
           
           </div>
           <div class="row">
           		<div class="col-sm-12 submit gtk-login-btn-group">
           			 <button class="gtk-btn gtk-btn-lg" type="button">취소</button>
           			 <button id="sign_up" class="gtk-btn gtk-btn-lg gtk-btn-blue" type="submit">가입하기</button>
           		</div>
           </div>
        </form>
	</div><!-- end of loginbox -->
</div>
<!-- div container -->
</div>
<script src="./common/js/util.js" charset="utf-8"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>  
<script src="./js/user/sign_up.js" charset="utf-8"></script>
