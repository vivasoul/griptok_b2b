package com.griptk.b2b.notice.mapper;

import com.griptk.b2b.notice.domain.NoticeDetailVO;
import com.griptk.b2b.notice.domain.NoticeVO;
import java.util.List;



public interface NoticeMapper {
	List<NoticeVO> listNotice();
	NoticeDetailVO selectNotice(int notice_no);
	int updateNoticeHist(NoticeVO noticeVO);
}
