package com.griptk.b2b.product.domain;

public class CraftTypeVO {
	private int craft_no;
	private String craft_nm;
	public int getCraft_no() {
		return craft_no;
	}
	public void setCraft_no(int craft_no) {
		this.craft_no = craft_no;
	}
	public String getCraft_nm() {
		return craft_nm;
	}
	public void setCraft_nm(String craft_nm) {
		this.craft_nm = craft_nm;
	}
	@Override
	public String toString() {
		return "CraftTypeVO [craft_no=" + craft_no + ", craft_nm=" + craft_nm + "]";
	}
}
