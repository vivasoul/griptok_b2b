<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>

<script>
	var registered = "<%= session.getAttribute( "registered" ) %>";
</script>
<%
	session.invalidate();
%>

 <div class="custom-container container-fluid sign_up_box">
 	<br>
 	<div class="row">
 		<div id="header_blue_box"></div>
 		<div id="gtk-signup-title">
 			회원가입
 		</div>
 	</div>
 	<div class="row">
 		<div class="info_font margin_l_80 margin_b_15 grey_font">
 			본 쇼핑몰은 관리자의 회원가입후 관리자의 승인이 완료 되어야 이용이 가능한 쇼핑몰 입니다.
 		</div>
 	</div>
 	<div class="row">
	<form id="sign_up_form" method="post" action="/sign_up/sign_up" enctype="multipart/form-data">   
      <div id="signupbox" class="mainbox col-sm-12">
			<div class="row">
            	<div class="col-sm-6 line_division_r">
            	<div class=" margin_l_18 margin_t_28 margin_r_40">
	            		<div class="sub_header_font">
	            			● 기본정보
	            		</div>
            		<div class="margin_l_22">
	            		<div class="info_font grey_font margin_t_15">
	            			아이디
	            		</div>
	            		<div class="col-sm-12 input-group custom margin_t_10">
	            			<input name="user_id" reg_id = "id" data-regex="T" id="user_id" type="text" class="form-control" placeholder="영문4자이상,숫자혼용가능" required><!-- 
				     --><button id="id_check" class="gtk-btn gtk-btn-sm gtk-btn-blue" type="button">중복확인</button>
	            		</div>
	            		<div class="info_font grey_font margin_t_15">
	            			비밀번호
	            		</div>
	            		<div class="col-sm-12 input-group no-addon custom margin_t_10"><input id="passwd" reg_id = "passwd" data-regex="T" name="passwd" type="password" placeholder="비밀번호는 6~15자 이내로 입력하셔야 합니다."  class="form-control input-sm" required></div>
	            		<div class="info_font grey_font margin_t_15">
	            			비밀번호 확인
	            		</div>
	            		<div class="col-sm-12 input-group no-addon custom margin_t_10"><input id="passwd_check" name="passwd_check" reg_id = "passwd_check" data-keyup="P" parent_id="passwd" type="password" placeholder="위에 비밀번호와 일치해야합니다."  class="form-control input-sm" required></div>
	            		<div class="info_font grey_font margin_t_15">
	            			휴대전화
	            		</div>
	            		<div class="col-sm-12 input-group no-addon custom margin_t_10">
	            			<input type="text" reg_id="tel" data-regex="T" data-keyup="T" id="contact_tel" maxlength="13" name="contact_tel" placeholder="담당자 휴대전화"  class="form-control input-sm" required>
	            		</div>
            		</div>
            			<div class="sub_header_font margin_t_28">
	            			● 기업정보
	            		</div>
	            	<div class="margin_l_22">
	            		<div class="info_font grey_font margin_t_15">
	            			회사명
	            		</div>
	            		<div class="col-sm-12 input-group custom margin_t_10">
	            			<input type="text" id="company_nm" name="company_nm" placeholder="회사명" class="form-control input-sm" required>
	            			<button id="company_nm_check" class="gtk-btn gtk-btn-sm gtk-btn-blue" type="button">중복확인</button>
	            		</div>
	            		<div class="info_font grey_font margin_t_15">
	            			사업자 등록번호
	            		</div>
	            		<div class="col-sm-12 input-group custom margin_t_10">
	            			<input type="text" reg_id = "biz_reg_number" data-regex="T" data-keyup="B" id="biz_reg_number" name="biz_reg_number" maxlength="12" placeholder="사업자등록번호"  class="form-control input-sm" required>
	            			<button id="biz_reg_number_check" class="gtk-btn gtk-btn-sm gtk-btn-blue" type="button">중복확인</button>
	            		</div>
	            		<div class="info_font grey_font margin_t_15">
	            			사업자 등록증 사본 이미지 등록
	            		</div>
	            		<div class="col-sm-12 input-group custom input-file margin_t_10 ">
	            			<input id="file_nm" name="file_nm" type="text" class="form-control input-sm" placeholder='사업자등록증 사본 등록' readonly="readonly" required/>
	            			<button class="gtk-btn gtk-btn-sm gtk-btn-blue btn-choose" type="button">찾아보기</button>
	            		</div>
	            		<div class="info_font grey_font margin_t_15">
	            			대표자명
	            		</div>
	            		<div class="col-sm-12 input-group no-addon custom margin_t_10">
	            			<input type="text" id="ceo_nm" name="ceo_nm" placeholder="대표자명"  class="form-control input-sm" required>
	            		</div>
	            	</div>
            	</div>
            	</div>
            	<div class="col-sm-6">
            	<div class=" margin_l_18 margin_t_28 margin_r_40">
            		<div class="sub_header_font">
	            			● 추가정보
            		</div>
            		<div class="margin_l_22">
	            		<div class="info_font grey_font margin_t_15">
	            			담당자명
	            		</div>
	            		<div class="col-sm-12 input-group no-addon custom margin_t_10">
	            			<input type="text" id="manger_nm" name="manager_nm" class="form-control input-sm" required>
	            		</div>
	            		<div class="info_font grey_font margin_t_15">
	            			담당자 휴대전화
	            		</div>
	            		<div class="col-sm-12 input-group no-addon custom margin_t_10">
	            			<input type="text" reg_id="tel" data-regex="T" data-keyup="T" id="manager_tel" maxlength="13" name="manager_tel" class="form-control input-sm" required>
	            		</div>
	            		<div class="info_font grey_font margin_t_15">
	            			담당자 이메일
	            		</div>
	            		<div class="col-sm-12 input-group no-addon custom margin_t_10">
	            			<input type="text" reg_id="email" id="manager_email" data-regex="T" name="manager_email" class="form-control input-sm" required>
	            		</div>
	            		<div class="info_font grey_font margin_t_15">
	            			세금계산서 발행 이메일
	            		</div>
	            		<div class="col-sm-12 input-group no-addon custom margin_t_10">
	            			<input type="text" reg_id = "email" id="tax_email" data-regex="T" name="tax_email" placeholder="담당자 이메일과 동일한 경우 다시 한번 적어주세요" class="form-control input-sm" required>
	            		</div>
	            		<div class="info_font grey_font margin_t_15">
	            			주소
	            		</div>
	            		<div class="col-sm-12 input-group custom margin_t_10">
	            		<input type="text" id="post_code" name="post_code" placeholder="우편번호" readonly="readonly" class="form-control input-sm">
		        		<button onclick="openDaumZipAddress('post_code', 'address', 'address_etc', true)" class="gtk-btn gtk-btn-sm gtk-btn-blue" type="button">주소찾기</button>
		        		</div>
		        		<div class="col-sm-12 input-group no-addon custom"><input type="text" id="address" name="biz_addr_1" placeholder="주소" class="form-control input-sm" readonly="readonly" required></div>
              			<div class="col-sm-12 input-group no-addon custom"><input type="text" id="address_etc" name="biz_addr_2" placeholder="세부주소" class="form-control input-sm" required></div>
              			<div class="info_font grey_font margin_l_10 margin_t_10">
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
           </div>
           
           <div id="termbox" class="mainbox col-sm-12 margin_t_20 margin_b_35">
           <div class="row">
            	<div class="col-sm-6">
            	<div class=" margin_l_18 margin_t_28 margin_r_40">
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
           		</div>
            	<div class="col-sm-6 line_division">
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
