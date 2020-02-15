package com.griptk.b2b.product.domain;

public class ProductImgReqVO {
	private int product_id;
	private long img_no;
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
	@Override
	public String toString() {
		return "ProductImgReqVO [product_id=" + product_id + ", img_no=" + img_no + "]";
	}
}
