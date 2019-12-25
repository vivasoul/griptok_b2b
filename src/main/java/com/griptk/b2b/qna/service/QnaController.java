package com.griptk.b2b.qna.service;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.griptk.b2b.qna.domain.QnaDetailVO;
import com.griptk.b2b.qna.domain.QnaVO;

@Controller
public class QnaController {
	
	@GetMapping("/qna")
	public String list(Model model) {
		String viewPath = "qna/list";
		model.addAttribute("content_page", viewPath);
		return "_template/main";
	}
	
	@RequestMapping("/qna/view")
	public String detail(Model model,@RequestParam("id") String qnaId) {
		String viewPath = "qna/detail";
		model.addAttribute("content_page", viewPath);
		
		//[TO-DO]query detail data and setAttribute in mav. Create temporary data in detail.jsp for now.
		QnaVO qnaVo = new QnaVO(12,"이건 제목입니다.","이러쿵저러쿵에 대해서 질문해도 되죠?","2019-12-04","답변 완료");
		model.addAttribute("detailObject",qnaVo);
		
		//[TO-DO]query answer data and setAttribute in mav. NO DATABASE AVAILABLE ATM FOR ANSWERS.
//		QnaDetailVO qdv = new QnaDetailVO(12, null);
		QnaDetailVO qdv = new QnaDetailVO(12, "이러쿵저러쿵에 대한 관리자의 답변입니다.");
		
		model.addAttribute("answerObject",qdv);
		
		return "_template/main";
	}
	
	@GetMapping("/qna/edit")
	public String write(Model model) {
		String viewPath = "qna/write";
		model.addAttribute("content_page", viewPath);
		
		return "_template/main";
	}
}
