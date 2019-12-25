package com.griptk.b2b.shopping.domain;

public class InterestedVO {
	
	private int user_no;
	
	private int product_id;
	
	private String reg_dt;
	
	private String title;
	
	private int retail_price;
	
	private int sales_price;
	
	private String file_path;
	
	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getRetail_price() {
		return retail_price;
	}

	public void setRetail_price(int retail_price) {
		this.retail_price = retail_price;
	}

	public int getSales_price() {
		return sales_price;
	}

	public void setSales_price(int sales_price) {
		this.sales_price = sales_price;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	@Override
	public String toString() {
		return "InterestedVO [user_no=" + user_no + ", product_id=" + product_id + ", reg_dt=" + reg_dt + ", title="
				+ title + ", retail_price=" + retail_price + ", sales_price=" + sales_price + ", file_path=" + file_path
				+ "]";
	}
	
	

	
	
	

}
