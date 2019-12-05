package com.griptk.b2b.view.test;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.griptk.b2b.common.service.MenuAPI;
import com.griptk.b2b.product.service.CategoryAPI;

@Controller
public class TestViewController {
	@Autowired
	private MenuAPI menuAPI;
	
	@Autowired
	private CategoryAPI categoryAPI;
	
	@GetMapping("/test")
	public String goTestPage(Model model) {
		
		model.addAttribute("content_page", "test");
		model.addAttribute("top_menus", menuAPI.getClientHead("N"));
		model.addAttribute("brands_filter", categoryAPI.getParentBrands());
		model.addAttribute("crafts_filter", categoryAPI.getCrafts());
		
		return "_template/main";
	}
}
