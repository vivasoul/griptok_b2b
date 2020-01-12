package com.griptk.b2b.qna.domain;

public class QnaVO {
	private int user_no;
	
	private int qna_no;
	private String title;
	private String content;
	private String passwd;
	private String req_dt;
	private String reg_dt;
	private String proc_yn;
	private String upd_dt;
	private String answ_dt;
	private String isViewYN;
	
	public QnaVO() {
		
	}
	
	public QnaVO(int qna_no,String title,String content,String reg_dt,String proc_yn) {
		this.qna_no = qna_no;
		this.title = title;
		this.content = content;
		this.reg_dt = reg_dt;
		this.proc_yn = proc_yn;
	}
	
	
	public String getReq_dt() {
		return req_dt;
	}

	public void setReq_dt(String req_dt) {
		this.req_dt = req_dt;
	}

	public String getUpd_dt() {
		return upd_dt;
	}

	public void setUpd_dt(String upd_dt) {
		this.upd_dt = upd_dt;
	}

	public String getAnsw_dt() {
		return answ_dt;
	}

	public void setAnsw_dt(String answ_dt) {
		this.answ_dt = answ_dt;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	
	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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

	public String getProc_yn() {
		return proc_yn;
	}

	public void setProc_yn(String proc_yn) {
		this.proc_yn = proc_yn;
	}

	public String getIsViewYN() {
		return isViewYN;
	}

	public void setIsViewYN(String isViewYN) {
		this.isViewYN = isViewYN;
	}
	
}
