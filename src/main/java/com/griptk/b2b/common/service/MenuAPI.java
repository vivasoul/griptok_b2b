package com.griptk.b2b.common.service;

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
	
	public List<MenuVO> getAllMenus(){
		return mapper.list();
	}
	
	public Map<String, MenuVO> getMenusWithURL(){
		return mapper.listWithUrl();
	}	
}
