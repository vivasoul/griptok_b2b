package com.griptk.b2b.shopping.domain;

public class OrderVO {
	private String order_no;
	private String title;
	private String order_cnt;
	private String order_cost;
	
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getOrder_cnt() {
		return order_cnt;
	}
	public void setOrder_cnt(String order_cnt) {
		this.order_cnt = order_cnt;
	}
	public String getOrder_cost() {
		return order_cost;
	}
	public void setOrder_cost(String order_cost) {
		this.order_cost = order_cost;
	}	
}
