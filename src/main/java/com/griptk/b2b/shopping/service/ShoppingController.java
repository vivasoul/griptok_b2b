package com.griptk.b2b.shopping.service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShoppingController {
	@GetMapping("/interested")
	public String list() {
		return "interested/list";
	}

}
