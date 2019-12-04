package com.griptk.b2b.common.mapper;

import java.util.List;

import com.griptk.b2b.common.domain.MenuVO;

public interface MenuMapper {
	List<MenuVO> getClientRoot(String menu_auth);
}
