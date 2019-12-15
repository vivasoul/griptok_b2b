<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="./lib/js/jquery.min.js"></script>
<script src="./lib/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./lib/css/login.css">
<link rel="stylesheet" href="./lib/bootstrap/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="/css/common/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="/css/common/font-awesome.min.css"> -->
<!-- <link rel="stylesheet" href="/css/common/googleapi.css"> -->
</head>
<body>

 <div class="custom-container container">    
		<div class="mainbox col-sm-10 col-sm-offset-2">
			<img class="login_top" src="./lib/img/griptok.png"/>
			<div class="login_top">
				<h2>�׸��� �������� ���θ��Դϴ�.</h2>
				<h4>�� ����Ʈ�� ����ڸ� �̿��� ������ ���� ����Ʈ �Դϴ�.<br>���� ���� �Ϸ� �� �̿��� ���� �մϴ�.</h4>
			</div>
		</div>
		<div class="mainbox col-sm-10 col-sm-offset-2">
			<h3 class="h_tag_center">���� ����</h3>
			<h4 class="h_tag_center">1. ȸ������ �� ����� ����� �纻 �̹��� ���</h4>
			<h4 class="h_tag_center">2. ���δ��</h4>
			<h4 class="h_tag_center">3. ����� Ȯ�� �� ���� �Ϸ�</h4>
			<h4 class="h_tag_center">4. ����Ʈ �α��� �� �̿�</h4>
		</div>

        <div id="loginbox" style="margin-top:50px;" class="mainbox col-sm-8 col-sm-offset-2">    
        	
                        
            <div class="panel panel-info" >

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                                <div class="row" >
						            <div class="media-object col-sm-9">
						            	<div class="col-sm-12 input-group"><input id="login_user_id" name="user_id" type="text" placeholder="���̵�"  class="form-control input-lg"></div>
						            	<div class="col-sm-12 input-group"><input id="login_passwd" name="passwd" type="password" placeholder="��й�ȣ"  class="form-control input-lg"></div>
						            </div>
						            <div class="media-object col-sm-3" >
                                      <button class="btn btn-primary option-button" id="btn_login">�α���</button>
						            </div>
					            </div>
                                    
                                <br>

                                <div class="form-group">
                                    <div class="col-md-12 control">
                                        <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                        </div>
                                        <div data-toggle="modal" data-target="#idFinderModal" class="login_float"> �ܾ��̵�ã��</div>
										<div data-toggle="modal" data-target="#pwdFinderModal" class="login_float"> �ܺ�й�ȣã��</div>
										<div onclick="location.href='/register'"  class="login_float"> ��ȸ������</div>
                                    </div>
                                </div>    
                        </div>                     
                    </div>  
        </div>

  <!-- Id finder Modal -->
  <div class="modal fade" id="idFinderModal" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-body">
            <h3>���̵�ã��</h3>
            <ul class="nav nav-tabs">
              <li class="active">
                <a href="#cell_tab" data-toggle="tab">��ȭ��ȣ</a>                  
              </li>
              <li>
                <a href="#email_tab" data-toggle="tab">�̸���</a>
              </li>
            </ul>
            <br>            
        <div class="tab-content clearfix">
          <div class="tab-pane fade in active" id="cell_tab">
          <br>
          <fieldset>
            <div class="form-group">
              <div class="right-inner-addon">
                <i class="fa fa-envelope"></i>
                <input id="id_cell_ceo_nm" class="form-control input-lg" placeholder="�̸�" type="text">
              </div>
            </div>
            <div class="form-group">
            <div class="row">
            	<div class="col-sm-4">
                	<input id="id_cell_contact_tel1" class="form-control input-lg" placeholder="010" type="text">
                </div>
                <div class="col-sm-4">
                	<input id="id_cell_contact_tel2" class="form-control input-lg" type="text">
                </div>
                <div class="col-sm-4">
                	<input id="id_cell_contact_tel3" class="form-control input-lg" type="text">
                </div>
              </div>
            </div>
          </fieldset>
          <div class="row">
          	<div class="col-sm-12 notice" >
          		*ȸ������ �� ����� �̸��� �޴��� ��ȣ �Ǵ� �̸����� �Է��Ͻø� ���̵� Ȯ���Ͻ� �� �ֽ��ϴ�.
          	</div>
          </div>
          <br>
          <div class="tab-content">
            <div class="tab-pane fade in active text-center">
              <button id="id_cell_finder" class="btn btn-primary btn-lg btn-block"><i class="fa fa-plus"></i> Ȯ��</button>
            </div>
          </div>
        </div>
          
         <div class="tab-pane fade" id="email_tab">
          <br>
          <fieldset>
            <div class="form-group">
              <div class="right-inner-addon">
                <i class="fa fa-envelope"></i>
                <input id="id_email_ceo_nm" class="form-control input-lg" placeholder="�̸�" type="text">
              </div>
            </div>
            <div class="form-group">
              <div class="right-inner-addon">
                <i class="fa fa-key"></i>
                <input id="id_email_email" class="form-control input-lg" placeholder="�̸���" type="text">
              </div>
            </div>
          </fieldset>
          <div class="row">
          	<div class="col-sm-12 notice" >
          		*ȸ������ �� ����� �̸��� �޴��� ��ȣ �Ǵ� �̸����� �Է��Ͻø� ���̵� Ȯ���Ͻ� �� �ֽ��ϴ�.
          	</div>
          </div>
          <br>
          <div class=" text-center">
            <button id="id_email_finder" class="btn btn-primary btn-lg btn-block"><i class="fa fa-plus"></i> Ȯ��</button>
          </div>
           <br>
        </div> 
        
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>

 <!-- Pwd finder Modal -->
  <div class="modal fade" id="pwdFinderModal" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-body">
            <h3>��й�ȣ ã��</h3>
            <ul class="nav nav-tabs">
              <li class="active">
                <a href="#pass_cell_tab" data-toggle="tab">��ȭ��ȣ</a>                  
              </li>
              <li>
                <a href="#pass_email_tab" data-toggle="tab">�̸���</a>
              </li>
            </ul>
            <br>            
        <div class="tab-content clearfix">
          <div class="tab-pane fade in active" id="pass_cell_tab">
          <br>
          <fieldset>
            <div class="form-group">
              <div class="right-inner-addon">
                <i class="fa fa-envelope"></i>
                <input id="passwd_cell_user_id" class="form-control input-lg" placeholder="���̵�" type="text">
              </div>
            </div>
            <div class="form-group">
              <div class="right-inner-addon">
                <i class="fa fa-envelope"></i>
                <input id="passwd_cell_ceo_nm" class="form-control input-lg" placeholder="�̸�" type="text">
              </div>
            </div>
            <div class="form-group">
            <div class="row">
            	<div class="col-sm-4">
                	<input id="passwd_cell_contact_tel1" class="form-control input-lg" placeholder="010" type="text">
                </div>
                <div class="col-sm-4">
                	<input id="passwd_cell_contact_tel2" class="form-control input-lg" type="text">
                </div>
                <div class="col-sm-4">
                	<input id="passwd_cell_contact_tel3" class="form-control input-lg" type="text">
                </div>
              </div>
            </div>
          </fieldset>
          <div class="row">
          	<div class="col-sm-12 notice" >
          		*ȸ������ �� ����� ���̵�� �̸��� �Է����ּ���.<br>
          		������ �̸��Ϸ� �ӽ� ��й�ȣ�� ���۵˴ϴ�.
          	</div>
          </div>
          <br>
          <div class="tab-content">
            <div class="tab-pane fade in active text-center">
              <button id="passwd_cell_finder" class="btn btn-primary btn-lg btn-block"><i class="fa fa-plus"></i> Ȯ��</button>
            </div>
          </div>
        </div>
          
         <div class="tab-pane fade" id="pass_email_tab">
          <br>
          <fieldset>
            <div class="form-group">
              <div class="right-inner-addon">
                <i class="fa fa-envelope"></i>
                <input id="passwd_email_user_id" class="form-control input-lg" placeholder="���̵�" type="text">
              </div>
            </div>
            <div class="form-group">
              <div class="right-inner-addon">
                <i class="fa fa-envelope"></i>
                <input id="passwd_email_ceo_nm" class="form-control input-lg" placeholder="�̸�" type="text">
              </div>
            </div>
            <div class="form-group">
            <div class="right-inner-addon">
                <i class="fa fa-key"></i>
                <input id="passwd_email_email" class="form-control input-lg" placeholder="�̸���" type="text">
              </div>
            </div>
          </fieldset>
          <div class="row">
          	<div class="col-sm-12 notice" >
          		*ȸ������ �� ����� ���̵�� �̸��� �Է����ּ���.<br>
          		������ �̸��Ϸ� �ӽ� ��й�ȣ�� ���۵˴ϴ�.
          	</div>
          </div>
          <br>
          <div class=" text-center">
            <button class="btn btn-primary btn-lg btn-block"><i class="fa fa-plus"></i> Ȯ��</button>
          </div>
           <br>
        </div> 
        
        </div>
        <div class="modal-footer">
          <button id="passwd_email_finder" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>



<!-- div container -->
</div>

  
<script>
// Get the modal
var modal = document.getElementById('id_finder');
var modal2 = document.getElementById('pwd_finder');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }else if(event.target == modal2){
    	modal2.style.display = "none";
    }
}

function openFinder(evt, method, type) {
	  var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName(type+"_tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName(type+"_tablinks");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }
	  document.getElementById(method).style.display = "block";
	  evt.currentTarget.className += " active";
	}
	
function openModal(type){
	document.getElementById(type+'_finder').style.display='block'
	document.getElementById(type+'_finder_initial').click();
}	

//
$("#id_cell_finder").bind("click",function(){
	var checker_vals = ["id_cell_ceo_nm", "id_cell_contact_tel1","id_cell_contact_tel2","id_cell_contact_tel3"];
	if(form_checker(checker_vals)){
	    $.ajax({
	        url : "/login/find/id",
	        type: "post",
	        data : JSON.stringify({ 
	        			"ceo_nm" : $("#id_cell_ceo_nm").val(),
	        			"contact_tel" : $("#id_cell_contact_tel1").val()+$("#id_cell_contact_tel2").val()+$("#id_cell_contact_tel3").val()
	        	   }),
	     	contentType: "application/json",
	        success : function(responseData){
	        	var user_id = responseData.result;
	        	if(user_id==null){
	        		alert("�ش� ������ ��ϵ� ���̵� �������� �ʽ��ϴ�.");
	        	}else{
	        		alert("ȸ������ ���̵�� " + user_id + "�Դϴ�.");
	        	}
	        }
	    });
	}else{
		alert("�� ĭ�� �� ä���ּ���.");
	}
});

$("#id_email_finder").bind("click",function(){
	var checker_vals = ["id_email_ceo_nm", "id_email_email"];
	if(form_checker(checker_vals)){
	    $.ajax({
	        url : "/login/find/id",
	        type: "post",
	        data : JSON.stringify({ 
	        			"ceo_nm" : $("#id_email_ceo_nm").val(),
	        			"tax_email" : $("#id_email_email").val()
	        	   }),
	   	    contentType: "application/json",
	        success : function(responseData){
	        	var user_id = responseData.result;
	        	if(user_id==null){
	        		alert("�ش� ������ ��ϵ� ���̵� �������� �ʽ��ϴ�.");
	        	}else{
	        		alert("ȸ������ ���̵�� " + user_id + "�Դϴ�.");
	        	}
	        }
	    });
	}else{
		alert("�� ĭ�� �� ä���ּ���");
	}   
	    
});


$("#passwd_cell_finder").bind("click",function(){
    $.ajax({
        url : "/login/find/passwd",
        type: "post",
        data : JSON.stringify({ 
        			"user_id" : $("#passwd_cell_user_id").val(),
        			"ceo_nm" : $("#passwd_cell_ceo_nm").val(),
        			"contact_tel" : $("#passwd_cell_contact_tel").val()
        	   }),
     	contentType: "application/json",
        success : function(responseData){
        	var user_id = responseData.result;
        	if(user_id==null){
        		alert("�ش� ������ ��ϵ� ���̵� �������� �ʽ��ϴ�.");
        	}else{
        		alert("ȸ������ ���̵�� " + user_id + "�Դϴ�.");
        	}
        }
    });
});

$("#passwd_email_finder").bind("click",function(){
    $.ajax({
        url : "/login/find/passwd",
        type: "post",
        data : JSON.stringify({ 
        			"user_id" : $("#passwd_email_user_id").val(),
        			"ceo_nm" : $("#passwd_email_ceo_nm").val(),
        			"tax_email" : $("#passwd_email_email").val()
        	   }),
   	    contentType: "application/json",
        success : function(responseData){
        	var user_id = responseData.result;
        	if(user_id==null){
        		alert("�ش� ������ ��ϵ� ���̵� �������� �ʽ��ϴ�.");
        	}else{
        		alert("ȸ������ ���̵�� " + user_id + "�Դϴ�.");
        	}
        }
    });
});

$("#btn_login").bind("click",function(){
	var checker_vals = ["login_user_id", "login_passwd"];
	if(form_checker(checker_vals)){
	    $.ajax({
	        url : "/login/connect",
	        type: "post",
	        data : JSON.stringify({ 
	        			"user_id" : $("#login_user_id").val(),
	        			"passwd" : $("#login_passwd").val()
	        	   }),
	    	contentType: "application/json",
	        success : function(responseData){
	        	if(responseData.result==1){
	        		alert("�������̵�");
	        	}else{
	        		alert("���̵� �Ǵ� ��й�ȣ�� �ùٸ��� �ʽ��ϴ�.")
	        	}
	        }
	    });
	}else{
		alert("��ĭ�� �� ä���ּ���.");
	}
});

function form_clear(){
	
}

function form_checker(_vals, highlight_needed){
	var return_val = true;
	if(_vals.length>0){
		_vals.forEach(function(item, index){
			if($("#"+item).val()==""){
				if(highlight_needed) $("#"+item).css("border-color","red");
				return_val = false;
			}
		})
	}
	return return_val;
}

</script>


</body>
</html>