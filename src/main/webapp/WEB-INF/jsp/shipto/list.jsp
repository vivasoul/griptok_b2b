<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="./common/js/common.js"></script>
<script src="./lib/js/jquery.min.js"></script>
<link rel="stylesheet" href="./lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/margin.css">
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet" href="./css/user/shipto.css">
<!-- <link rel="stylesheet" href="./lib/datatable/jquery.dataTables.min.css"> -->
<script src="./lib/datatable/jquery.dataTables.min.js"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="./common/js/util.js" charset="utf-8"></script>
<script>
	var user_no = "<%= session.getAttribute( "user_no" ) %>";
</script>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="m-b-lg">
				<div class="col-md-12">
					<p class="m-t-sm m-b-md margin_l_18 margin_t_15 margin_b_17 grey_font">
						최초 회원 가입시 입력하신 주소가 기본 배송지로 자동 지정됩니다.<br>
						변경을 원하실 경우 배송지를 추가하거나 수정하실 수 있습니다.
					</p>
				</div>
			</div>
		</div>
		<div class="row">
				<div class="col-md-11 nopadding">
					<button onclick="changeDefaultShipping()" id="setdefault" class="gtk-btn gtk-btn-sm gtk-btn-blue text-sm" type="button">기본 배송지로 설정</button>
					<button onclick="deleteShipping()" id="deleteall" class="gtk-btn gtk-btn-sm text-sm" type="button">삭제</button>
				</div>
				<div class="col-md-1 nopadding">
					<button onclick="addShipping()" data-toggle="modal" data-target="#addrModal" id="addshipping" class="gtk-btn gtk-btn-sm gtk-btn-blue text-sm" type="button">배송지 추가</button>
				</div>
		</div>
		<div class="row">
			<table id="shipto-tbl" class="gtk-datatable table table-striped table-bordered hover">
				<colgroup>
					<col width = "6%"/>
					<col width = "16%"/>
					<col width = "40%"/>
					<col width = "9%"/>
					<col width = "13%"/>
					<col width = "16%"/>
				</colgroup>
				<thead>
					<tr>
						<th data-column = "user_no" class="table_h">선택</th>
						<th data-column = "shipto_nm" class="table_h">배송지 이름</th>
						<th data-column = "addr" class="table_h">배송지 주소</th>
						<th data-column = "receiver_nm" class="table_h">받는 사람</th>
						<th data-column = "receiver_tel" class="table_h">휴대폰번호</th>
						<th data-column = "shipto_no" class="table_h">비고</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
<div class="modal fade" id="addrModal" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-body">
            <h3 id="modal_title">배송지 변경</h3>
            <br>            
        <div class="tab-content clearfix">
          <br>
          <fieldset>
           <div class="form-group">
            	<div class="col-sm-11 input-group">
		            <input type="hidden" id="shipto_no" name="shipto_no"/>
		            <input type="hidden" id="main_shipping" name="main_shipping"/>
	          		<input type="text" id="shipto_nm" name="shipto_nm" placeholder="배송지 이름" class="form-control input-lg">
		          </div>
            </div>
            <div class="form-group">
	            <div class="col-sm-11 input-group">
          		<input type="text" id="receiver_nm" name="receiver_nm" placeholder="받는 사람" class="form-control input-lg">
	          </div>
            </div>
            <div class="form-group">
	            <div class="col-sm-11 input-group">
          		<input type="text" id="receiver_tel" name="receiver_tel" maxlength="13" placeholder="휴대전화" class="form-control input-lg">
	          </div>
            </div>
            <div class="form-group">
	            <div class="col-sm-12 input-group">
          		<input type="text" id="post_code" name="post_code" placeholder="우편번호" readonly="readonly" class="form-control input-lg">
	        	<span class="input-group-btn" style="width:0;">
		        	<button onclick="openDaumZipAddress('post_code', 'shipto_addr1', 'shipto_addr2')" class="gtk-btn gtk-btn-blue height_adjusted" type="button">주소찾기</button>
			    </span>
	          </div>
            </div>
            <div class="form-group">
            	<div class="col-sm-11 input-group">
	                <input type="text" id="shipto_addr1" name="shipto_addr_1" placeholder="주소" class="form-control input-lg" readonly="readonly" required>
              </div>
            </div>
            <div class="form-group">
            	<div class="col-sm-11 input-group">
	                <input type="text" id="shipto_addr2" name="shipto_addr_2" placeholder="세부주소" class="form-control input-lg" required>
              </div>
            </div>
          </fieldset>
          <hr>
          <div class="tab-content">
            <div class="tab-pane fade in active text-center">
            <div class="row">
					<div class="col-sm-12 input-group no-addon">
						<button type="button" id="shipto_change_close" class="gtk-btn popup_btn margin_l_15 margin_r_5"
						data-dismiss="modal">취소</button>
						<button id="shipto_change"
						class="gtk-btn gtk-btn-blue popup_btn">
						 확인
					</button>
					<button id="shipto_add"
						class="gtk-btn gtk-btn-blue popup_btn">
						 확인
					</button>
					</div>
			</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="./js/user/shipto.js"></script>
</body>
</html>