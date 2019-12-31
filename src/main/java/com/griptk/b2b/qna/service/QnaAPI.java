package com.griptk.b2b.qna.service;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.qna.domain.QnaVO;
import com.griptk.b2b.qna.mapper.QnaMapper;


@RestController
@RequestMapping("/qnas")
public class QnaAPI {
	@Autowired
	private QnaMapper qnaMapper;
	
	@PutMapping("")
	public int edit(@RequestBody QnaVO qnaVo) {
		return qnaMapper.edit(qnaVo);
	}
	
	@PostMapping("")
	public int insert(@RequestBody QnaVO qnaVo,HttpSession session) {
		//TO-DO : get user_no from session.
		int user_no = (int) session.getAttribute("user_no");
		qnaVo.setUser_no(user_no);
		return qnaMapper.insert(qnaVo);
	}
}
