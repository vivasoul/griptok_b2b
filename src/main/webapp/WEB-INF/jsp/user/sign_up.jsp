<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/user/signup.css">
<script>
	var registered = "<%= session.getAttribute( "registered" ) %>";
</script>
<%
	session.invalidate();
%>
 <div class="container-fluid sign_up_box">
 	<br>
 	<div class="gtk-signup-header">
 		<div id="gtk-signup-title">
 			회원가입
 		</div>
 		<div id="gtk-signup-guide">
 			본 쇼핑몰은 관리자의 회원가입후 관리자의 승인이 완료 되어야 이용이 가능한 쇼핑몰 입니다.
 		</div> 		
 	</div>
 	<div>
	<form id="sign_up_form" method="post" action="/sign_up/sign_up" enctype="multipart/form-data">   
      <div id="signupbox" class="gtk-main-box">
        	<div class="gtk-box-half">
        		<div class="gtk-user-header" id="basic-user-info">
        			<span class="title-icon">●</span> 기본정보
        		</div>
        		<div class="gtk-user-content">
	         		<div class="gtk-input-label">
	         			아이디
	         		</div>
	         		<div class="gtk-input-group">
	         			<input id="user_id" name="user_id" reg_id = "id" data-regex="T" type="text" placeholder="영문4자이상,숫자혼용가능" required><!-- 
	     				--><button id="id_check" class="gtk-btn gtk-btn-sm gtk-btn-blue" type="button">중복확인</button>
	         		</div>
	         		<div class="gtk-input-label">
	         			비밀번호
	         		</div>
	         		<div class="gtk-input-group no-addon">
	         			<input id="passwd" reg_id = "passwd" data-regex="T" name="passwd" type="password" placeholder="비밀번호는 6~15자 이내로 입력하셔야 합니다."  required>
	         		</div>
	         		<div class="gtk-input-label">
	         			비밀번호 확인
	         		</div>
	         		<div class="gtk-input-group no-addon">
	         			<input id="passwd_check" name="passwd_check" reg_id = "passwd_check" data-keyup="P" parent_id="passwd" type="password" placeholder="위에 비밀번호와 일치해야합니다."  required>
	         		</div>
        		</div>
       			<div class="gtk-user-header" id="biz-user-info">
        			<span class="title-icon">●</span> 기업정보
        		</div>
         		<div class="gtk-user-content">
	         		<div class="gtk-input-label">
	         			회사명
	         		</div>
	         		<div class="gtk-input-group">
	         			<input type="text" id="company_nm" name="company_nm" placeholder="회사명" required><!--
	         	     --><button id="company_nm_check" class="gtk-btn gtk-btn-sm gtk-btn-blue" type="button">중복확인</button>
	         		</div>
	         		<div class="gtk-input-label">
	         			사업자 등록번호
	         		</div>
	         		<div class="gtk-input-group">
	         			<input type="text" reg_id = "biz_reg_number" data-regex="T" data-keyup="B" id="biz_reg_number" name="biz_reg_number" maxlength="12" placeholder="사업자등록번호" required><!--
	                 --><button id="biz_reg_number_check" class="gtk-btn gtk-btn-sm gtk-btn-blue" type="button">중복확인</button>
	         		</div>
	         		<div class="gtk-input-label">
	         			사업자 등록증 사본 이미지 등록
	         		</div>
	         		<div class="gtk-input-group">
	         			<input id="file_nm" name="file_nm" type="text" placeholder='사업자등록증 사본 등록' readonly required/><!--
	         		 --><button class="gtk-btn gtk-btn-sm gtk-btn-blue btn-choose" type="button">찾아보기</button>
	         		</div>
	         		<div class="gtk-input-label">
	         			대표자명
	         		</div>
	         		<div class="gtk-input-group no-addon">
	         			<input type="text" id="ceo_nm" name="ceo_nm" placeholder="대표자명" required>
	         		</div>
         		</div>
        	</div><!--
         --><div class="gtk-box-half">
           		<div class="gtk-user-header" id="optional-user-info">
            		<span class="title-icon">●</span> 추가정보
           		</div>
           		<div class="gtk-user-content">
            		<div class="gtk-input-label">
            			담당자명
            		</div>
            		<div class="gtk-input-group no-addon">
            			<input type="text" id="manger_nm" name="manager_nm" required>
            		</div>
            		<div class="gtk-input-label">
            			담당자 휴대전화
            		</div>
            		<div class="gtk-input-group no-addon">
            			<input type="text" reg_id="tel" data-regex="T" data-keyup="T" id="manager_tel" maxlength="13" name="manager_tel" required>
            		</div>
            		<div class="gtk-input-label">
            			담당자 이메일
            		</div>
            		<div class="gtk-input-group no-addon">
            			<input type="text" reg_id="email" id="manager_email" data-regex="T" name="manager_email" required>
            		</div>
            		<div class="gtk-input-label">
            			세금계산서 발행 이메일
            		</div>
            		<div class="gtk-input-group no-addon">
            			<input type="text" reg_id = "email" id="tax_email" data-regex="T" name="tax_email" placeholder="담당자 이메일과 동일한 경우 다시 한번 적어주세요" required>
            		</div>
            		<div class="gtk-input-label">
            			주소
            		</div>
            		<div class="gtk-input-group">
	            		<input type="text" id="post_code" name="post_code" placeholder="우편번호" readonly /><!--
		        	 --><button onclick="openDaumZipAddress('post_code', 'address', 'address_etc', true)" class="gtk-btn gtk-btn-sm gtk-btn-blue" type="button">주소찾기</button>
	        		</div>
	        		<div class="gtk-input-group no-addon">
	        			<input type="text" id="address" name="biz_addr_1" placeholder="주소" readonly required>
	        		</div>
             		<div class="gtk-input-group no-addon">
             			<input type="text" id="address_etc" name="biz_addr_2" placeholder="세부주소" required>
             		</div>
             		<div class="gtk-input-group">
             			<div class="gtk-info-text">
	            			※ 회원가입시 등록 하신 주소는 기본 배송지로 지정 됩니다.
	            			<br>
							     배송지 변경은 회원승인 완료후 마이페이지 배송지 관리에서
							<br> 
							     변경 또는 추가가 가능 합니다.
						</div>
            		</div>
           		</div>
           	</div>
      </div>
           
		<div id="termbox" class="gtk-main-box">

            	<div class="gtk-box-half">
	            	<div class="margin_l_18 margin_t_28 margin_r_40">
	            		<div class="info_font">
			            	<input type="checkbox" id="termsService" name="termsService" class="chk" onclick="checkAll()" >
							<label for="termsService" onclick="checkAll()">전체 동의<span class="terms_necessary">(필수)</span></label>
						</div>
						<div class="grey_font margin_l_5 margin_t_17">
							<span class="input_chk">
							<input type="checkbox" id="termsService2" name="termsService2" class="chk" onclick="checkEach()">
							<label onclick="checkInput('termsService2')">이용약관 동의<span class="terms_necessary">(필수)</span></label>
						</span>
						</div>
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
           		</div><!-- 
             --><div class="gtk-box-half">
	            	<div class=" margin_l_18 margin_t_70 margin_r_40">
	            		<div class="grey_font margin_l_5">
	            		<span class="input_chk">
												<input type="checkbox" id="termsService3" name="termsService3" class="chk" onclick="checkEach()">
												<label onclick="checkInput('termsService3')">개인정보 수집 및 이용 동의<span class="terms_necessary">(필수)</span></label>
											</span>
											</div>
											<div class="col-sm-12 gtk-term-condition-box">	
									            <pre>
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
개인정보 수집 및 이용 동의 페이지입니다.
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
            
           <div class="row">
           		<div class="col-sm-12 submit gtk-login-btn-group margin_b_88">
           			 <button id="sign_up_cancel" class="gtk-btn sign_up_bix_box margin_r_18" type="button">취소</button>
           			 <button id="sign_up" class="gtk-btn gtk-btn-blue sign_up_bix_box" type="submit">가입하기</button>
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
