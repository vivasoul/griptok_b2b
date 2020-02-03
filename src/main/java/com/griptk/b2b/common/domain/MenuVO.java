package com.griptk.b2b.common.domain;

import java.util.List;

public class MenuVO{
	private String menu_id;
	private String menu_nm;
	private String p_menu_id;
	private String menu_url;
	private String menu_auth;
	private String template_id;
	private String menu_path;
	private String id_path;
	private List<MenuVO> sub_menus;
	public String getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}
	public String getMenu_nm() {
		return menu_nm;
	}
	public void setMenu_nm(String menu_nm) {
		this.menu_nm = menu_nm;
	}
	public String getP_menu_id() {
		return p_menu_id;
	}
	public void setP_menu_id(String p_menu_id) {
		this.p_menu_id = p_menu_id;
	}
	public String getMenu_url() {
		return menu_url;
	}
	public void setMenu_url(String menu_url) {
		this.menu_url = menu_url;
	}
	public String getMenu_auth() {
		return menu_auth;
	}
	public void setMenu_auth(String menu_auth) {
		this.menu_auth = menu_auth;
	}
	public String getTemplate_id() {
		return template_id;
	}
	public void setTemplate_id(String template_id) {
		this.template_id = template_id;
	}
	public String getMenu_path() {
		return menu_path;
	}
	public void setMenu_path(String menu_path) {
		this.menu_path = menu_path;
	}
	public String getId_path() {
		return id_path;
	}
	public void setId_path(String id_path) {
		this.id_path = id_path;
	}
	public List<MenuVO> getSub_menus() {
		return sub_menus;
	}
	public void setSub_menus(List<MenuVO> sub_menus) {
		this.sub_menus = sub_menus;
	}
	@Override
	public String toString() {
		return "MenuVO [menu_id=" + menu_id + ", menu_nm=" + menu_nm + ", p_menu_id=" + p_menu_id + ", menu_url="
				+ menu_url + ", menu_auth=" + menu_auth + ", template_id=" + template_id + ", menu_path=" + menu_path
				+ ", id_path=" + id_path + ", sub_menus=" + sub_menus + "]";
	}
}
