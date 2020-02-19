package com.griptk.b2b.qna.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.griptk.b2b.qna.mapper.QnaMapper;

@Controller
public class MQnaController {
	
	@Autowired
	QnaMapper qnaMapper;
	
	@RequestMapping("/admin/qna")
	public String goAdminQnA(Model model) {
		model.addAttribute("content_page", "qna/admin/list");
		return "_template/admin";
	}
}
