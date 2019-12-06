package com.griptk.b2b.util.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.griptk.b2b.common.service.MenuAPI;
import com.griptk.b2b.product.service.CategoryAPI;

@Configuration
public class UtilManagerBean {
	@Bean
	@Autowired
	public CategoryManager getCategoryManager(CategoryAPI api) {
		return new CategoryManager(api);
	}
	
	@Bean
	@Autowired
	public MenuManager getMenuManager(MenuAPI api) {
		return new MenuManager(api);
	}
}
