package com.griptk.b2b.product.mapper;

import java.util.List;

import com.griptk.b2b.product.domain.BrandTypeVO;
import com.griptk.b2b.product.domain.CraftTypeVO;

public interface CategoryMapper {
	List<BrandTypeVO> listBrands(int p_brand_no);
	List<CraftTypeVO> listCrafts();
}
