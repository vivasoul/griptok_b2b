package com.griptk.b2b.user.domain;

public class ShipToVO {
	
	private int user_no;
	
	private String receiver_nm;
	
	private String addr;
	
	private String shipto_addr1;
	
	private String shipto_addr2;
	
	private String receiver_tel;
	
	private String reg_dt;
	
	private int shipto_no;
	
	private String shipto_nm;
	
	private String upd_dt;
	
	private String post_code;
	
	private String main_shipping;

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getReceiver_nm() {
		return receiver_nm;
	}

	public void setReceiver_nm(String receiver_nm) {
		this.receiver_nm = receiver_nm;
	}
	
	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getShipto_addr1() {
		return shipto_addr1;
	}

	public void setShipto_addr1(String shipto_addr1) {
		this.shipto_addr1 = shipto_addr1;
	}

	public String getShipto_addr2() {
		return shipto_addr2;
	}

	public void setShipto_addr2(String shipto_addr2) {
		this.shipto_addr2 = shipto_addr2;
	}

	public String getReceiver_tel() {
		return receiver_tel;
	}

	public void setReceiver_tel(String receiver_tel) {
		this.receiver_tel = receiver_tel;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	

	public int getShipto_no() {
		return shipto_no;
	}

	public void setShipto_no(int shipto_no) {
		this.shipto_no = shipto_no;
	}

	public String getShipto_nm() {
		return shipto_nm;
	}

	public void setShipto_nm(String shipto_nm) {
		this.shipto_nm = shipto_nm;
	}

	public String getUpd_dt() {
		return upd_dt;
	}

	public void setUpd_dt(String upd_dt) {
		this.upd_dt = upd_dt;
	}
	
	public String getPost_code() {
		return post_code;
	}

	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}

	public String getMain_shipping() {
		return main_shipping;
	}

	public void setMain_shipping(String main_shipping) {
		this.main_shipping = main_shipping;
	}

	@Override
	public String toString() {
		return "ShipToVO [user_no=" + user_no + ", receiver_nm=" + receiver_nm + ", addr=" + addr + ", shipto_addr1="
				+ shipto_addr1 + ", shipto_addr2=" + shipto_addr2 + ", receiver_tel=" + receiver_tel + ", reg_dt="
				+ reg_dt + ", shipto_no=" + shipto_no + ", shipto_nm=" + shipto_nm + ", upd_dt=" + upd_dt
				+ ", post_code=" + post_code + ", main_shipping=" + main_shipping + "]";
	}
	
}
