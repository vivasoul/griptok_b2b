package com.griptk.b2b.product.domain;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class ProductReqVO {
	private int product_id;
	private String title;
	private int retail_price;
	private int sales_price;
	private int stock_cnt;
	private int craft_no;
	private int p_brand_no;
	private int brand_no;
	private String is_new;
	private String is_best;
	private String is_dc;
	private long thumb_img_no;
	
	private MultipartFile thumb_file;
	private MultipartFile[] files;
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
	public int getStock_cnt() {
		return stock_cnt;
	}
	public void setStock_cnt(int stock_cnt) {
		this.stock_cnt = stock_cnt;
	}
	public int getCraft_no() {
		return craft_no;
	}
	public void setCraft_no(int craft_no) {
		this.craft_no = craft_no;
	}
	public int getP_brand_no() {
		return p_brand_no;
	}
	public void setP_brand_no(int p_brand_no) {
		this.p_brand_no = p_brand_no;
	}
	public int getBrand_no() {
		return brand_no;
	}
	public void setBrand_no(int brand_no) {
		this.brand_no = brand_no;
	}
	public String getIs_new() {
		return is_new;
	}
	public void setIs_new(String is_new) {
		this.is_new = is_new;
	}
	public String getIs_best() {
		return is_best;
	}
	public void setIs_best(String is_best) {
		this.is_best = is_best;
	}
	public String getIs_dc() {
		return is_dc;
	}
	public void setIs_dc(String is_dc) {
		this.is_dc = is_dc;
	}
	public long getThumb_img_no() {
		return thumb_img_no;
	}
	public void setThumb_img_no(long thumb_img_no) {
		this.thumb_img_no = thumb_img_no;
	}
	public MultipartFile getThumb_file() {
		return thumb_file;
	}
	public void setThumb_file(MultipartFile thumb_file) {
		this.thumb_file = thumb_file;
	}
	public MultipartFile[] getFiles() {
		return files;
	}
	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}
	@Override
	public String toString() {
		return "ProductReqVO [product_id=" + product_id + ", title=" + title + ", retail_price=" + retail_price
				+ ", sales_price=" + sales_price + ", stock_cnt=" + stock_cnt + ", craft_no=" + craft_no
				+ ", p_brand_no=" + p_brand_no + ", brand_no=" + brand_no + ", is_new=" + is_new + ", is_best="
				+ is_best + ", is_dc=" + is_dc + ", thumb_img_no=" + thumb_img_no + ", thumb_file=" + thumb_file
				+ ", files=" + Arrays.toString(files) + "]";
	}
}
