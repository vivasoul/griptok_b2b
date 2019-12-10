<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="./lib/js/jquery.min.js"></script>
<script src="./lib/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./lib/css/info_change.css">
<link rel="stylesheet" href="./lib/bootstrap/css/bootstrap.min.css">
</head>
<body>

 <div class="custom-container container">    
		<div class="mainbox col-sm-10 col-sm-offset-2">
			<h3 class="grey_back_title">회원정보 수정</h3>
		<br>	
		<h5 class="bolded">기본정보(필수 입력사항)</h5>
		<br>
	
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
				<td colspan="3">yoahn394</td>
			</tr>
			<tr>
				<td class="grey_back_td bolded">비밀번호</td>
				<td colspan="3">asdfadf</td>
			</tr>
			<tr>
				<td class="grey_back_td bolded">회사명</td>
				<td> 아이버스터</td>
				<td class="grey_back_td bolded">사업자 등록번호</td>
				<td>123123123</td>
			</tr>
			<tr>
				<td class="grey_back_td bolded">사업자 등록번호 사본</td>
				<td colspan="3">
					<div class="col-sm-12 input-group custom">
	              	<div class="input-group input-file">
			    		<input id="file_nm" name="file_nm" type="text" class="form-control" placeholder='Choose a file...' />			
			            <span class="input-group-btn">
			        		<button class="btn btn-default btn-choose" type="button">Choose</button>
			    		</span>
					</div>
	              </div>
                </td>
			</tr>
			<tr>
				<td class="grey_back_td bolded">대표자</td>
				<td>나요한</td>
				<td class="grey_back_td bolded">업태/업종</td>
				<td>제조업/악세서리</td>
			</tr>
			<tr>
				<td class="grey_back_td bolded">주소</td>
				<td colspan="3">
					<p>
					입력하신 주소는 기본 배송지로 입력됩니다. <br>
					회원가입시 기입된 주소는 사업자 등록증 소재 주소 입니다.<br>
					사업자 등록증과 배송 주소가 다를 경우  마이페이지 배송지관리에서 수정 및 추가가 가능합니다<br>
					</p>
				</td>
			</tr>	
			<tr>
				<td class="grey_back_td bolded">연락처</td>
				<td>aaaa</td>
				<td class="grey_back_td bolded">세금계산서발행 이메일</td>
				<td>123</td>
			</tr>
			<tr>
				<td class="grey_back_td bolded">담당자명</td>
				<td>aaaa</td>
				<td class="grey_back_td bolded">담당자 연락처</td>
				<td>123</td>
			</tr>
			<tr>
				<td class="grey_back_td bolded">담당자 이메일</td>
				<td colspan="3">yohan394@hotmail.com</td>
			</tr>	
			</tbody>
		</table>
      	<br>
      	<br>
      	<br>
      	<div class="row">
      		<div class="col-sm-12 submit" align="center">
      			 <button id="sign_up" class="btn-primary btn-lg" type="submit">확인</button>
      			 <button class="btn-warning btn-lg" type="button">취소</button>
      		</div>
         </div>
         
        </div>
</div>


<div class="modal fade" id="idFinderModal" role="dialog">
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
                <input id="old_passwd" class="form-control input-lg" placeholder="기존 비밀번호" type="text">
              </div>
            </div>
            <div class="form-group">
            	<div class="right-inner-addon">
	                <i class="fa fa-key"></i>
	                <input id="new_passwd" class="form-control input-lg" placeholder="새 비밀번호" type="text">
              </div>
            </div>
            <div class="form-group">
            	<div class="right-inner-addon">
	                <i class="fa fa-key"></i>
	                <input id="passwd_confirm" class="form-control input-lg" placeholder="비밀번호 확인" type="text">
              </div>
            </div>
          </fieldset>
          <hr>
          <div class="tab-content">
            <div class="tab-pane fade in active text-center">
              <button id="id_cell_finder" class="btn btn-primary btn-lg btn-block"><i class="fa fa-plus"></i> 전송</button>
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


</body>
</html>