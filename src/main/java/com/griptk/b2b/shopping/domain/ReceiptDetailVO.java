package com.griptk.b2b.shopping.domain;

public class ReceiptDetailVO {
	private String order_dt;
	private String product_nm;
	private int order_cnt;
	private int order_cost;
	public String getOrder_dt() {
		return order_dt;
	}
	public void setOrder_dt(String order_dt) {
		this.order_dt = order_dt;
	}
	public String getProduct_nm() {
		return product_nm;
	}
	public void setProduct_nm(String product_nm) {
		this.product_nm = product_nm;
	}
	public int getOrder_cnt() {
		return order_cnt;
	}
	public void setOrder_cnt(int order_cnt) {
		this.order_cnt = order_cnt;
	}
	public int getOrder_cost() {
		return order_cost;
	}
	public void setOrder_cost(int order_cost) {
		this.order_cost = order_cost;
	}
	@Override
	public String toString() {
		return "ReceiptDetailVO [order_dt=" + order_dt + ", product_nm=" + product_nm + ", order_cnt=" + order_cnt
				+ ", order_cost=" + order_cost + "]";
	}
}
