package com.griptk.b2b.product.domain;

public class ProductImgReqVO {
	private int product_id;
	private int sort_no;
	private String img_link;
	private long img_no;
	private String img_path;
	public  ProductImgReqVO() {
		this(0,0);
	}
	public ProductImgReqVO(int product_id, long img_no) {
		this.product_id = product_id;
		this.img_no = img_no;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public long getImg_no() {
		return img_no;
	}
	public void setImg_no(long img_no) {
		this.img_no = img_no;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public int getSort_no() {
		return sort_no;
	}
	public void setSort_no(int sort_no) {
		this.sort_no = sort_no;
	}
	public String getImg_link() {
		return img_link;
	}
	public void setImg_link(String img_link) {
		this.img_link = img_link;
	}
	@Override
	public String toString() {
		return "ProductImgReqVO [product_id=" + product_id + ", sort_no=" + sort_no + ", img_link=" + img_link
				+ ", img_no=" + img_no + ", img_path=" + img_path + "]";
	}
}
