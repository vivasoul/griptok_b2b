package com.griptk.b2b.view.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestViewController {
	
	@GetMapping("/test")
	public String goTestPage() {
		return "test";
	}
}
