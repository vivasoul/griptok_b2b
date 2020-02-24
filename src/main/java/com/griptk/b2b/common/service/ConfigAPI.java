package com.griptk.b2b.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.util.manager.CategoryManager;

@RestController
@RequestMapping("/configs")
public class ConfigAPI {
	@Autowired
	private CategoryManager categoryManager;
	
	@GetMapping("/refresh")
	public void refreshCategory(@RequestParam("config_type") String config_type) {
		if(config_type.equals("category")) {
			categoryManager.refresh();	
		}
	}
}
