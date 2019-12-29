package com.griptk.b2b.user.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	@RequestMapping("/login")
	public String goLoginPage(Model model) {
		model.addAttribute("content_page", "user/login");
		return "_template/login";
	}
	
	@GetMapping("/sign-up")
	public String goRegisterPage(Model model) {
		model.addAttribute("content_page","user/sign_up");
		return "_template/login";
	}
	
	@GetMapping("/user_bye")
	public String goWithdrawlPage(Model model) {
		model.addAttribute("content_page","user/withdrawal");
		return "_template/main";
	}
	
	@GetMapping("/user_edit")
	public String goInfoChangelPage(Model model) {
		model.addAttribute("content_page","user/info_change");
		return "_template/main";
	}
	
	@GetMapping("/shipto")
	public String goShipToPage(Model model) {
		model.addAttribute("content_page","shipto/list");
		return "_template/main";
	}
//	@GetMapping("/shipto")
//	public String goShipToPage() {
//		return "shipto/list";
//	}
	@GetMapping("/mypage")
	public String goToMyPage(Model model) {
		return "redirect:/ordered";
	}
	
	@RequestMapping("/sign-out")
	public String goSignOut(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
	
	@RequestMapping("/")
	public String goFirst() {
		return "redirect:/main";
	}	
}
