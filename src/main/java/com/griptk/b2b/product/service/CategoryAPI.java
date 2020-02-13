package com.griptk.b2b.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.product.domain.BrandTypeVO;
import com.griptk.b2b.product.domain.CraftTypeVO;
import com.griptk.b2b.product.mapper.CategoryMapper;

@RestController
@RequestMapping("/categories")
public class CategoryAPI {
	@Autowired
	private CategoryMapper mapper;
	
	@GetMapping("/brands")
	public List<BrandTypeVO> listParentBrands(@RequestParam(value="p_brand_no", defaultValue="1") int p_brand_no){
		return mapper.listBrands(p_brand_no);
	}
	
	@GetMapping("/crafts")
	public List<CraftTypeVO> listCrafts(){
		return mapper.listCrafts();
	}
	
	@GetMapping("/crafts/{brand_no}")
	public CraftTypeVO getCraft(int craft_no){
		return mapper.getCraft(craft_no);
	}
	
	@GetMapping("/brands/{brand_no}")
	public BrandTypeVO getBrand(int brand_no){
		return mapper.getBrand(brand_no);
	}	
}
