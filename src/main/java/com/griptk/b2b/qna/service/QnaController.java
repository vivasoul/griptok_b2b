package com.griptk.b2b.qna.service;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QnaController {
	@GetMapping("/qna")
	public String goLoginPage() {
		return "qna/list";
	}
	
	@RequestMapping("/qna/{qnaId}")
	@ModelAttribute("qnaDetail")
	public ModelAndView goDetailPage(@PathVariable String qnaId,ModelMap model) {
		
		//addAttribute after querying some data
		
		ModelAndView mav =  new ModelAndView("qna/detail");
		mav.addObject("testParam",qnaId);
		
		return mav;
	}
}
