package com.griptk.b2b.util.manager;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.griptk.b2b.common.domain.MenuVO;
import com.griptk.b2b.common.service.MenuAPI;

public class MenuManager {
	private List<MenuVO> logined_menus;
	private List<MenuVO> not_logined_menus;
	private Map<String, MenuVO> menu_map;
	
	private MenuAPI api;

	public MenuManager(MenuAPI api) {
		this.api = api;
		refresh();
	}
	
	public void refresh() {
		logined_menus = api.getClientHead("L");
		not_logined_menus = api.getClientHead("N");
		menu_map = api.getMenusWithURL();
	}
	
	public List<MenuVO> getLogined(){
		return logined_menus;
	}
	
	public List<MenuVO> getNotLogined(){
		return not_logined_menus;
	}
		
	public MenuVO getMenuFromURL(String url) {
		return menu_map.get(url);
	}
	
	public String getTemplateFromURL(String url) {
		MenuVO menu = getMenuFromURL(url);
		if(menu == null)	return null;
		else				return getMenuFromURL(url).getTemplate_id();
	}

	public String getNameFromURL(String url) {
		MenuVO menu = getMenuFromURL(url);
		if(menu == null)	return null;		
		else				return getMenuFromURL(url).getMenu_nm();
	}
	
	public String getPathFromURL(String url) {
		MenuVO menu = getMenuFromURL(url);
		if(menu == null)	return null;		
		else				return getMenuFromURL(url).getMenu_path();
	}	
	
	public Set<String> listURLSet(){
		return menu_map.keySet();
	}
	
	public List<MenuVO> listSubMenu(String p_menu_id, String menu_auth) {
		return api.getMenuByParent(p_menu_id, menu_auth);
	}
}
