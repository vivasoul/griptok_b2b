package com.griptk.b2b.util.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.griptk.b2b.product.domain.BrandTypeVO;
import com.griptk.b2b.product.domain.CraftTypeVO;
import com.griptk.b2b.product.service.CategoryAPI;

public class CategoryManager {
	private List<CraftTypeVO> crafts;
	private List<BrandTypeVO> p_brands;
	private CategoryAPI api;	
	
	public CategoryManager(CategoryAPI api) {
		this.api = api;
		refresh();
	}
	
	public void refresh() {
		crafts = api.getCrafts();
		p_brands = api.getParentBrands();
	}
	
	public List<CraftTypeVO> getCrafts(){
		return crafts;
	}
	
	public List<BrandTypeVO> getParentBrands(){
		return p_brands;
	}
}
