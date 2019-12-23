package com.griptk.b2b.common.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.MapKey;

import com.griptk.b2b.common.domain.MenuVO;

public interface MenuMapper {
	List<MenuVO> listInClientRoot(String menu_auth);
	List<MenuVO> listMenuByParent(MenuVO condition);
	
	List<MenuVO> list();
	@MapKey("menu_url")
	Map<String, MenuVO> listWithUrl();	
	
	List<MenuVO> listMenusByBrand(int p_brand_no);
	List<MenuVO> listMenusByCraft(int craft_no);
}
