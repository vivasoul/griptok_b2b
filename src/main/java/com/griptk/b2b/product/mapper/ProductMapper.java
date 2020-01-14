package com.griptk.b2b.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.griptk.b2b.common.domain.PageLabelVO;
import com.griptk.b2b.product.domain.ProductDetailVO;
import com.griptk.b2b.product.domain.ProductVO;

public interface ProductMapper {
	List<ProductVO> listNewProducts();
	List<ProductVO> listBestProducts();
	List<ProductVO> listDcProducts(@Param("order_by") String order_by);
	List<ProductVO> listProducts(@Param("order_by") String order_by);
	List<ProductVO> listProducts_C(@Param("craft_no") int craft_no, @Param("order_by") String order_by);
	List<ProductVO> listProducts_CC(@Param("category_no") int category_no, @Param("order_by") String order_by);
	List<ProductVO> listProducts_B(@Param("p_brand_no") int p_brand_no, @Param("order_by") String order_by);
	List<ProductVO> listProducts_BB(@Param("brand_no") int brand_no, @Param("order_by") String order_by);	
	
	int getAllCounts();
	int getDCCounts();
	
	PageLabelVO getPageLabel_C(int craft_no);
	PageLabelVO getPageLabel_CC(int category_no);
	PageLabelVO getPageLabel_B(int p_brand_no);
	PageLabelVO getPageLabel_BB(int brand_no);
	
	ProductDetailVO getDetail(int product_id);
	List<String> getDetailImages(int product_id);
}