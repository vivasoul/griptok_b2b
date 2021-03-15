package com.griptk.b2b.product.domain;

public class BannerVO {
	private int banner_no;
	private String banner_txt;
	private String banner_img;
	private String banner_link;
	private int sort_no;
	public int getBanner_no() {
		return banner_no;
	}
	public void setBanner_no(int banner_no) {
		this.banner_no = banner_no;
	}
	public String getBanner_txt() {
		return banner_txt;
	}
	public void setBanner_txt(String banner_txt) {
		this.banner_txt = banner_txt;
	}
	public String getBanner_img() {
		return banner_img;
	}
	public void setBanner_img(String banner_img) {
		this.banner_img = banner_img;
	}
	public String getBanner_link() {
		return banner_link;
	}
	public void setBanner_link(String banner_link) {
		this.banner_link = banner_link;
	}
	public int getSort_no() {
		return sort_no;
	}
	public void setSort_no(int sort_no) {
		this.sort_no = sort_no;
	}
	@Override
	public String toString() {
		return "BannerVO [banner_no=" + banner_no + ", banner_txt=" + banner_txt + ", banner_img=" + banner_img
				+ ", banner_link=" + banner_link + ", sort_no=" + sort_no + "]";
	}
}
