package com.griptk.b2b.common.mapper;

import com.griptk.b2b.user.domain.ImageVO;

public interface FileMapper {
	int insertImgInfo(ImageVO vo);
	long getImgNo();
}
