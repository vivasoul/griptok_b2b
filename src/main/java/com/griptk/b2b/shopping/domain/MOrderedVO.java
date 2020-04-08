package com.griptk.b2b.shopping.domain;

public class MOrderedVO {
	private long order_no;
	private int user_no;
	private String company_nm;
	private String manager_nm;
	private String manager_tel;
	private String manager_email;	
	private String order_dt;
	private String order_title;
	private int tot_order_cost;
	private String order_status;
	private String order_status_nm;
	public long getOrder_no() {
		return order_no;
	}
	public void setOrder_no(long order_no) {
		this.order_no = order_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getCompany_nm() {
		return company_nm;
	}
	public void setCompany_nm(String company_nm) {
		this.company_nm = company_nm;
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
	public String getOrder_dt() {
		return order_dt;
	}
	public void setOrder_dt(String order_dt) {
		this.order_dt = order_dt;
	}
	public String getOrder_title() {
		return order_title;
	}
	public void setOrder_title(String order_title) {
		this.order_title = order_title;
	}
	public int getTot_order_cost() {
		return tot_order_cost;
	}
	public void setTot_order_cost(int tot_order_cost) {
		this.tot_order_cost = tot_order_cost;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getOrder_status_nm() {
		return order_status_nm;
	}
	public void setOrder_status_nm(String order_status_nm) {
		this.order_status_nm = order_status_nm;
	}
	@Override
	public String toString() {
		return "MOrderedVO [order_no=" + order_no + ", user_no=" + user_no + ", company_nm=" + company_nm
				+ ", manager_nm=" + manager_nm + ", manager_tel=" + manager_tel + ", manager_email=" + manager_email
				+ ", order_dt=" + order_dt + ", order_title=" + order_title + ", tot_order_cost=" + tot_order_cost
				+ ", order_status=" + order_status + ", order_status_nm=" + order_status_nm + "]";
	}
}
