package com.griptk.b2b.product.domain;

public class CategoryVO {
	private int category_no;
	private String category_nm;
	private String use_yn;
	private BrandTypeVO brand;
	private CraftTypeVO craft;
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
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public BrandTypeVO getBrand() {
		return brand;
	}
	public void setBrand(BrandTypeVO brand) {
		this.brand = brand;
	}
	public CraftTypeVO getCraft() {
		return craft;
	}
	public void setCraft(CraftTypeVO craft) {
		this.craft = craft;
	}
	@Override
	public String toString() {
		return "CategoryVO [category_no=" + category_no + ", category_nm=" + category_nm + ", use_yn=" + use_yn
				+ ", brand=" + brand + ", craft=" + craft + "]";
	}
}
