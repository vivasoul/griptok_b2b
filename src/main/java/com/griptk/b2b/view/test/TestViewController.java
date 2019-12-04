package com.griptk.b2b.view.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.griptk.b2b.common.service.MenuAPI;

@Controller
public class TestViewController {
	@Autowired
	private MenuAPI menuAPI;
	
	
	@GetMapping("/test")
	public String goTestPage(HttpServletRequest req, HttpSession session) {
		req.setAttribute("content_page", "test");
		session.setAttribute("top_menus", menuAPI.getClientHead("N"));
		
		return "_template/main";
	}
}
