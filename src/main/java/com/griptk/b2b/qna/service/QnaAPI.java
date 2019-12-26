package com.griptk.b2b.qna.service;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.qna.domain.QnaVO;
import com.griptk.b2b.qna.mapper.QnaMapper;


@RestController
public class QnaAPI {
	@Autowired
	private QnaMapper qnaMapper;
	
	@PostMapping("/qna/content")
	public int edit(@RequestBody QnaVO qnaVo) {
		return qnaMapper.edit(qnaVo);
	}
	
	@PostMapping("/qna/insert")
	public int insert(@RequestBody QnaVO qnaVo) {
		//TO-DO : get user_no from session.
		int user_no = 13;
		qnaVo.setUser_no(user_no);
		return qnaMapper.insert(qnaVo);
	}
}
