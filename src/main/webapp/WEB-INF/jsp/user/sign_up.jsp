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
                    	
                    	
		<form id="sign_up_form">                    	
      	   <div class="row" >
            <div class="col-sm-4">
              	<div class="col-sm-12 input-group custom">
			    <input name="user_id" id="user_id" type="text" class="form-control input-lg" placeholder="���̵�">
			    <span class="input-group-btn" style="width:0;">
			        <button id="id_check" class="btn-primary btn-lg" type="button">�ߺ�Ȯ��</button>
			    </span>
			   </div>
               <div class="col-sm-12 input-group custom"><input id="passwd" name="passwd" type="password" placeholder="��й�ȣ"  class="form-control input-lg"></div>
               <div class="col-sm-12 input-group custom"><input id="passwd_check" name="passwd_check" type="password" placeholder="��й�ȣ Ȯ��"  class="form-control input-lg"></div>
               <div class="col-sm-12 input-group custom"><input id="contact_tel" name="contact_tel" type="text" placeholder="��ȭ��ȣ"  class="form-control input-lg"></div>
            </div>
            <div class="col-sm-8">
            	<span class="input_chk">
					<input type="checkbox" id="termsService" name="termsService" class="chk">
					<label for="termsService">��ü ����<span class="terms_necessary">(�ʼ�)</span></label>
				</span>
            	<div class="col-sm-12" style="border:1px solid #dadada">
	            <div class="col-sm-6 custom" >
	            <span class="input_chk">
					<input type="checkbox" id="termsService2" name="termsService2" class="chk">
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
					<input type="checkbox" id="termsService3" name="termsService3" class="chk">
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
              	<input type="text" id="company_nm" name="company_nm" placeholder="ȸ���" class="form-control input-lg">
              	<span class="input-group-btn" style="width:0;">
			        <button id="company_nm_check" class="btn-primary btn-lg text-sm" type="button">�ߺ�Ȯ��</button>
			    </span>
              </div>
              <div class="col-sm-12 input-group custom">
              	<input type="number" id="biz_reg_number" name="biz_reg_number" placeholder="����ڵ�Ϲ�ȣ"  class="form-control input-lg">
              	<span class="input-group-btn" style="width:0;">
			        <button id="biz_reg_number_check" class="btn-primary btn-lg text-sm" type="button">�ߺ�Ȯ��</button>
			    </span>
              </div>
              <div class="col-sm-12 input-group custom">
<!--               	<input type="file" maxlength="3" placeholder="����� ����� �纻 �̹��� ���" class="form-control input-lg"> -->
              	<div class="input-group input-file">
		    		<input id="file_nm" name="file_nm" type="text" class="form-control" placeholder='Choose a file...' />			
		            <span class="input-group-btn">
		        		<button class="btn btn-default btn-choose" type="button">Choose</button>
		    		</span>
				</div>
              </div>
              <div class="col-sm-12 input-group custom"><input type="text" id="ceo_nm" name="ceo_nm" placeholder="��ǥ�ڸ�"  class="form-control input-lg"></div>
            </div>
            <div class="col-sm-4">
              <div class="col-sm-12 input-group custom"><input type="text" id="manger_nm" name="manager_nm" placeholder="����ڸ�" class="form-control input-lg"></div>
              <div class="col-sm-12 input-group custom"><input type="text" id="manager_tel" name="manager_tel" placeholder="����� �޴���ȭ"  class="form-control input-lg"></div>
              <div class="col-sm-12 input-group custom"><input type="text" id="manager_email" name="manager_email" placeholder="����� �̸���" class="form-control input-lg"></div>
            </div>
            <div class="col-sm-4">
	          <div class="col-sm-12 input-group custom"><input type="text" id="tax_email" name="tax_email" placeholder="���ݰ�꼭 ���� �̸���" class="form-control input-lg"></div>
              <div class="col-sm-12 input-group custom"><input type="text" id="biz_category" name="biz_category" placeholder="�����ȣ"  class="form-control input-lg"></div>
              <div class="col-sm-12 input-group custom"><input type="text" id="biz_addr" name="biz_addr" placeholder="�ּ�" class="form-control input-lg"></div>
            </div>
           
           
           </div>
           <div class="row">
           		<div class="col-sm-12 submit">
           			 <button id="sign_up" class="btn-primary btn-lg" type="button">�����ϱ�</button>
           			 <button class="btn-warning btn-lg" type="button">���</button>
           		</div>
           </div>
          	</form>
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


// user_id_check button bind
$("#id_check").bind("click",function(){
    $.ajax({
        url : "/sign_up/check/id",
        type: "post",
        data : { "user_id" : $("#user_id").val() },
        success : function(responseData){
        	if(responseData.result==0){
        		alert("��밡���� Id�Դϴ�.");
        	}else{
        		alert("������� Id�Դϴ�. �ٸ� Id�� ������ּ���.")
        	}
        }
    });
});


//company_nm_check button bind
$("#company_nm_check").bind("click",function(){
    $.ajax({
        url : "/sign_up/check/company_nm",
        type: "post",
        data : { "company_nm" : $("#company_nm").val() },
        success : function(responseData){
        	if(responseData.result==0){
        		alert("��밡���� ȸ����Դϴ�.");
        	}else{
        		alert("������� ȸ����Դϴ�. �ٸ� ȸ����� ������ּ���.")
        	}
        }
    });
});

//biz_reg_number_check button bind
$("#biz_reg_number_check").bind("click",function(){
    $.ajax({
        url : "/sign_up/check/biz_reg_number",
        type: "post",
        data : { "biz_reg_number" : $("#biz_reg_number").val() },
        success : function(responseData){
        	if(responseData.result==0){
        		alert("��밡���� ����ڹ�ȣ�Դϴ�.");
        	}else{
        		alert("������� ����ڹ�ȣ�Դϴ�. �ٸ� ����ڹ�ȣ�� ������ּ���.")
        	}
        }
    });
});

$("#sign_up").bind("click",function(){
    $.ajax({
        url : "/sign_up/sign_up",
        type: "post",
        data : JSON.stringify(jQuery('#sign_up_form').serializeObject()),
        contentType: "application/json",
        success : function(responseData){
        	console.log(responseData);
        }
    });
});

jQuery.fn.serializeObject = function() {
    var obj = null;
    try {
        if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
            var arr = this.serializeArray();
            if (arr) {
                obj = {};
                jQuery.each(arr, function() {
                    obj[this.name] = this.value;
                });
            }//if ( arr ) {
        }
    } catch (e) {
        alert(e.message);
    } finally {
    }
 
    return obj;
};





</script>


</body>
</html>