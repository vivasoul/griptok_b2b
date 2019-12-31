package com.griptk.b2b.user.domain;

import org.springframework.web.multipart.MultipartFile;

public class PasswdVO {
	private String old_passwd;
	
	private String init_passwd;
	
	private String new_passwd;
	
	private int user_no;

	public String getOld_passwd() {
		return old_passwd;
	}

	public void setOld_passwd(String old_passwd) {
		this.old_passwd = old_passwd;
	}
	
	public String getInit_passwd() {
		return init_passwd;
	}

	public void setInit_passwd(String init_passwd) {
		this.init_passwd = init_passwd;
	}

	public String getNew_passwd() {
		return new_passwd;
	}

	public void setNew_passwd(String new_passwd) {
		this.new_passwd = new_passwd;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	@Override
	public String toString() {
		return "PasswdVO [old_passwd=" + old_passwd + ", init_passwd=" + init_passwd + ", new_passwd=" + new_passwd
				+ ", user_no=" + user_no + "]";
	}

}
