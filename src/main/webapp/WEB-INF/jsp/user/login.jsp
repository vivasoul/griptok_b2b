<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>

<script>
	var registered = "<%=session.getAttribute("registered")%>";
	var init_user_no = "<%=request.getParameter("init_no")%>";
	var key = "<%=request.getParameter("key")%>";
</script>
<script src="./common/js/util.js" charset="utf-8"></script>
<%
	session.invalidate();
%>

<div class="container-fluid custom-container griptok-body">
	<div class="login-middle-pad"></div>
	<div class="row login-content" id="loginbox">
		<div class="mainbox col-sm-12">
			<div class="row">
				<div style="display: none" id="login-alert"
					class="alert alert-danger col-sm-12"></div>
			</div>
			<div class="row">
				<div class="media-object col-sm-8">
					<div class="col-sm-12 input-group no-addon">
						<input id="login_user_id" name="user_id" type="text" placeholder="아이디" class="form-control input-lg">
					</div>
					<div class="col-sm-12 input-group no-addon">
						<input id="login_passwd" name="passwd" type="password" placeholder="비밀번호" class="form-control input-lg">
					</div>
				</div>
				<div class="media-object col-sm-4">
					<button class="gtk-btn gtk-btn-fluid gtk-btn-blue" id="btn_login">로그인</button>
				</div>
			</div>
			<div class="row form-group">
				<div class="col-md-12 control login-option-group">
					<div data-toggle="modal" data-target="#idFinderModal"
						id = "id_finder_opener"	class="login_float"><span class="option-icon">●</span><span class="option-text">아이디 찾기</span></div>
					<div data-toggle="modal" data-target="#pwdFinderModal"
						id = "pwd_finder_opener" class="login_float"><span class="option-icon">●</span><span class="option-text">비밀번호 찾기</span></div>
					<div onclick="location.href='/sign-up'" class="login_float">
						<span class="option-icon">●</span>회원 가입</div>
					<button data-toggle="modal" data-target="#authModal"
						id="auth_modal_poper" class="hidden"></button>
					<button data-toggle="modal" data-target="#pwChangeModal"
						id="pwchange_modal_poper" class="hidden"></button>	
				</div>
			</div>
		</div>
	</div>
	<div class="row login-content">
		<div class="login-guide-box col-sm-12">
			<div class="guide-title">가입 절차</div>
			<div class="guide-content">1. 회원가입 중 사업자 등록증 사본 이미지 등록</div>
			<div class="guide-content">2. 승인대기</div>
			<div class="guide-content">3. 담당자 확인 후 승인 완료</div>
			<div class="guide-content">4. 사이트 로그인 후 이용</div>
		</div>
	</div>
</div>
<!-- Id finder Modal -->
<div class="modal fade" id="idFinderModal" role="dialog">
	<div class="modal-dialog width_480">
		<div class="modal-content modal_border">
			<div class="modal-body">
				<h4 class="margin_l_15">아이디찾기</h4>
				<br>
				<ul class="nav nav-tabs">
					<li class="active"><a href="#cell_tab" data-toggle="tab">휴대폰번호</a>
					</li>
					<li><a href="#email_tab" data-toggle="tab">이메일</a></li>
				</ul>
				<br>
				<div class="tab-content clearfix">
					<div class="tab-pane fade in active" id="cell_tab">
						<br>
						<fieldset>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-2"></div>
									<div class="col-sm-8 ">
										<div class="row">
											<div class="col-sm-12 input-group no-addon">
													<input id="id_cell_manager_nm" class="width_290 input_holder" placeholder="이름" type="text">
											</div>
										</div>
									</div>
									<div class="col-sm-2"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-2"></div>
									<div class="col-sm-8">
										<div class="row">
											<div class="col-sm-12 input-group no-addon">
												<div class="float_l">
												<input id="id_cell_manager_tel1" maxlength="3"
													class="width_70 margin_r_15 input_holder" placeholder="010" type="text">
												</div>
												<div class="float_l">
												<input id="id_cell_manager_tel2" maxlength="4"
													class="width_95 margin_r_15 input_holder" type="text">
												</div>
												<div class="float_l">
												<input id="id_cell_manager_tel3" maxlength="4"
													class="width_95 input_holder" type="text">
												</div>	
											</div>
											</div>
									</div>
									<div class="col-sm-2"></div>
									</div>
							</div>
						</fieldset>
						<br>
						<div class="row">
							<div class="col-sm-2"></div>
							<div class="col-sm-8 notice small_font">회원가입 시 등록한 이름과
								휴대폰 번호 또는 이메일을 입력하시면 아이디를 확인하실 수 있습니다.</div>
							<div class="col-sm-2"></div>
						</div>
						<br>
						<div class="tab-content">
							<div class="col-sm-2"></div>
							<div class="col-sm-8 ">
								<div class="row">
										<div class="col-sm-12 input-group no-addon">
											<button type="button" id="id_finder_close" class="gtk-btn popup_btn margin_l_15 margin_r_5"
											data-dismiss="modal">취소</button>
											<button id="id_cell_finder"
											class="gtk-btn gtk-btn-blue popup_btn">
											확인
										</button>
										</div>
								</div>
							</div>
							<div class="col-sm-2"></div>
						</div>
					</div>

					<div class="tab-pane fade" id="email_tab">
						<br>
						<fieldset>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-2"></div>
									<div class="col-sm-8 ">
										<div class="row">
											<div class="col-sm-12 input-group no-addon">
													<input id="id_email_manager_nm" class="width_290 input_holder" placeholder="이름" type="text">
											</div>
										</div>
									</div>
									<div class="col-sm-2"></div>
								</div>
							</div>
							
							<div class="form-group">
								<div class="row">
									<div class="col-sm-2"></div>
									<div class="col-sm-8 ">
										<div class="row">
											<div class="col-sm-12 input-group no-addon">
													<input id="id_email_manager_email" class="width_290 input_holder" placeholder="이메일" type="text">
											</div>
										</div>
									</div>
									<div class="col-sm-2"></div>
								</div>
							</div>
						</fieldset>
						<br>
						<div class="row">
							<div class="col-sm-2"></div>
							<div class="col-sm-8 notice small_font">회원가입 시 등록한 이름과
								휴대폰 번호 또는 이메일을 입력하시면 아이디를 확인하실 수 있습니다.</div>
							<div class="col-sm-2"></div>
						</div>
						<br>
						
						
						<div class="tab-content">
							<div class="col-sm-2"></div>
							<div class="col-sm-8 ">
								<div class="row">
										<div class="col-sm-12 input-group no-addon">
											<button type="button" id="id_finder_close" class="gtk-btn popup_btn margin_l_15 margin_r_5"
											data-dismiss="modal">취소</button>
											<button id="id_email_finder"
											class="gtk-btn gtk-btn-blue popup_btn">
											<i class="fa fa-plus"></i> 확인
										</button>
										</div>
								</div>
							</div>
							<div class="col-sm-2"></div>
						</div>
						<br>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>

<!-- Pwd finder Modal -->
<div class="modal fade" id="pwdFinderModal" role="dialog">
	<div class="modal-dialog width_480">
		<div class="modal-content modal_border">
			<div class="modal-body">
				<h4 class="margin_l_15">비밀번호 찾기</h4>
				<br>
				<ul class="nav nav-tabs">
					<li class="active"><a href="#pass_cell_tab" data-toggle="tab">휴대폰번호</a>
					</li>
					<li><a href="#pass_email_tab" data-toggle="tab">이메일</a></li>
				</ul>
				<br>
				<div class="tab-content clearfix">
					<div class="tab-pane fade in active" id="pass_cell_tab">
						<br>
						<fieldset>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-2"></div>
									<div class="col-sm-8 ">
										<div class="row">
											<div class="col-sm-12 input-group no-addon">
													<input id="passwd_cell_user_id" class="width_290 input_holder" placeholder="아이디" type="text">
											</div>
										</div>
									</div>
									<div class="col-sm-2"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-2"></div>
									<div class="col-sm-8 ">
										<div class="row">
											<div class="col-sm-12 input-group no-addon">
													<input id="passwd_cell_manager_nm" class="width_290 input_holder" placeholder="이름" type="text">
											</div>
										</div>
									</div>
									<div class="col-sm-2"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-2"></div>
									<div class="col-sm-8">
										<div class="row">
											<div class="col-sm-12 input-group no-addon">
												<input id="passwd_cell_manager_tel1" maxlength="3" class="width_70 margin_r_15 input_holder" placeholder="010" type="text">
												<input id="passwd_cell_manager_tel2" maxlength="4" class="width_95 margin_r_15 input_holder" type="text">
												<input id="passwd_cell_manager_tel3" maxlength="4" class="width_95 input_holder" type="text">
											</div>
											</div>
									</div>
									<div class="col-sm-2"></div>
									</div>
							</div>
						
						</fieldset>
						<br>
						<div class="row">
							<div class="col-sm-2"></div>
							<div class="col-sm-8 notice small_font">회원가입 시 등록한 아이디와 이름을 입력해주세요.<br> 고객님의 이메일로 임시 비밀번호가 전송됩니다.</div>
							<div class="col-sm-2"></div>
						</div>
						<br>
						
						
						<div class="tab-content">
							<div class="col-sm-2"></div>
							<div class="col-sm-8 ">
								<div class="row">
										<div class="col-sm-12 input-group no-addon">
											<button type="button" class="gtk-btn popup_btn margin_l_15 margin_r_5"
											data-dismiss="modal">취소</button>
											<button id="passwd_cell_finder"
											class="gtk-btn gtk-btn-blue popup_btn">
											 확인
										</button>
										</div>
								</div>
							</div>
							<div class="col-sm-2"></div>
						</div>
						
					</div>

					<div class="tab-pane fade" id="pass_email_tab">
						<br>
						<fieldset>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-2"></div>
									<div class="col-sm-8 ">
										<div class="row">
											<div class="col-sm-12 input-group no-addon">
													<input id="passwd_email_user_id" class="width_290 input_holder" placeholder="아이디" type="text">
											</div>
										</div>
									</div>
									<div class="col-sm-2"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-2"></div>
									<div class="col-sm-8 ">
										<div class="row">
											<div class="col-sm-12 input-group no-addon">
													<input id="passwd_email_ceo_nm" class="width_290 input_holder" placeholder="이름" type="text">
											</div>
										</div>
									</div>
									<div class="col-sm-2"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-2"></div>
									<div class="col-sm-8 ">
										<div class="row">
											<div class="col-sm-12 input-group no-addon">
													<input id="passwd_email_email" class="width_290 input_holder" placeholder="이메일" type="text">
											</div>
										</div>
									</div>
									<div class="col-sm-2"></div>
								</div>
							</div>
						
						</fieldset>
						<br>
						<div class="row">
							<div class="col-sm-2"></div>
							<div class="col-sm-8 notice small_font">회원가입 시 등록한 아이디와 이름을 입력해주세요.<br> 고객님의 이메일로 임시 비밀번호가 전송됩니다.</div>
							<div class="col-sm-2"></div>
						</div>
						<br>
						<div class="tab-content">
							<div class="col-sm-2"></div>
							<div class="col-sm-8 ">
								<div class="row">
										<div class="col-sm-12 input-group no-addon">
											<button type="button" class="gtk-btn popup_btn margin_l_15 margin_r_5"
											data-dismiss="modal">취소</button>
											<button id="passwd_email_finder"
											class="gtk-btn gtk-btn-blue popup_btn">
											 확인
										</button>
										</div>
								</div>
							</div>
							<div class="col-sm-2"></div>
						</div>
					</div>
					<br>
				</div>

			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="authModal" role="dialog">
	<div class="modal-dialog modal-sm">
		<div class="modal-content modal_border">
			<div class="modal-body">
				<div class="tab-content clearfix">
					<br> <br>
					<h2 class="h_tag_center bolded">승인대기중입니다.</h2>
					<br> <br> <br> <br>
					<h5 class="h_tag_left">관리자가 승인 절차를 확인 중입니다.</h5>
					<br>
					<h5 class="h_tag_left">승인완료 후 사이트를 이용하실 수 있습니다.</h5>
					<br>
					<h5 class="h_tag_left">감사합니다.</h5>
					<br> <br>
					<div class="tab-content">
						<div class="tab-pane fade in active text-center">
							<div class="col-sm-3"></div>
							<div class="col-sm-6">
								<button id="auth_confirm"
									class="btn btn_blue btn-lg btn-block" data-dismiss="modal">
									확인</button>
							</div>
							<div class="col-sm-3"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="pwChangeModal" role="dialog">
    <div class="modal-dialog width_480">
      <div class="modal-content">
        <div class="modal-body">
            <h3 class="h_tag_center">비밀번호 변경</h3>
            <br>            
        <div class="tab-content clearfix">
          <br>
          <fieldset>
            <div class="form-group">
              <div class="right-inner-addon">
                <input id="init_user_no" type="hidden"/>
                <input id="init_passwd" type="hidden"/>
              </div>
            </div>
            <div class="form-group">
            	<div class="right-inner-addon">
	                <input id="new_passwd" class="form-control input-lg" placeholder="새 비밀번호" type="password">
              </div>
            </div>
            <div class="form-group">
            	<div class="right-inner-addon">
	                <input id="new_passwd_check" class="form-control input-lg" placeholder="비밀번호 확인" type="password">
              </div>
            </div>
          </fieldset>
          <hr>
          <div class="tab-content">
            <div class="tab-pane fade in active text-center">
            <div class="col-sm-6">  
              <button id="passwd_change_close" class="btn btn-lg btn-block" data-dismiss="modal"><i class="fa fa-plus"></i> 취소</button>
            </div>
            <div class="col-sm-6">
              <button id="btn_passwd_change" class="btn btn-primary btn-lg btn-block"><i class="fa fa-plus"></i> 확인</button>
            </div>
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



<script src="./js/user/login.js" charset="utf-8"></script>
</body>
</html>