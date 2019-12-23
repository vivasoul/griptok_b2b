<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="./lib/js/jquery.min.js"></script>
<script src="./lib/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./css/user/withdrawal.css">
<link rel="stylesheet" href="./lib/bootstrap/css/bootstrap.min.css">
<script>
var user_no = "<%= session.getAttribute( "user_no" ) %>";

$(document).ready(function() {
	$.ajax({
        url : "/withdraw/load",
        type: "post",
        data : {"user_no" : user_no},
        success : function(responseData){
        	$("#user_id").html(responseData.user_id);
        }
    });
});
</script>


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
					 <input type="radio" name="withdraw_reason" value="U" onclick="radioCheck()">서비스 불만족<br>
					 <input type="radio" name="withdraw_reason" value="C" onclick="radioCheck()">이용이 불편해서<br>
					 <input type="radio" name="withdraw_reason" value="P" onclick="radioCheck()">개인정보 유출 우려<br>
					 <input type="radio" name="withdraw_reason" value="E" onclick="radioCheck()">기타<br>  
					 <input type="text" style="width:100%" id="remark" name="remark" placeholder="기타 불편 사항을 100자 이내로 작성해주세요." readonly="readonly"/>
				</td>
			</tr>	
			<tr>
				<td class="grey_back_td bolded">아이디</td>
				<td><div id="user_id"></div></td>
				<td class="grey_back_td bolded">비밀번호</td>
				<td><input type="password" id="passwd"/></td>
			</tr>	
			</tbody>
		</table>
      	<br>
      	<br>
      	<br>
      	<div class="row">
      		<div class="col-sm-12 submit" align="center">
      			 <button id="withdraw" class="btn-primary btn-lg">확인</button>
      			 <button class="btn-warning btn-lg" type="button">취소</button>
      		</div>
         </div>
         
        </div>

</div>
<script src="./js/user/withdrawal.js"></script>
</body>
</html>