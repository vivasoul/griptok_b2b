package com.griptk.b2b.product.domain;

public class ProductVO {
	private int product_id;
	private String title;
	private int price;
	private String evt_code;
	private String thumb_img;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getEvt_code() {
		return evt_code;
	}
	public void setEvt_code(String evt_code) {
		this.evt_code = evt_code;
	}
	public String getThumb_img() {
		return thumb_img;
	}
	public void setThumb_img(String thumb_img) {
		this.thumb_img = thumb_img;
	}
	@Override
	public String toString() {
		return "ProductVO [product_id=" + product_id + ", title=" + title + ", price=" + price + ", evt_code="
				+ evt_code + ", thumb_img=" + thumb_img + "]";
	}
}
