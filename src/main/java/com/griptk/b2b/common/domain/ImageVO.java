package com.griptk.b2b.common.domain;

public class ImageVO {
	private long img_no;
	private String file_nm;
	private String file_path;
	private String file_format;
	private long file_size;
	private int img_width;
	private int img_height;
	private int user_no;
	private String reg_dt;
	private String download_nm;
	public long getImg_no() {
		return img_no;
	}
	public void setImg_no(long img_no) {
		this.img_no = img_no;
	}
	public String getFile_nm() {
		return file_nm;
	}
	public void setFile_nm(String file_nm) {
		this.file_nm = file_nm;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getFile_format() {
		return file_format;
	}
	public void setFile_format(String file_format) {
		this.file_format = file_format;
	}
	public long getFile_size() {
		return file_size;
	}
	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}
	public int getImg_width() {
		return img_width;
	}
	public void setImg_width(int img_width) {
		this.img_width = img_width;
	}
	public int getImg_height() {
		return img_height;
	}
	public void setImg_height(int img_height) {
		this.img_height = img_height;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getDownload_nm() {
		return download_nm;
	}
	public void setDownload_nm(String download_nm) {
		this.download_nm = download_nm;
	}
	@Override
	public String toString() {
		return "ImageVO [img_no=" + img_no + ", file_nm=" + file_nm + ", file_path=" + file_path + ", file_format="
				+ file_format + ", file_size=" + file_size + ", img_width=" + img_width + ", img_height=" + img_height
				+ ", user_no=" + user_no + ", reg_dt=" + reg_dt + ", download_nm=" + download_nm + "]";
	}
}
