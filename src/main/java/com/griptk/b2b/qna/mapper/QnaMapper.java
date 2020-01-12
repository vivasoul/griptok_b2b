package com.griptk.b2b.qna.mapper;

import java.util.List;

import com.griptk.b2b.qna.domain.QnaVO;

public interface QnaMapper {
	List<QnaVO> listAll();
	List<QnaVO> listQna(int user_no);
	QnaVO selectQna(int qna_no);
	int edit(QnaVO qnaVo);
	int insert(QnaVO qnaVo);
}
