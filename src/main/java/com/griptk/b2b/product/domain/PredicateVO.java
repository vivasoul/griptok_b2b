package com.griptk.b2b.product.domain;

public class PredicateVO {
	private int id;
	private String order_by;
	private int limit;
	private int start;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrder_by() {
		return order_by;
	}
	public void setOrder_by(String order_by) {
		this.order_by = order_by;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	@Override
	public String toString() {
		return "PredicateVO [id=" + id + ", order_by=" + order_by + ", limit=" + limit + ", start=" + start + "]";
	}
}
