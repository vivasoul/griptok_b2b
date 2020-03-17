package com.griptk.b2b.product.domain;

import java.util.List;

public class ProductRespVO {
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
	private String description;
	
	private String reg_dt;
	private String upd_dt;
	
	private ProductImgReqVO thumb_file;
	private List<ProductImgReqVO> files;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getUpd_dt() {
		return upd_dt;
	}
	public void setUpd_dt(String upd_dt) {
		this.upd_dt = upd_dt;
	}
	public ProductImgReqVO getThumb_file() {
		return thumb_file;
	}
	public void setThumb_file(ProductImgReqVO thumb_file) {
		this.thumb_file = thumb_file;
	}
	public List<ProductImgReqVO> getFiles() {
		return files;
	}
	public void setFiles(List<ProductImgReqVO> files) {
		this.files = files;
	}
	@Override
	public String toString() {
		return "ProductRespVO [product_id=" + product_id + ", title=" + title + ", retail_price=" + retail_price
				+ ", sales_price=" + sales_price + ", stock_cnt=" + stock_cnt + ", craft_no=" + craft_no
				+ ", p_brand_no=" + p_brand_no + ", brand_no=" + brand_no + ", is_new=" + is_new + ", is_best="
				+ is_best + ", is_dc=" + is_dc + ", description=" + description + ", reg_dt=" + reg_dt + ", upd_dt="
				+ upd_dt + ", thumb_file=" + thumb_file + ", files=" + files + "]";
	}
}
