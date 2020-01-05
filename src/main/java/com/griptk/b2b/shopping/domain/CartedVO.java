package com.griptk.b2b.shopping.domain;

public class CartedVO {
	private int user_no;
	private int product_id;
	private String[] product_ids;
	
	private String title;
	private int carted_cnt;
	private String img_file;
	private int order_cost;
	private int unit_price;
	private int unit_discount;
	private int tot_discount;
	
	
	private String checked;	
	
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
	
	public String[] getProduct_ids() {
		return product_ids;
	}
	public void setProduct_ids(String[] product_ids) {
		this.product_ids = product_ids;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCarted_cnt() {
		return carted_cnt;
	}
	public void setCarted_cnt(int carted_cnt) {
		this.carted_cnt = carted_cnt;
	}
	public String getImg_file() {
		return img_file;
	}
	public void setImg_file(String img_file) {
		this.img_file = img_file;
	}
	public int getOrder_cost() {
		return order_cost;
	}
	public void setOrder_cost(int order_cost) {
		this.order_cost = order_cost;
	}
	public int getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(int unit_price) {
		this.unit_price = unit_price;
	}
	
	public int getUnit_discount() {
		return unit_discount;
	}
	public void setUnit_discount(int unit_discount) {
		this.unit_discount = unit_discount;
	}
	
	public int getTot_discount() {
		return tot_discount;
	}
	public void setTot_discount(int tot_discount) {
		this.tot_discount = tot_discount;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
}
