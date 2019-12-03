package com.griptk.b2b.qna.service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QnaController {
	@GetMapping("/qna")
	public String goLoginPage() {
		return "qna/list";
	}
}
