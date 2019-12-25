package com.griptk.b2b.notice.service;

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
	public int increaseViewCount(@PathVariable("notice_no") int notice_no) {
		// TO-DO : GET USER_NO FROM SESSION.
		int user_no = 13;
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setUser_no(user_no);
		noticeVO.setNotice_no(notice_no);
		return noticeMapper.updateNoticeHist(noticeVO);
	}
}
