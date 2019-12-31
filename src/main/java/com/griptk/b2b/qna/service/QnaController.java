package com.griptk.b2b.qna.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.griptk.b2b.qna.domain.QnaDetailVO;
import com.griptk.b2b.qna.domain.QnaVO;
import com.griptk.b2b.qna.mapper.QnaMapper;

@Controller
public class QnaController {
	
	@Autowired
	QnaMapper qnaMapper;
	
	@GetMapping("/qna")
	public String list(Model model,HttpSession session) {
		String viewPath = "qna/list";
		model.addAttribute("content_page", viewPath);
		// TO-DO : GET USER_NO FROM SESSION.
		int user_no = (int) session.getAttribute("user_no");
		List<QnaVO> arr = qnaMapper.listQna(user_no);
		model.addAttribute("arr",arr);
		return "_template/main";
	}
	
	@RequestMapping("/qna/view")
	public String detail(Model model,@RequestParam("id") int qna_no) {
		String viewPath = "qna/detail";
		model.addAttribute("content_page", viewPath);
		
		QnaVO qnaVo = qnaMapper.selectQna(qna_no);
		model.addAttribute("detailObject",qnaVo);
		
		//[TO-DO]query answer data and setAttribute in mav. NO DATABASE AVAILABLE ATM FOR ANSWERS.
		QnaDetailVO qdv = new QnaDetailVO(12, "이러쿵저러쿵에 대한 관리자의 답변입니다.현재 테이블이 없군요.");
		
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
