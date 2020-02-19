package com.griptk.b2b.product.domain;

public class BrandTypeVO {
	private int brand_no;
	private String brand_nm;
	private int p_brand_no;
	private String p_brand_nm;
	private String use_yn;
	public int getBrand_no() {
		return brand_no;
	}
	public void setBrand_no(int brand_no) {
		this.brand_no = brand_no;
	}
	public String getBrand_nm() {
		return brand_nm;
	}
	public void setBrand_nm(String brand_nm) {
		this.brand_nm = brand_nm;
	}
	public int getP_brand_no() {
		return p_brand_no;
	}
	public void setP_brand_no(int p_brand_no) {
		this.p_brand_no = p_brand_no;
	}
	public String getP_brand_nm() {
		return p_brand_nm;
	}
	public void setP_brand_nm(String p_brand_nm) {
		this.p_brand_nm = p_brand_nm;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
}
