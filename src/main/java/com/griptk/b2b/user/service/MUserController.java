package com.griptk.b2b.user.service;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MUserController {
	
	@RequestMapping("/admin/user-accept")
	public String goAdminUserAccept(Model model) {
		model.addAttribute("content_page", "user/admin/aprv_list");
		return "_template/admin";
	}
	
	@RequestMapping("/admin/user-list")
	public String goAdminUserList(Model model) {
		model.addAttribute("content_page", "user/admin/list");
		return "_template/admin";
	}
	
	@RequestMapping("/admin/user-edit")
	public String goAdminEditUser(Model model,@RequestParam("user_no") int user_no) {
		model.addAttribute("content_page", "user/admin/edit"); 
		return "_template/admin";
	}	
}
