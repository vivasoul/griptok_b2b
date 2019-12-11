package com.griptk.b2b.user.service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	@GetMapping("/login")
	public String goLoginPage() {
		return "user/login";
	}
	
	@GetMapping("/register")
	public String goRegisterPage() {
		return "user/sign_up";
	}
	
	@GetMapping("/withdrawal")
	public String goWithdrawlPage() {
		return "user/withdrawal";
	}
	
	@GetMapping("/info")
	public String goInfoChangelPage() {
		return "user/info_change";
	}
	
	@GetMapping("/shipTo")
	public String goShipToPage() {
		return "shipto/list";
	}


}
