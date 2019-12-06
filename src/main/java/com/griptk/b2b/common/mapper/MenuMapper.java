package com.griptk.b2b.common.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.MapKey;

import com.griptk.b2b.common.domain.MenuVO;

public interface MenuMapper {
	List<MenuVO> getClientRoot(String menu_auth);
	@MapKey("menu_id")
	Map<String, MenuVO> getAll();
}
