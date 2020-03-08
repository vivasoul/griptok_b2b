package com.griptk.b2b.product.domain;

public class ProductVO {
	private int product_id;
	private String title;
	private int retail_price;
	private int sales_price;
	private String thumb_img;
	private String is_fav;
	private String is_carted;
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
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
	public String getThumb_img() {
		return thumb_img;
	}
	public void setThumb_img(String thumb_img) {
		this.thumb_img = thumb_img;
	}
	public String getIs_fav() {
		return is_fav;
	}
	public void setIs_fav(String is_fav) {
		this.is_fav = is_fav;
	}
	public String getIs_carted() {
		return is_carted;
	}
	public void setIs_carted(String is_carted) {
		this.is_carted = is_carted;
	}
	@Override
	public String toString() {
		return "ProductVO [product_id=" + product_id + ", title=" + title + ", retail_price=" + retail_price
				+ ", sales_price=" + sales_price + ", thumb_img=" + thumb_img + ", is_fav=" + is_fav + ", is_carted="
				+ is_carted + "]";
	}
}
