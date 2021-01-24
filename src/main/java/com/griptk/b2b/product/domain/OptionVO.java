package com.griptk.b2b.product.domain;

public class OptionVO {
	private int product_id;
	private int option_no;
	private String option_txt;
	private String option_del_yn;
		
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getOption_no() {
		return option_no;
	}
	public void setOption_no(int option_no) {
		this.option_no = option_no;
	}
	public String getOption_txt() {
		return option_txt;
	}
	public void setOption_txt(String option_txt) {
		this.option_txt = option_txt;
	}
	public String getOption_del_yn() {
		return option_del_yn;
	}
	public void setOption_del_yn(String option_del_yn) {
		this.option_del_yn = option_del_yn;
	}
	@Override
	public String toString() {
		return "OptionVO [product_id=" + product_id + ", option_no=" + option_no + ", option_txt=" + option_txt
				+ ", option_del_yn=" + option_del_yn + "]";
	}
}
