package com.griptk.b2b.product.mapper;

import java.util.List;

import com.griptk.b2b.common.domain.PageLabelVO;
import com.griptk.b2b.product.domain.PredicateVO;
import com.griptk.b2b.product.domain.ProductDetailVO;
import com.griptk.b2b.product.domain.ProductImgReqVO;
import com.griptk.b2b.product.domain.ProductReqVO;
import com.griptk.b2b.product.domain.ProductRespVO;
import com.griptk.b2b.product.domain.ProductVO;

public interface ProductMapper {
	List<ProductVO> listNewProducts();
	List<ProductVO> listBestProducts();
	List<ProductVO> listDcProducts(PredicateVO vo);
	List<ProductVO> listProducts(PredicateVO vo);
	List<ProductVO> listProducts_C(PredicateVO vo);
	List<ProductVO> listProducts_CC(PredicateVO vo);
	List<ProductVO> listProducts_B(PredicateVO vo);
	List<ProductVO> listProducts_BB(PredicateVO vo);	
	
	int getAllCounts();
	int getDCCounts();
	
	PageLabelVO getPageLabel_C(int craft_no);
	PageLabelVO getPageLabel_CC(int category_no);
	PageLabelVO getPageLabel_B(int p_brand_no);
	PageLabelVO getPageLabel_BB(int brand_no);
	
	@Deprecated
	ProductDetailVO getDetail(int product_id);
	@Deprecated
	List<String> getDetailImages(int product_id);
	
	int create(ProductReqVO input);
	int insertedId();
	int createDetail(ProductReqVO input);
	int createImages(List<ProductImgReqVO> input);
	
	/* Need to be merged with getDetail/getDetailImages */
	ProductRespVO getDetail_2(int product_id);
	List<ProductImgReqVO> getDetailImages_2(int product_id);
}