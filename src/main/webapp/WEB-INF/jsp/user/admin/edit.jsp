<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/common/js/util.js" charset="utf-8"></script>
<script src="/js/admin/user/edit.js"></script>
<link rel="stylesheet" href="/css/user/signup.css">
<style type="text/css">	
#signupbox { padding:0px;margin:0 auto;margin-top:20px;margin-bottom:20px }
.gtk-login-btn-group { text-align:center;margin-bottom:30px; }
</style>  
<script type="text/javascript">
jQuery(document).ready(function(){
	validationInitialize();
	bs_input_file();
	loadData();
});
</script>
<div class="container-fluid sign_up_box">
 	<form id="sign_up_form" method="post" action="/sign_up/sign_up" enctype="multipart/form-data">
 	<input type="hidden" id="user_no" name="user_no"/>
 	<div>
      <div id="signupbox" class="gtk-main-box">
        	<div class="gtk-box-half">
        		<div class="gtk-user-header" id="basic-user-info">
        			<span class="title-icon">●</span> 기본정보
        		</div>
        		<div class="gtk-user-content">
	         		<div class="gtk-input-label">
	         			아이디
	         		</div>
	         		<div class="gtk-input-group no-addon">
	         			<input id="user_id" name="user_id" reg_id = "id" data-regex="T" type="text" readonly/>
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
	         		<div class="gtk-input-group input-file">
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
            			<input type="text" id="manager_nm" name="manager_nm" required>
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
           		</div>
           	</div>
      </div>
	</div>
	<div class="submit gtk-login-btn-group">
		 <button id="sign_up_cancel" class="gtk-btn sign_up_bix_box margin_r_18" type="button">목록</button>
		 <button id="sign_up" class="gtk-btn gtk-btn-blue sign_up_bix_box" type="submit">수정</button>
	</div>
     </form>
</div><!-- end of loginbox -->

