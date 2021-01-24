package com.griptk.b2b.product.mapper;

import java.util.List;

import com.griptk.b2b.product.domain.BrandTypeVO;
import com.griptk.b2b.product.domain.CategoryReqVO;
import com.griptk.b2b.product.domain.CategoryVO;
import com.griptk.b2b.product.domain.CraftTypeVO;

public interface CategoryMapper {
	List<BrandTypeVO> listBrands(int p_brand_no);
	List<BrandTypeVO> listAllBrands();
	List<CraftTypeVO> listCrafts();
	
	CraftTypeVO getCraft(int craft_no);
	BrandTypeVO getBrand(int brand_no);
	
	List<CategoryVO> listCategory();
	List<CategoryVO> listCategoryEX(CategoryReqVO vo);
	
	int createBrand(BrandTypeVO vo);
	int updateBrand(BrandTypeVO vo);
	
	int createCraft(CraftTypeVO vo);
	int updateCraft(CraftTypeVO vo);
	
	int createCategory(CategoryReqVO vo);
	int updateCategory(CategoryReqVO vo);
}
