package com.griptk.b2b.notice.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.notice.domain.NoticeVO;
import com.griptk.b2b.notice.mapper.NoticeMapper;

@RestController
public class NoticeAPI {
	@Autowired
	NoticeMapper noticeMapper;
	
	@GetMapping("/notice/{notice_no}")
	public int increaseViewCount(@PathVariable("notice_no") int notice_no,HttpSession session) {
		// TO-DO : GET USER_NO FROM SESSION.
		int user_no = (int) session.getAttribute("user_no");
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setUser_no(user_no);
		noticeVO.setNotice_no(notice_no);
		return noticeMapper.updateNoticeHist(noticeVO);
	}
}
