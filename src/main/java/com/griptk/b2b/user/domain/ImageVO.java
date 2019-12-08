package com.griptk.b2b.user.domain;

public class ImageVO {
	
	private int img_no;
	
	private String file_nm;
	
	private String file_path;
	
	private long file_size;
	
	private String reg_dt;
	
	private String file_format;
	
	private int img_width;
	
	private int img_height;

	public int getImg_no() {
		return img_no;
	}

	public void setImg_no(int img_no) {
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

	public long getFile_size() {
		return file_size;
	}

	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getFile_format() {
		return file_format;
	}

	public void setFile_format(String file_format) {
		this.file_format = file_format;
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

	@Override
	public String toString() {
		return "ImageVO [img_no=" + img_no + ", file_nm=" + file_nm + ", file_path=" + file_path + ", file_size="
				+ file_size + ", reg_dt=" + reg_dt + ", file_format=" + file_format + ", img_width=" + img_width
				+ ", img_height=" + img_height + "]";
	}
	
}
