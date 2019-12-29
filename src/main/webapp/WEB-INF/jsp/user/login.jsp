<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<div class="container-fluid custom-container">
	<div class="row">
		<div class="mainbox col-sm-12">
			<h3 class="h_tag_center">가입 절차</h3>
			<h4 class="h_tag_center">1. 회원가입 중 사업자 등록증 사본 이미지 등록</h4>
			<h4 class="h_tag_center">2. 승인대기</h4>
			<h4 class="h_tag_center">3. 담당자 확인 후 승인 완료</h4>
			<h4 class="h_tag_center">4. 사이트 로그인 후 이용</h4>
		</div>
	</div>
	<div class="row" id="loginbox">
		<div class="mainbox col-sm-5">
			<div class="row">
				<div style="display: none" id="login-alert"
					class="alert alert-danger col-sm-12"></div>
			</div>
			<div class="row">
				<div class="media-object col-sm-8">
					<div class="col-sm-12 input-group no-addon">
						<input id="login_user_id" name="user_id" type="text"
							placeholder="아이디" class="form-control input-lg">
					</div>
					<div class="col-sm-12 input-group no-addon">
						<input id="login_passwd" name="passwd" type="password"
							placeholder="비밀번호" class="form-control input-lg">
					</div>
				</div>
				<div class="media-object col-sm-4">
					<button class="gtk-btn gtk-btn-fluid gtk-btn-blue" id="btn_login">로그인</button>
				</div>
			</div>
			<div class="row form-group">
				<div class="col-md-12 control">
					<div data-toggle="modal" data-target="#idFinderModal"
						class="login_float">●아이디찾기</div>
					<div data-toggle="modal" data-target="#pwdFinderModal"
						class="login_float">●비밀번호찾기</div>
					<div onclick="location.href='/sign-up'" class="login_float">
						●회원가입</div>
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
				<h3>아이디찾기</h3>
				<ul class="nav nav-tabs">
					<li class="active"><a href="#cell_tab" data-toggle="tab">전화번호</a>
					</li>
					<li><a href="#email_tab" data-toggle="tab">이메일</a></li>
				</ul>
				<br>
				<div class="tab-content clearfix">
					<div class="tab-pane fade in active" id="cell_tab">
						<br>
						<fieldset>
							<div class="form-group">
								<div class="right-inner-addon">
									<i class="fa fa-envelope"></i> <input id="id_cell_ceo_nm"
										class="form-control input-lg" placeholder="이름" type="text">
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-4">
										<input id="id_cell_contact_tel1" maxlength="3"
											class="form-control input-lg" placeholder="010" type="text">
									</div>
									<div class="col-sm-4">
										<input id="id_cell_contact_tel2" maxlength="4"
											class="form-control input-lg" type="text">
									</div>
									<div class="col-sm-4">
										<input id="id_cell_contact_tel3" maxlength="4"
											class="form-control input-lg" type="text">
									</div>
								</div>
							</div>
						</fieldset>
						<div class="row">
							<div class="col-sm-12 notice">*회원가입 시 등록한 이름과 휴대폰 번호 또는
								이메일을 입력하시면 아이디를 확인하실 수 있습니다.</div>
						</div>
						<br>
						<div class="tab-content">
							<div class="tab-pane fade in active text-center">
								<button id="id_cell_finder"
									class="btn btn-primary btn-lg btn-block">
									<i class="fa fa-plus"></i> 확인
								</button>
							</div>
						</div>
					</div>

					<div class="tab-pane fade" id="email_tab">
						<br>
						<fieldset>
							<div class="form-group">
								<div class="right-inner-addon">
									<i class="fa fa-envelope"></i> <input id="id_email_ceo_nm"
										class="form-control input-lg" placeholder="이름" type="text">
								</div>
							</div>
							<div class="form-group">
								<div class="right-inner-addon">
									<i class="fa fa-key"></i> <input id="id_email_email"
										class="form-control input-lg" placeholder="이메일" type="text">
								</div>
							</div>
						</fieldset>
						<div class="row">
							<div class="col-sm-12 notice">*회원가입 시 등록한 이름과 휴대폰 번호 또는
								이메일을 입력하시면 아이디를 확인하실 수 있습니다.</div>
						</div>
						<br>
						<div class=" text-center">
							<button id="id_email_finder"
								class="btn btn-primary btn-lg btn-block">
								<i class="fa fa-plus"></i> 확인
							</button>
						</div>
						<br>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" id="id_finder_close"  class="btn btn-default" data-dismiss="modal">Close</button>
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
				<h3>비밀번호 찾기</h3>
				<ul class="nav nav-tabs">
					<li class="active"><a href="#pass_cell_tab" data-toggle="tab">전화번호</a>
					</li>
					<li><a href="#pass_email_tab" data-toggle="tab">이메일</a></li>
				</ul>
				<br>
				<div class="tab-content clearfix">
					<div class="tab-pane fade in active" id="pass_cell_tab">
						<br>
						<fieldset>
							<div class="form-group">
								<div class="right-inner-addon">
									<i class="fa fa-envelope"></i> <input id="passwd_cell_user_id"
										class="form-control input-lg" placeholder="아이디" type="text">
								</div>
							</div>
							<div class="form-group">
								<div class="right-inner-addon">
									<i class="fa fa-envelope"></i> <input id="passwd_cell_ceo_nm"
										class="form-control input-lg" placeholder="이름" type="text">
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-4">
										<input id="passwd_cell_contact_tel1" maxlength="3"
											class="form-control input-lg" placeholder="010" type="text">
									</div>
									<div class="col-sm-4">
										<input id="passwd_cell_contact_tel2" maxlength="4"
											class="form-control input-lg" type="text">
									</div>
									<div class="col-sm-4">
										<input id="passwd_cell_contact_tel3" maxlength="4"
											class="form-control input-lg" type="text">
									</div>
								</div>
							</div>
						</fieldset>
						<div class="row">
							<div class="col-sm-12 notice">
								*회원가입 시 등록한 아이디와 이름을 입력해주세요.<br> 고객님의 이메일로 임시 비밀번호가 전송됩니다.
							</div>
						</div>
						<br>
						<div class="tab-content">
							<div class="tab-pane fade in active text-center">
								<button id="passwd_cell_finder"
									class="btn btn-primary btn-lg btn-block">
									<i class="fa fa-plus"></i> 확인
								</button>
							</div>
						</div>
					</div>

					<div class="tab-pane fade" id="pass_email_tab">
						<br>
						<fieldset>
							<div class="form-group">
								<div class="right-inner-addon">
									<i class="fa fa-envelope"></i> <input id="passwd_email_user_id"
										class="form-control input-lg" placeholder="아이디" type="text">
								</div>
							</div>
							<div class="form-group">
								<div class="right-inner-addon">
									<i class="fa fa-envelope"></i> <input id="passwd_email_ceo_nm"
										class="form-control input-lg" placeholder="이름" type="text">
								</div>
							</div>
							<div class="form-group">
								<div class="right-inner-addon">
									<i class="fa fa-key"></i> <input id="passwd_email_email"
										class="form-control input-lg" placeholder="이메일" type="text">
								</div>
							</div>
						</fieldset>
						<div class="row">
							<div class="col-sm-12 notice">
								*회원가입 시 등록한 아이디와 이름을 입력해주세요.<br> 고객님의 이메일로 임시 비밀번호가 전송됩니다.
							</div>
						</div>
						<br>
						<div class=" text-center">
							<button id="passwd_email_finder"
								class="btn btn-primary btn-lg btn-block">
								<i class="fa fa-plus"></i> 확인
							</button>
						</div>
						<br>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" id="passwd_finder_close" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>
  
<script src="./js/user/login.js" charset="utf-8"></script>
</body>
</html>