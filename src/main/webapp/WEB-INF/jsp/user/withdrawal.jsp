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
			<h3 class="h_tag_center grey_back">ȸ��Ż��</h3>
			<h4 class="h_tag_center">�׸��� B2B ����Ʈ ȸ�� Ż�� ���Ͻó���</h4>
			<br>
			<h4 class="h_tag_center">�׵��� �̿��� �ֽ� ȸ���Բ� �������� ����帳�ϴ�.</h4>
			<h4 class="h_tag_center">ȸ�� Ż�� �� �Ʒ� �����ǻ��ס��� Ȯ�� �Ͽ� �ֽñ� �ٶ��ϴ�.</h4>
		<br>
      	<br>
      	<br>
	
		<table style="border-collapse: collapse;width:100%">
			<tbody style="width: 100%;display: table;">
			<tr>
				<td class="grey_back">Ż�����</td>
				<td>
					 <input type="radio" name="withdraw_reason" value="unsatisfied">���� �Ҹ���<br>
					 <input type="radio" name="withdraw_reason" value="complex">�̿��� �����ؼ�<br>
					 <input type="radio" name="withdraw_reason" value="privacy">�������� ���� ���<br>
					 <input type="radio" name="withdraw_reason" value="etc">��Ÿ<br>  
					 <input type="text" style="width:100%" name="etc_text" placeholder="��Ÿ ���� ������ 100�� �̳��� �ۼ����ּ���."/>
				</td>
			</tr>	
			<tr>
				<td class="grey_back">���̵�</td>
				<td>aaaa</td>
				<td class="grey_back">��й�ȣ</td>
				<td>123</td>
			</tr>	
			</tbody>
		</table>
      	<br>
      	<br>
      	<br>
      	<div class="row">
      		<div class="col-sm-12 submit" align="center">
      			 <button id="sign_up" class="btn-primary btn-lg" type="submit">Ȯ��</button>
      			 <button class="btn-warning btn-lg" type="button">���</button>
      		</div>
         </div>
         
        </div>

</div>
</body>
</html>