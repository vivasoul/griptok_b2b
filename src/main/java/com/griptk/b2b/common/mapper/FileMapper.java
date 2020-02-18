package com.griptk.b2b.common.mapper;

import com.griptk.b2b.common.domain.ImageVO;

public interface FileMapper {
	int insertImgInfo(ImageVO vo);
	int updateImgInfo(ImageVO vo);
	long getImgNo();
	ImageVO getFile(long img_no);
}
