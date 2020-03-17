package com.griptk.b2b.product.domain;

import java.util.List;

public class ProductDetailVO {
	private int product_id;
	private String title;
	private int retail_price;
	private int sales_price;
	private String description;
	private List<String> images;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<String> getImages() {
		return images;
	}
	public void setImages(List<String> images) {
		this.images = images;
	}
	@Override
	public String toString() {
		return "ProductDetailVO [product_id=" + product_id + ", title=" + title + ", retail_price=" + retail_price
				+ ", sales_price=" + sales_price + ", description=" + description + ", images=" + images + "]";
	}
}
