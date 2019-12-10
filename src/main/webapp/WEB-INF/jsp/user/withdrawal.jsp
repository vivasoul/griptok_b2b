<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="./lib/js/jquery.min.js"></script>
<script src="./lib/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./lib/css/withdrawal.css">
<link rel="stylesheet" href="./lib/bootstrap/css/bootstrap.min.css">
</head>
<body>

 <div class="custom-container container">    
		<div class="mainbox col-sm-10 col-sm-offset-2">
			<h3 class="grey_back_title">회원탈퇴</h3>
			<br>
			<h5 class="bolded">그립톡 B2B 사이트 회원 탈퇴를 원하시나요</h5>
			<br>
			<h5 class="bolded">그동안 이용해 주신 회원님께 진심으로 감사드립니다.</h5>
			<h5 class="bolded">회원 탈퇴 전 아래 “유의사항”을 확인 하여 주시기 바랍니다.</h5>
      	<br>
	
		<table id="withdraw_table">
			<tbody>
			<tr>
				<td class="grey_back_td bolded">탈퇴사유</td>
				<td colspan="3">
					 <input type="radio" name="withdraw_reason" value="unsatisfied">서비스 불만족<br>
					 <input type="radio" name="withdraw_reason" value="complex">이용이 불편해서<br>
					 <input type="radio" name="withdraw_reason" value="privacy">개인정보 유출 우려<br>
					 <input type="radio" name="withdraw_reason" value="etc">기타<br>  
					 <input type="text" style="width:100%" name="etc_text" placeholder="기타 불편 사항을 100자 이내로 작성해주세요."/>
				</td>
			</tr>	
			<tr>
				<td class="grey_back_td bolded">아이디</td>
				<td>aaaa</td>
				<td class="grey_back_td bolded">비밀번호</td>
				<td>123</td>
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
</body>
</html>