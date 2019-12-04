package com.griptk.b2b.qna.domain;

public class QnaVO {
	private int board_no;
	private String title;
	private String content;
	private String passwd;
//	req_dt;
	private String reg_dt;
	private String proc_yn;
//	upd_dt;
//	answ_dt;
	
	public QnaVO() {
		
	}
	
	public QnaVO(int board_no,String title,String content,String reg_dt,String proc_yn) {
		this.board_no = board_no;
		this.title = title;
		this.content = content;
		this.reg_dt = reg_dt;
		this.proc_yn = proc_yn;
	}
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
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
	
	
	
}
