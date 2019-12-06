package com.griptk.b2b.product.service;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {	
	@RequestMapping("/main")
	public String goMainPage(Model model) {
		model.addAttribute("content_page", "product/list");
		
		return "_template/main";
	}
}
