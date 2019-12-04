package com.griptk.b2b.notice.service;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.griptk.b2b.notice.domain.NoticeDetailVO;

@Controller
public class NoticeController {
	@GetMapping("/notice")
	public String list() {
		return "notice/list";
	}
	
	@RequestMapping("/notice/{noticeId}")
	public ModelAndView detail(@PathVariable String noticeId,ModelMap model) {
		String viewPath = "notice/detail";
		ModelAndView mav =  new ModelAndView(viewPath);
		
		//[TO-DO]query answer data and setAttribute in mav. NO DATABASE AVAILABLE ATM FOR ANSWERS.
		NoticeDetailVO ndv = new NoticeDetailVO(12,"행사관련","이건 행사관련공지 제목이에요.","이건 행사관련공지 내용입니다.","2019-12-04",100);
		mav.addObject("answerObject",ndv);
		
		return mav;
	}
}
