<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="./lib/js/jquery.min.js"></script>
<script src="./lib/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./lib/css/info_change.css">
<link rel="stylesheet" href="./lib/bootstrap/css/bootstrap.min.css">
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
var user_no = "<%= session.getAttribute( "user_no" ) %>";
var info_changed = "<%= session.getAttribute( "info_changed" ) %>";
</script>
<%
	session.setAttribute("info_changed", "null");
 %>





</head>

<body>

 <div class="custom-container container">    
		<div class="mainbox col-sm-10 col-sm-offset-2">
			<h3 class="grey_back_title">회원정보 수정</h3>
		<br>	
		<h5 class="bolded">기본정보(필수 입력사항)</h5>
		<br>
		<form id="info_change_form" method="post" action="/info_change/change" enctype="multipart/form-data">
			<table id="info_change_table">
				<colgroup>
			       <col width="20%">
			       <col width="40%">
			       <col width="20%">
			       <col width="20%">
			    </colgroup>
				<tbody>
				<tr>
					<td class="grey_back_td bolded">아이디</td>
					<td colspan="3"><input type="text" name="user_id" id="user_id"/><input type="hidden" name="user_no" id="user_no"/></td>
				</tr>
				<tr>
					<td class="grey_back_td bolded">비밀번호</td>
					<td colspan="3"><button data-toggle="modal" data-target="#pwChangeModal" class="btn-primary btn-sm-offset-2" type="button">비밀번호 변경</button></td>
				</tr>
				<tr>
					<td class="grey_back_td bolded">회사명</td>
					<td><input type="text" name="company_nm" id="company_nm" required/></td>
					<td class="grey_back_td bolded">사업자 등록번호</td>
					<td><input type="text" maxlength="12" name="biz_reg_number" id="biz_reg_number" required/></td>
				</tr>
				<tr>
					<td class="grey_back_td bolded">사업자 등록번호 사본</td>
					<td colspan="3">
						<div class="col-sm-12 input-group custom">
		              	<div class="input-group input-file">
				    		<input id="file_nm" name="file_nm" name="file_nm" type="text" class="form-control" placeholder='파일 선택' required/>			
				            <span class="input-group-btn">
				        		<button class="btn btn-default btn-choose" type="button">Choose</button>
				    		</span>
						</div>
		              </div>
	                </td>
				</tr>
				<tr>
					<td class="grey_back_td bolded">대표자</td>
					<td><input type="text" name="ceo_nm"  id="ceo_nm"/></td>
					<td class="grey_back_td bolded">업태/업종</td>
					<td><input type="text" name="biz_category"  id="biz_category"/></td>
				</tr>
				<tr>
					<td class="grey_back_td bolded">주소</td>
					<td colspan="3">
						<input style="width:60%" type="text" id="addr"/><button data-toggle="modal" data-target="#addrModal" class="btn-primary btn-sm-offset-2" type="button">기본 배송지 변경</button>
						<p>
						입력하신 주소는 기본 배송지로 입력됩니다. <br>
						회원가입시 기입된 주소는 사업자 등록증 소재 주소 입니다.<br>
						사업자 등록증과 배송 주소가 다를 경우  마이페이지 배송지관리에서 수정 및 추가가 가능합니다<br>
						</p>
					</td>
				</tr>	
				<tr>
					<td class="grey_back_td bolded">연락처</td>
					<td><input type="text" maxlength="12" name="contact_tel" id="contact_tel" required/></td>
					<td class="grey_back_td bolded">세금계산서발행 이메일</td>
					<td><input type="text" name="tax_email" id="tax_email"/></td>
				</tr>
				<tr>
					<td class="grey_back_td bolded">담당자명</td>
					<td><input type="text" name="manager_nm" id="manager_nm"/></td>
					<td class="grey_back_td bolded">담당자 연락처</td>
					<td><input type="text" maxlength="13" name="manager_tel" id="manager_tel" required/></td>
				</tr>
				<tr>
					<td class="grey_back_td bolded">담당자 이메일</td>
					<td colspan="3"><input type="text" name="manager_email" id="manager_email" required/></td>
				</tr>	
				</tbody>
			</table>
      	<br>
      	<br>
      	<br>
      	<div class="row">
      		<div class="col-sm-12 submit" align="center">
      			 <button id="info_change" class="btn-primary btn-lg" type="submit">확인</button>
      			 <button class="btn-warning btn-lg" type="button">취소</button>
      		</div>
         </div>
         
		</form>
        </div>
</div>


<div class="modal fade" id="pwChangeModal" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-body">
            <h3>비밀번호 변경</h3>
            <br>            
        <div class="tab-content clearfix">
          <br>
          <fieldset>
            <div class="form-group">
              <div class="right-inner-addon">
                <i class="fa fa-envelope"></i>
                <input id="old_passwd" class="form-control input-lg" placeholder="기존 비밀번호" type="password">
              </div>
            </div>
            <div class="form-group">
            	<div class="right-inner-addon">
	                <i class="fa fa-key"></i>
	                <input id="new_passwd" class="form-control input-lg" placeholder="새 비밀번호" type="password">
              </div>
            </div>
            <div class="form-group">
            	<div class="right-inner-addon">
	                <i class="fa fa-key"></i>
	                <input id="new_passwd_check" class="form-control input-lg" placeholder="비밀번호 확인" type="password">
              </div>
            </div>
          </fieldset>
          <hr>
          <div class="tab-content">
            <div class="tab-pane fade in active text-center">
            <div class="col-sm-6">  
              <button id="passwd_change_close" class="btn btn-warning btn-lg btn-block" data-dismiss="modal"><i class="fa fa-plus"></i> 취소</button>
            </div>
            <div class="col-sm-6">
              <button id="btn_passwd_change" class="btn btn-primary btn-lg btn-block"><i class="fa fa-plus"></i> 확인</button>
            </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="addrModal" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-body">
            <h3>기본 배송지</h3>
            <br>            
        <div class="tab-content clearfix">
          <br>
          <fieldset>
           <div class="form-group">
	            <div class="col-sm-11 input-group">
          		<input type="text" id="shipto_nm" name="shipto_nm" placeholder="배송지 이름" class="form-control input-lg">
	          </div>
            </div>
            <div class="form-group">
	            <div class="col-sm-11 input-group">
          		<input type="text" id="receiver_nm" name="receiver_nm" placeholder="받는 사람" class="form-control input-lg">
	          </div>
            </div>
            <div class="form-group">
	            <div class="col-sm-11 input-group">
          		<input type="text" id="receiver_tel" name="receiver_tel" maxlength="13" placeholder="휴대전화" class="form-control input-lg">
	          </div>
            </div>
            <div class="form-group">
	            <div class="col-sm-12 input-group">
          		<input type="text" id="post_code" name="post_code" placeholder="우편번호" readonly="readonly" class="form-control input-lg">
	        	<span class="input-group-btn" style="width:0;">
		        	<button onclick="openDaumZipAddress()" class="btn-primary btn-lg text-sm" type="button">주소찾기</button>
			    </span>
	          </div>
            </div>
            <div class="form-group">
            	<div class="col-sm-11 input-group">
	                <input type="text" id="shipto_addr1" name="shipto_addr_1" placeholder="주소" class="form-control input-lg" readonly="readonly" required>
              </div>
            </div>
            <div class="form-group">
            	<div class="col-sm-11 input-group">
	                <input type="text" id="shipto_addr2" name="shipto_addr_2" placeholder="세부주소" class="form-control input-lg" required>
              </div>
            </div>
          </fieldset>
          <hr>
          <div class="tab-content">
            <div class="tab-pane fade in active text-center">
            <div class="col-sm-6">
              <button id="shipto_change_close" class="btn btn-warning btn-lg btn-block" data-dismiss="modal"><i class="fa fa-plus"></i> 취소</button>
             </div> 
             <div class="col-sm-6">
              <button id="shipto_change" class="btn btn-primary btn-lg btn-block"><i class="fa fa-plus"></i> 확인</button>
              </div>
            </div>
          </div>
        </div>
        <br>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>


<script src="./js/user/info_change.js"></script>
</body>
</html>