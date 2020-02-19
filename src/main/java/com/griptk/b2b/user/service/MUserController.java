package com.griptk.b2b.user.service;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MUserController {
	
	@RequestMapping("/admin/user-accept")
	public String goAdminUserAccept(Model model) {
		model.addAttribute("content_page", "user/admin/list");
		return "_template/admin";
	}
}
