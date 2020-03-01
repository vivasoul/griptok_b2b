package com.griptk.b2b.shopping.service;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MShoppingController {
	
	@RequestMapping("/admin/ordered")
	public String goAdminOrdered(Model model) {
		model.addAttribute("content_page", "order_hst/admin/list");
		return "_template/admin";
	}
	
	@RequestMapping("/admin/check-deposit")
	public String goAdminDeposit(Model model) {
		model.addAttribute("content_page", "order_hst/admin/deposit_list");
		return "_template/admin";
	}
}
