package com.griptk.b2b.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.common.domain.MenuVO;
import com.griptk.b2b.common.mapper.MenuMapper;

@RestController
public class MenuAPI {
	@Autowired
	private MenuMapper mapper;
	
	public List<MenuVO> getClientHead(String menu_auth){
		return mapper.listInClientRoot(menu_auth);
	}
	
	public List<MenuVO> getMenuByParent(String p_menu_id, String menu_auth){
		MenuVO condition = new MenuVO();
		condition.setP_menu_id(p_menu_id);
		condition.setMenu_auth(menu_auth);
		return mapper.listMenuByParent(condition);
	}	
	
	public List<MenuVO> getAllMenus(){
		return mapper.list();
	}
	
	public Map<String, MenuVO> getMenusWithURL(){
		Map<String, MenuVO> clientMenus = mapper.listWithUrl_Client();
		Map<String, MenuVO> adminMenus  = mapper.listWithUrl_Admin();
		Map<String, MenuVO> menus = new HashMap<>();
		menus.putAll(clientMenus);
		menus.putAll(adminMenus);
		return menus;
	}
	
	public List<MenuVO> getSideMenuByBrand(int p_brand_no){
		return mapper.listMenusByBrand(p_brand_no);
	}
	
	public List<MenuVO> getSideMenuByCraft(int craft_no){
		return mapper.listMenusByCraft(craft_no);
	}
}
