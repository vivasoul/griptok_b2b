package com.griptk.b2b.util.manager;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

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
		menu_map = api.getAllMenus();
	}
	
	public List<MenuVO> getLogined(){
		return logined_menus;
	}
	
	public List<MenuVO> getNotLogined(){
		return not_logined_menus;
	}
	
	public String getTemplateId(String menu_id) {
		return menu_map.get(menu_id).getTemplate_id();
	}
}
