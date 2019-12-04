package com.griptk.b2b.notice.domain;

public class NoticeDetailVO {
	private int notice_no;
	private String title;
	private String content;
	private String reg_dt;
	private String upd_dt;
	private String category;
	
	//database에 없음
	private int view_count;
	
	
	public NoticeDetailVO(){
		
	}
	
	public NoticeDetailVO(int notice_no,String category,String title,String content,String reg_dt,int view_count) {
		this.notice_no = notice_no;
		this.category = category;
		this.title = title;
		this.content = content;
		this.reg_dt = reg_dt;
		this.view_count = view_count;
	}
	
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
}
