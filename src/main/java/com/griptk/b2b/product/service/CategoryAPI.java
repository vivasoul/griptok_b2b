package com.griptk.b2b.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.product.domain.BrandTypeVO;
import com.griptk.b2b.product.domain.CraftTypeVO;
import com.griptk.b2b.product.mapper.CategoryMapper;

@RestController
public class CategoryAPI {
	@Autowired
	private CategoryMapper mapper;
	
	public List<BrandTypeVO> getParentBrands(){
		return mapper.listBrands(1);
	}
	
	public List<CraftTypeVO> getCrafts(){
		return mapper.listCrafts();
	}
	
}
