package com.griptk.b2b.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.griptk.b2b.notice.domain.NoticeDetailVO;
import com.griptk.b2b.notice.domain.NoticeVO;
import com.griptk.b2b.notice.mapper.NoticeMapper;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeMapper noticeMapper;
	
	@GetMapping("/notice")
	public String list(Model model) {
		String viewPath = "notice/list";
		model.addAttribute("content_page", viewPath);
		
		List<NoticeVO> arr = noticeMapper.listNotice();
		model.addAttribute("arr", arr);
		
		return "_template/main";
	}
	
	@RequestMapping("/notice/view")
	public String detail(Model model,@RequestParam("id") int notice_no) {
		String viewPath = "notice/detail";
		model.addAttribute("content_page", viewPath);
		
		NoticeDetailVO ndv = noticeMapper.selectNotice(notice_no);
		model.addAttribute("answerObject",ndv);
		
		return "_template/main";
	}
}
