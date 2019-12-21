package com.griptk.b2b.user.domain;

import org.springframework.web.multipart.MultipartFile;

public class WithdrawalVO {
	
	private int user_no;
	
	private String user_id;
	
	private String passwd;
	
	private String code;
	
	private String remark;

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "WithdrawalVO [user_no=" + user_no + ", user_id=" + user_id + ", passwd=" + passwd + ", code=" + code
				+ ", remark=" + remark + "]";
	}

}
