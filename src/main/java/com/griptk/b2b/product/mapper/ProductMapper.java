package com.griptk.b2b.product.mapper;

import java.util.List;

import com.griptk.b2b.common.domain.PageLabelVO;
import com.griptk.b2b.product.domain.ProductVO;

public interface ProductMapper {
	List<ProductVO> listNewProducts();
	List<ProductVO> listBestProducts();
	List<ProductVO> listDcProducts();
	List<ProductVO> listProducts();
	List<ProductVO> listProducts_C(int craft_no);
	List<ProductVO> listProducts_CC(int category_no);
	List<ProductVO> listProducts_B(int p_brand_no);
	List<ProductVO> listProducts_BB(int brand_no);	
	
	int getAllCounts();
	int getDCCounts();
	
	PageLabelVO getPageLabel_C(int craft_no);
	PageLabelVO getPageLabel_CC(int category_no);
	PageLabelVO getPageLabel_B(int p_brand_no);
	PageLabelVO getPageLabel_BB(int brand_no);
}
