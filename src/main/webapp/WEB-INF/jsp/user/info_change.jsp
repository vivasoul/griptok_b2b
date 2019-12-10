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
			<h3 class="grey_back_title">ȸ������ ����</h3>
		<br>	
		<h5 class="bolded">�⺻����(�ʼ� �Է»���)</h5>
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
				<td class="grey_back_td bolded">���̵�</td>
				<td colspan="3">yoahn394</td>
			</tr>
			<tr>
				<td class="grey_back_td bolded">��й�ȣ</td>
				<td colspan="3">asdfadf</td>
			</tr>
			<tr>
				<td class="grey_back_td bolded">ȸ���</td>
				<td> ���̹�����</td>
				<td class="grey_back_td bolded">����� ��Ϲ�ȣ</td>
				<td>123123123</td>
			</tr>
			<tr>
				<td class="grey_back_td bolded">����� ��Ϲ�ȣ �纻</td>
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
				<td class="grey_back_td bolded">��ǥ��</td>
				<td>������</td>
				<td class="grey_back_td bolded">����/����</td>
				<td>������/�Ǽ�����</td>
			</tr>
			<tr>
				<td class="grey_back_td bolded">�ּ�</td>
				<td colspan="3">
					<p>
					�Է��Ͻ� �ּҴ� �⺻ ������� �Էµ˴ϴ�. <br>
					ȸ�����Խ� ���Ե� �ּҴ� ����� ����� ���� �ּ� �Դϴ�.<br>
					����� ������� ��� �ּҰ� �ٸ� ���  ���������� ������������� ���� �� �߰��� �����մϴ�<br>
					</p>
				</td>
			</tr>	
			<tr>
				<td class="grey_back_td bolded">����ó</td>
				<td>aaaa</td>
				<td class="grey_back_td bolded">���ݰ�꼭���� �̸���</td>
				<td>123</td>
			</tr>
			<tr>
				<td class="grey_back_td bolded">����ڸ�</td>
				<td>aaaa</td>
				<td class="grey_back_td bolded">����� ����ó</td>
				<td>123</td>
			</tr>
			<tr>
				<td class="grey_back_td bolded">����� �̸���</td>
				<td colspan="3">yohan394@hotmail.com</td>
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


<div class="modal fade" id="idFinderModal" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-body">
            <h3>��й�ȣ ����</h3>
            <br>            
        <div class="tab-content clearfix">
          <br>
          <fieldset>
            <div class="form-group">
              <div class="right-inner-addon">
                <i class="fa fa-envelope"></i>
                <input id="old_passwd" class="form-control input-lg" placeholder="���� ��й�ȣ" type="text">
              </div>
            </div>
            <div class="form-group">
            	<div class="right-inner-addon">
	                <i class="fa fa-key"></i>
	                <input id="new_passwd" class="form-control input-lg" placeholder="�� ��й�ȣ" type="text">
              </div>
            </div>
            <div class="form-group">
            	<div class="right-inner-addon">
	                <i class="fa fa-key"></i>
	                <input id="passwd_confirm" class="form-control input-lg" placeholder="��й�ȣ Ȯ��" type="text">
              </div>
            </div>
          </fieldset>
          <hr>
          <div class="tab-content">
            <div class="tab-pane fade in active text-center">
              <button id="id_cell_finder" class="btn btn-primary btn-lg btn-block"><i class="fa fa-plus"></i> ����</button>
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