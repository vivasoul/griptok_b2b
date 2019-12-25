package com.griptk.b2b.notice.service;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.griptk.b2b.notice.domain.NoticeDetailVO;

@Controller
public class NoticeController {
	@GetMapping("/notice")
	public String list(Model model) {
		String viewPath = "notice/list";
		model.addAttribute("content_page", viewPath);
		return "_template/main";
	}
	
	@RequestMapping("/notice/view")
	public String detail(Model model,@RequestParam("id") String noticeId) {
		String viewPath = "notice/detail";
		model.addAttribute("content_page", viewPath);
		
		//[TO-DO]query answer data and setAttribute in mav. NO DATABASE AVAILABLE ATM FOR ANSWERS.
		NoticeDetailVO ndv = new NoticeDetailVO(12,"행사관련","이건 행사관련공지 제목이에요.","이건 행사관련공지 내용입니다.","2019-12-04",100);
		model.addAttribute("answerObject",ndv);
		
		return "_template/main";
	}
}
