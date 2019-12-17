package com.griptk.b2b.user.domain;

import org.springframework.web.multipart.MultipartFile;

public class WithdrawalVO {
	
	private String user_id;
	
	private String passwd;
	
	private String code;
	
	private String remark;

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
		return "WithdrawVO [user_id=" + user_id + ", passwd=" + passwd + ", code=" + code + ", remark=" + remark + "]";
	}
	
	

}
