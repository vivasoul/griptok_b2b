package com.griptk.b2b.common.domain;

public class FileVO {
	private long file_no;
	private String file_nm;
	private String file_path;
	private String file_format;
	private long file_size;
	private String reg_dt;
	private String download_nm;
	public long getFile_no() {
		return file_no;
	}
	public void setFile_no(long file_no) {
		this.file_no = file_no;
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
		return "FileVO [file_no=" + file_no + ", file_nm=" + file_nm + ", file_path=" + file_path + ", file_format="
				+ file_format + ", file_size=" + file_size + ", reg_dt=" + reg_dt + ", download_nm=" + download_nm
				+ "]";
	}
}
