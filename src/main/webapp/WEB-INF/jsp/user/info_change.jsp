<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="./lib/js/jquery.min.js"></script>
<script src="./lib/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./lib/css/withdrawal.css">
<link rel="stylesheet" href="./lib/bootstrap/css/bootstrap.min.css">
</head>
<body>

 <div class="custom-container container">    
		<div class="mainbox col-sm-10 col-sm-offset-2">
		<br>
      	<br>
      	<br>
	
		<table style="border-collapse: collapse;width:100%">
			<tbody style="width: 100%;display: table;">
			<tr>
				<td>
				</td>
			</tr>	
			<tr>
				<td>
				</td>
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