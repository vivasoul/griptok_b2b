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
			<h3 class="grey_back_title">ȸ��Ż��</h3>
			<br>
			<h5 class="bolded">�׸��� B2B ����Ʈ ȸ�� Ż�� ���Ͻó���</h5>
			<br>
			<h5 class="bolded">�׵��� �̿��� �ֽ� ȸ���Բ� �������� ����帳�ϴ�.</h5>
			<h5 class="bolded">ȸ�� Ż�� �� �Ʒ� �����ǻ��ס��� Ȯ�� �Ͽ� �ֽñ� �ٶ��ϴ�.</h5>
      	<br>
	
		<table id="withdraw_table">
			<tbody>
			<tr>
				<td class="grey_back_td bolded">Ż�����</td>
				<td colspan="3">
					 <input type="radio" name="withdraw_reason" value="unsatisfied">���� �Ҹ���<br>
					 <input type="radio" name="withdraw_reason" value="complex">�̿��� �����ؼ�<br>
					 <input type="radio" name="withdraw_reason" value="privacy">�������� ���� ���<br>
					 <input type="radio" name="withdraw_reason" value="etc">��Ÿ<br>  
					 <input type="text" style="width:100%" name="etc_text" placeholder="��Ÿ ���� ������ 100�� �̳��� �ۼ����ּ���."/>
				</td>
			</tr>	
			<tr>
				<td class="grey_back_td bolded">���̵�</td>
				<td>aaaa</td>
				<td class="grey_back_td bolded">��й�ȣ</td>
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