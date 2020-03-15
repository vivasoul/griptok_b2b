package com.griptk.b2b.shopping.domain;

public class OrderDetailVO {
	private int user_no;
	private String reg_dt; //tb_order
	private String order_no; //tb_order
	
	private String order_title; //tb_order
	private int order_cnt; //tb_order
	private double tot_order_cost; //tb_order
	
	private String order_status; //tb_order
	private String order_status_nm;
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public String getOrder_title() {
		return order_title;
	}
	public void setOrder_title(String order_title) {
		this.order_title = order_title;
	}
	public int getOrder_cnt() {
		return order_cnt;
	}
	public void setOrder_cnt(int order_cnt) {
		this.order_cnt = order_cnt;
	}
	public double getTot_order_cost() {
		return tot_order_cost;
	}
	public void setTot_order_cost(double tot_order_cost) {
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
		return "OrderDetailVO [user_no=" + user_no + ", reg_dt=" + reg_dt + ", order_no=" + order_no + ", order_title="
				+ order_title + ", order_cnt=" + order_cnt + ", tot_order_cost=" + tot_order_cost + ", order_status="
				+ order_status + ", order_status_nm=" + order_status_nm + "]";
	}
}
