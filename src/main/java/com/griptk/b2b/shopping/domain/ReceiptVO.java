package com.griptk.b2b.shopping.domain;

import java.util.List;

public class ReceiptVO {
	private long order_no;
	private String order_dt;
	private String company_nm;
	private List<ReceiptDetailVO> list;
	public long getOrder_no() {
		return order_no;
	}
	public void setOrder_no(long order_no) {
		this.order_no = order_no;
	}
	public String getOrder_dt() {
		return order_dt;
	}
	public void setOrder_dt(String order_dt) {
		this.order_dt = order_dt;
	}
	public String getCompany_nm() {
		return company_nm;
	}
	public void setCompany_nm(String company_nm) {
		this.company_nm = company_nm;
	}
	public List<ReceiptDetailVO> getList() {
		return list;
	}
	public void setList(List<ReceiptDetailVO> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "ReceiptVO [order_no=" + order_no + ", order_dt=" + order_dt + ", company_nm=" + company_nm + ", list="
				+ list + "]";
	}
}
