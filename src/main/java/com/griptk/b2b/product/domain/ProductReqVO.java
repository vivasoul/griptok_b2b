package com.griptk.b2b.product.domain;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class ProductReqVO {
	private int product_id;
	private String title;
	private int retail_price;
	private int sales_price;
	private int stock_cnt;
	private int category_no;
	private int craft_no;
	private int p_brand_no;
	private int brand_no;
	private String is_new;
	private String is_best;
	private String is_dc;
	private String description;
	
	private int[] option_no;
	private String[] option_txt;
	private String[] option_del_yn;
	
	private long thumb_img_no;
	private MultipartFile thumb_file;
	
	private long[] img_nos;
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
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int[] getOption_no() {
		return option_no;
	}
	public void setOption_no(int[] option_no) {
		this.option_no = option_no;
	}
	public String[] getOption_txt() {
		return option_txt;
	}
	public void setOption_txt(String[] option_txt) {
		this.option_txt = option_txt;
	}
	public String[] getOption_del_yn() {
		return option_del_yn;
	}
	public void setOption_del_yn(String[] option_del_yn) {
		this.option_del_yn = option_del_yn;
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
	public long[] getImg_nos() {
		return img_nos;
	}
	public void setImg_nos(long[] img_nos) {
		this.img_nos = img_nos;
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
				+ ", sales_price=" + sales_price + ", stock_cnt=" + stock_cnt + ", category_no=" + category_no
				+ ", craft_no=" + craft_no + ", p_brand_no=" + p_brand_no + ", brand_no=" + brand_no + ", is_new="
				+ is_new + ", is_best=" + is_best + ", is_dc=" + is_dc + ", description=" + description
				+ ", thumb_img_no=" + thumb_img_no + ", thumb_file=" + thumb_file + ", img_nos="
				+ Arrays.toString(img_nos) + ", files=" + Arrays.toString(files) + "]";
	}
}
