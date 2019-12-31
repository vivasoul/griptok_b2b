package com.griptk.b2b.notice.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.notice.domain.NoticeVO;
import com.griptk.b2b.notice.mapper.NoticeMapper;
import com.griptk.b2b.qna.domain.QnaVO;

@RestController
@RequestMapping("/notices")
public class NoticeAPI {
	@Autowired
	NoticeMapper noticeMapper;
	
	@PutMapping("")
	public int increaseViewCount(@RequestBody NoticeVO noticeVo,HttpSession session) {
		// TO-DO : GET USER_NO FROM SESSION.
		int user_no = (int) session.getAttribute("user_no");
		noticeVo.setUser_no(user_no);
//		noticeVO.setNotice_no(notice_no);
		return noticeMapper.updateNoticeHist(noticeVo);
	}
}
