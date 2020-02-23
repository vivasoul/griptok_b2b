package com.griptk.b2b.product.domain;

public class CategoryReqVO {
	private int category_no;
	private String category_nm;
	private int brand_no;
	private int craft_no;
	private String use_yn;
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	public String getCategory_nm() {
		return category_nm;
	}
	public void setCategory_nm(String category_nm) {
		this.category_nm = category_nm;
	}
	public int getBrand_no() {
		return brand_no;
	}
	public void setBrand_no(int brand_no) {
		this.brand_no = brand_no;
	}
	public int getCraft_no() {
		return craft_no;
	}
	public void setCraft_no(int craft_no) {
		this.craft_no = craft_no;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	@Override
	public String toString() {
		return "CategoryReqVO [category_no=" + category_no + ", category_nm=" + category_nm + ", brand_no=" + brand_no
				+ ", craft_no=" + craft_no + ", use_yn=" + use_yn + "]";
	}
}
