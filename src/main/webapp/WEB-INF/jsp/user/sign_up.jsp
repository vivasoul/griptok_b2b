<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="./lib/js/jquery.min.js"></script>
<script src="./lib/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./lib/css/register.css">
<link rel="stylesheet" href="./lib/bootstrap/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="/css/common/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="/css/common/font-awesome.min.css"> -->
<!-- <link rel="stylesheet" href="/css/common/googleapi.css"> -->
</head>
<body>

 <div class="custom-container container">    
		<div class="mainbox col-sm-10 col-sm-offset-2" >
			<img class="login_top" src="./lib/img/griptok.png" onclick="location.href='/login';"/>
			<div class="login_top">
				<h2>�׸��� �������� ���θ��Դϴ�.</h2>
				<h4>�� ����Ʈ�� ����ڸ� �̿��� ������ ���� ����Ʈ �Դϴ�.<br>���� ���� �Ϸ� �� �̿��� ���� �մϴ�.</h4>
			</div>
		</div>

        <div id="loginbox" style="margin-top:50px;" class="mainbox col-sm-12">     
            <div class="panel panel-info" >
                    <div style="padding-top:30px" class="panel-body" >
                    	
                    	
                    	
      	   <div class="row" >
            <div class="col-sm-4">
              	<div class="col-sm-12 input-group custom">
			    <input type="text" class="form-control input-lg" placeholder="���̵�">
			    <span class="input-group-btn" style="width:0;">
			        <button class="btn-primary btn-lg" type="button">�ߺ�Ȯ��</button>
			    </span>
			   </div>
               <div class="col-sm-12 input-group custom"><input type="text" maxlength="4" placeholder="��й�ȣ"  class="form-control input-lg"></div>
               <div class="col-sm-12 input-group custom"><input type="text" maxlength="4" placeholder="��й�ȣ Ȯ��"  class="form-control input-lg"></div>
            </div>
            <div class="col-sm-8">
            	<span class="input_chk">
					<input type="checkbox" id="termsService" name="termsService" class="chk">
					<label for="termsService">��ü ����<span class="terms_necessary">(�ʼ�)</span></label>
				</span>
            	<div class="col-sm-12" style="border:1px solid #dadada">
	            <div class="col-sm-6 custom" >
	            <span class="input_chk">
					<input type="checkbox" id="termsService" name="termsService" class="chk">
					<label for="termsService">�̿��� ����<span class="terms_necessary">(�ʼ�)</span></label>
				</span>
	              <div class="col-sm-12" style="background-color:#f5f6f7;overflow-y:scroll;">	
		            <p> 
		              yohan394yohan394yohan394yohan394
		              yohan394yohan394yohan394yohan394
		              </p>
	              </div>
	            </div>
	            <div class="col-sm-6 custom">
	            <span class="input_chk">
					<input type="checkbox" id="termsService" name="termsService" class="chk">
					<label for="termsService">�������� ���� �� �̿� ����<span class="terms_necessary">(�ʼ�)</span></label>
				</span>
				<div class="col-sm-12" style="background-color:#f5f6f7;overflow-y:scroll;">	
		            <p> 
		              yohan394yohan394yohan394yohan394
		              yohan394yohan394yohan394yohan394
		              </p>
	              </div>
	            </div>
	            </div>
           	</div>
           </div>
           
           <hr style="border: 1px dashed black;" />
           <div class="row">
            <div class="col-sm-4 ">
              <div class="col-sm-12 input-group custom">
              	<input type="text" placeholder="ȸ���" class="form-control input-lg">
              	<span class="input-group-btn" style="width:0;">
			        <button class="btn-primary btn-lg text-sm" type="button">�ߺ�Ȯ��</button>
			    </span>
              </div>
              <div class="col-sm-12 input-group custom">
              	<input type="number" placeholder="����ڵ�Ϲ�ȣ"  class="form-control input-lg">
              	<span class="input-group-btn" style="width:0;">
			        <button class="btn-primary btn-lg text-sm" type="button">�ߺ�Ȯ��</button>
			    </span>
              </div>
              <div class="col-sm-12 input-group custom">
<!--               	<input type="file" maxlength="3" placeholder="����� ����� �纻 �̹��� ���" class="form-control input-lg"> -->
              	<div class="input-group input-file" name="Fichier1">
		    		<input type="text" class="form-control" placeholder='Choose a file...' />			
		            <span class="input-group-btn">
		        		<button class="btn btn-default btn-choose" type="button">Choose</button>
		    		</span>
				</div>
              </div>
              <div class="col-sm-12 input-group custom"><input type="text" maxlength="4" placeholder="��ǥ�ڸ�"  class="form-control input-lg"></div>
            </div>
            <div class="col-sm-4">
              <div class="col-sm-12 input-group custom"><input type="text" maxlength="3" placeholder="����ڸ�" class="form-control input-lg"></div>
              <div class="col-sm-12 input-group custom"><input type="text" maxlength="4" placeholder="����� �޴���ȭ"  class="form-control input-lg"></div>
              <div class="col-sm-12 input-group custom"><input type="text" maxlength="3" placeholder="����� �̸���" class="form-control input-lg"></div>
            </div>
            <div class="col-sm-4">
	          <div class="col-sm-12 input-group custom"><input type="text" maxlength="3" placeholder="���ݰ�꼭 ���� �̸���" class="form-control input-lg"></div>
              <div class="col-sm-12 input-group custom"><input type="text" maxlength="4" placeholder="�����ȣ"  class="form-control input-lg"></div>
              <div class="col-sm-12 input-group custom"><input type="text" maxlength="3" placeholder="�ּ�" class="form-control input-lg"></div>
            </div>
           
           
           </div>
           <div class="row">
           		<div class="col-sm-12 submit">
           			 <button class="btn-primary btn-lg" type="button">�����ϱ�</button>
           			 <button class="btn-warning btn-lg" type="button">���</button>
           		</div>
           </div>
           </div>  
          </div>


</div>
<!-- div container -->
</div>

  
<script>
// Get the modal
function bs_input_file() {
	$(".input-file").before(
		function() {
			if ( ! $(this).prev().hasClass('input-ghost') ) {
				var element = $("<input type='file' class='input-ghost' style='visibility:hidden; height:0'>");
				element.attr("name",$(this).attr("name"));
				element.change(function(){
					element.next(element).find('input').val((element.val()).split('\\').pop());
				});
				$(this).find("button.btn-choose").click(function(){
					element.click();
				});
				$(this).find("button.btn-reset").click(function(){
					element.val(null);
					$(this).parents(".input-file").find('input').val('');
				});
				$(this).find('input').css("cursor","pointer");
				$(this).find('input').mousedown(function() {
					$(this).parents('.input-file').prev().click();
					return false;
				});
				return element;
			}
		}
	);
}
$(function() {
	bs_input_file();
});

</script>


</body>
</html>