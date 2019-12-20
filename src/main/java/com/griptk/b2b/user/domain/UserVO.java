package com.griptk.b2b.user.domain;

import org.springframework.web.multipart.MultipartFile;

public class UserVO {
	
	private int user_no;
	
	// login
	private String passwd;
	
	private String reg_dt;
	
	private String upd_dt;
	
	private String aprv_status;
	

	private MultipartFile real_file;
	
	private String file_nm;
	
	// user
	private String user_id;
	
	private String company_nm;
	
	private String biz_reg_number;
	
	private String ceo_nm;
	
	private String biz_category;
	
	private String post_code;
	
	private String biz_addr_1;
	
	private String biz_addr_2;
	
	private String contact_tel;
	
	private String tax_email;
	
	private String manager_nm;
	
	private String manager_tel;
	
	private String manager_email;
	
	private int biz_img_no;

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getUpd_dt() {
		return upd_dt;
	}

	public void setUpd_dt(String upd_dt) {
		this.upd_dt = upd_dt;
	}

	public String getAprv_status() {
		return aprv_status;
	}

	public void setAprv_status(String aprv_status) {
		this.aprv_status = aprv_status;
	}
	
	public MultipartFile getReal_file() {
		return real_file;
	}

	public void setReal_file(MultipartFile real_file) {
		this.real_file = real_file;
	}

	public String getFile_nm() {
		return file_nm;
	}

	public void setFile_nm(String file_nm) {
		this.file_nm = file_nm;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCompany_nm() {
		return company_nm;
	}

	public void setCompany_nm(String company_nm) {
		this.company_nm = company_nm;
	}

	public String getBiz_reg_number() {
		return biz_reg_number;
	}

	public void setBiz_reg_number(String biz_reg_number) {
		this.biz_reg_number = biz_reg_number;
	}

	public String getCeo_nm() {
		return ceo_nm;
	}

	public void setCeo_nm(String ceo_nm) {
		this.ceo_nm = ceo_nm;
	}

	public String getBiz_category() {
		return biz_category;
	}

	public void setBiz_category(String biz_category) {
		this.biz_category = biz_category;
	}

	public String getPost_code() {
		return post_code;
	}

	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}

	public String getBiz_addr_1() {
		return biz_addr_1;
	}

	public void setBiz_addr_1(String biz_addr_1) {
		this.biz_addr_1 = biz_addr_1;
	}

	public String getBiz_addr_2() {
		return biz_addr_2;
	}

	public void setBiz_addr_2(String biz_addr_2) {
		this.biz_addr_2 = biz_addr_2;
	}

	public String getContact_tel() {
		return contact_tel;
	}

	public void setContact_tel(String contact_tel) {
		this.contact_tel = contact_tel;
	}

	public String getTax_email() {
		return tax_email;
	}

	public void setTax_email(String tax_email) {
		this.tax_email = tax_email;
	}

	public String getManager_nm() {
		return manager_nm;
	}

	public void setManager_nm(String manager_nm) {
		this.manager_nm = manager_nm;
	}

	public String getManager_tel() {
		return manager_tel;
	}

	public void setManager_tel(String manager_tel) {
		this.manager_tel = manager_tel;
	}

	public String getManager_email() {
		return manager_email;
	}

	public void setManager_email(String manager_email) {
		this.manager_email = manager_email;
	}

	public int getBiz_img_no() {
		return biz_img_no;
	}

	public void setBiz_img_no(int biz_img_no) {
		this.biz_img_no = biz_img_no;
	}

	@Override
	public String toString() {
		return "UserVO [user_no=" + user_no + ", passwd=" + passwd + ", reg_dt=" + reg_dt + ", upd_dt=" + upd_dt
				+ ", aprv_status=" + aprv_status + ", real_file=" + real_file + ", file_nm=" + file_nm + ", user_id="
				+ user_id + ", company_nm=" + company_nm + ", biz_reg_number=" + biz_reg_number + ", ceo_nm=" + ceo_nm
				+ ", biz_category=" + biz_category + ", biz_addr_1=" + biz_addr_1 + ", biz_addr_2=" + biz_addr_2
				+ ", contact_tel=" + contact_tel + ", tax_email=" + tax_email + ", manager_nm=" + manager_nm
				+ ", manager_tel=" + manager_tel + ", manager_email=" + manager_email + ", biz_img_no=" + biz_img_no
				+ "]";
	}

}
