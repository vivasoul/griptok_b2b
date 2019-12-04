package com.griptk.b2b.qna.service;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.griptk.b2b.qna.domain.QnaDetailVO;
import com.griptk.b2b.qna.domain.QnaVO;

@Controller
public class QnaController {
	
	@GetMapping("/qna")
	public String list() {
		return "qna/list";
	}
	
	@RequestMapping("/qna/{qnaId}")
	public ModelAndView detail(@PathVariable String qnaId,ModelMap model) {
		String viewPath = "qna/detail";
		ModelAndView mav =  new ModelAndView(viewPath);
		
		//[TO-DO]query detail data and setAttribute in mav. Create temporary data in detail.jsp for now.
		QnaVO qnaVo = new QnaVO(12,"이건 제목입니다.","이러쿵저러쿵에 대해서 질문해도 되죠?","2019-12-04","답변 완료");
		mav.addObject("detailObject",qnaVo);
		
		//[TO-DO]query answer data and setAttribute in mav. NO DATABASE AVAILABLE ATM FOR ANSWERS.
//		QnaDetailVO qdv = new QnaDetailVO(12, null);
		QnaDetailVO qdv = new QnaDetailVO(12, "이러쿵저러쿵에 대한 관리자의 답변입니다.");
		
		mav.addObject("answerObject",qdv);
		
		return mav;
	}
	
	@GetMapping("/qna/write")
	public String write() {
		return "qna/write";
	}
}
