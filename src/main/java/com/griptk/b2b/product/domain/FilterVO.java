package com.griptk.b2b.product.domain;

public class FilterVO {
	private String type;
	private int p_id;
	private int c_id;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	@Override
	public String toString() {
		return "FilterVO [type=" + type + ", p_id=" + p_id + ", c_id=" + c_id + "]";
	}
}
