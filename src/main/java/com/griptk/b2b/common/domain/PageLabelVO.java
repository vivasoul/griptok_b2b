package com.griptk.b2b.common.domain;

import java.util.List;

public class PageLabelVO {
	private String title;
	private String path;
	private int list_cnt;
	private String list_url;
	private String side_title;
	private List<MenuVO> sub_menus;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getList_cnt() {
		return list_cnt;
	}
	public void setList_cnt(int list_cnt) {
		this.list_cnt = list_cnt;
	}
	public String getList_url() {
		return list_url;
	}
	public void setList_url(String list_url) {
		this.list_url = list_url;
	}
	public String getSide_title() {
		return side_title;
	}
	public void setSide_title(String side_title) {
		this.side_title = side_title;
	}
	public List<MenuVO> getSub_menus() {
		return sub_menus;
	}
	public void setSub_menus(List<MenuVO> sub_menus) {
		this.sub_menus = sub_menus;
	}
	@Override
	public String toString() {
		return "PageLabelVO [title=" + title + ", path=" + path + ", list_cnt=" + list_cnt + ", list_url=" + list_url
				+ ", side_title=" + side_title + ", sub_menus=" + sub_menus + "]";
	}
}
