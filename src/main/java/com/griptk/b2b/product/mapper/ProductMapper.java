package com.griptk.b2b.product.mapper;

import java.util.List;

import com.griptk.b2b.product.domain.ProductVO;

public interface ProductMapper {
	List<ProductVO> listNewProducts();
	List<ProductVO> listBestProducts();
	List<ProductVO> listDcProducts();
}
