package com.griptk.b2b.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.product.domain.BrandTypeVO;
import com.griptk.b2b.product.domain.CategoryReqVO;
import com.griptk.b2b.product.domain.CategoryVO;
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
	
	@GetMapping("/brands/all")
	public List<BrandTypeVO> listAllChildBrands(){
		return mapper.listAllBrands();
	}	
	
	@GetMapping("/crafts")
	public List<CraftTypeVO> listCrafts(){
		return mapper.listCrafts();
	}
	
	@GetMapping("/crafts/{craft_no}")
	public CraftTypeVO getCraft(int craft_no){
		return mapper.getCraft(craft_no);
	}
	
	@GetMapping("/brands/{brand_no}")
	public BrandTypeVO getBrand(int brand_no){
		return mapper.getBrand(brand_no);
	}	
	
	@GetMapping
	public List<CategoryVO> listCategories(@RequestParam(value="brand_no", defaultValue="-1") int brand_no, 
																 @RequestParam(value="craft_no", defaultValue="-1") int craft_no){
		if(brand_no > -1 && craft_no > -1) {
			CategoryReqVO vo = new CategoryReqVO();
			vo.setBrand_no(brand_no);
			vo.setCraft_no(craft_no);
			return mapper.listCategoryEX(vo);
		}else {
			return mapper.listCategory();
		}
	}
	@PostMapping("/brands")
	public void createBrand(@RequestBody BrandTypeVO vo) {
		mapper.createBrand(vo);
	}
	@PutMapping("/brands/{brand_no}")
	public void updateBrand(@PathVariable int brand_no, @RequestBody BrandTypeVO vo) {
		vo.setBrand_no(brand_no);
		mapper.updateBrand(vo);
	}
	
	@PostMapping("/crafts")
	public void createCraft(@RequestBody CraftTypeVO vo) {
		mapper.createCraft(vo);
	}
	@PutMapping("/crafts/{craft_no}")
	public void updateCraft(@PathVariable int craft_no, @RequestBody CraftTypeVO vo) {
		vo.setCraft_no(craft_no);
		mapper.updateCraft(vo);
	}
	
	@PostMapping
	public void createCategory(@RequestBody CategoryReqVO vo) {
		mapper.createCategory(vo);
	}
	@PutMapping("/{category_no}")
	public void updateCategory(@PathVariable int category_no, @RequestBody CategoryReqVO vo) {
		vo.setCategory_no(category_no);
		mapper.updateCategory(vo);
	}
}
