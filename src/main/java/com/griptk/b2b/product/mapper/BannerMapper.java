package com.griptk.b2b.product.mapper;

import java.util.List;

import com.griptk.b2b.product.domain.BannerVO;

public interface BannerMapper {
	int save(List<BannerVO> list);
	List<BannerVO> list();
}
