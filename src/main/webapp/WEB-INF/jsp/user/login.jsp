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
                    <div class="panel-heading">
                        <div class="panel-title">�α���</div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                        <form id="loginform" class="form-horizontal" role="form">
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="login_user_id" type="text" class="form-control" name="username" value="" placeholder="username or email">                                        
                                    </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="login_passwd" type="password" class="form-control" name="password" placeholder="password">
                                    </div>
                                    

                                


                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->

                                    <div class="col-sm-12 controls">
                                      <a id="btn_login" href="#" class="btn btn-primary">Login  </a>

                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-md-12 control">
                                        <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                        </div>
                                        <div data-toggle="modal" data-target="#idFinderModal" class="login_float"> �ܾ��̵�ã��</div>
										<div data-toggle="modal" data-target="#pwdFinderModal" class="login_float"> �ܺ�й�ȣã��</div>
										<div onclick="location.href='/register'"  class="login_float"> ��ȸ������</div>
                                    </div>
                                </div>    
                            </form>     
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
            <div class="right-inner-addon">
                <i class="fa fa-key"></i>
                <input id="id_cell_contact_tel" class="form-control input-lg" placeholder="�޴�����ȣ" type="text">
              </div>
            </div>
          </fieldset>
          <hr>
          <div class="tab-content">
            <div class="tab-pane fade in active text-center" id="pp">
              <button id="id_cell_finder" class="btn btn-primary btn-lg btn-block"><i class="fa fa-plus"></i> ����</button>
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
                <input id="id_email_email" class="form-control input-lg" placeholder="�̸���" type="password">
              </div>
            </div>
          </fieldset>
          <br>
          <div class=" text-center">
            <button id="id_email_finder" class="btn btn-primary btn-lg btn-block"><i class="fa fa-plus"></i> ���̵� ã��</button>
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
                <input class="form-control input-lg" placeholder="e-Mail Address" type="text">
              </div>
            </div>
            <div class="form-group">
            <div class="right-inner-addon">
                <i class="fa fa-key"></i>
                <input class="form-control input-lg" placeholder="Password" type="password">
              </div>
            </div>
          </fieldset>
          <hr>
          <div class="tab-content">
            <div class="tab-pane fade in active text-center" id="pp">
              <button class="btn btn-primary btn-lg btn-block"><i class="fa fa-plus"></i> ����</button>
            </div>
          </div>
        </div>
          
         <div class="tab-pane fade" id="email_tab">
          <br>
          <fieldset>
            <div class="form-group">
              <div class="right-inner-addon">
                <i class="fa fa-envelope"></i>
                <input class="form-control input-lg" placeholder="e-Mail Address" type="text">
              </div>
            </div>
            <div class="form-group">
              <div class="right-inner-addon">
                <i class="fa fa-key"></i>
                <input class="form-control input-lg" placeholder="Password" type="password">
              </div>
            </div>
          </fieldset>
          <br>
          <div class=" text-center">
            <button class="btn btn-primary btn-lg btn-block"><i class="fa fa-plus"></i> Create Account</button>
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
    $.ajax({
        url : "/login/find/id",
        type: "post",
        data : JSON.stringify({ 
        			"ceo_nm" : $("#id_cell_ceo_nm").val(),
        			"contact_tel" : $("#id_cell_contact_tel").val()
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

$("#id_email_finder").bind("click",function(){
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
});

$("#btn_login").bind("click",function(){
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
});


</script>


</body>
</html>