package com.griptk.b2b.view.test;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestViewController {
	@RequestMapping("/test")
	public String goTestPage(Model model) {
		
		model.addAttribute("content_page", "test");
		
		return "_template/main";
	}
}
