package com.griptk.b2b.product.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.product.domain.ProductVO;
import com.griptk.b2b.product.mapper.ProductMapper;

@RestController
@RequestMapping("/products")
public class ProductAPI {	
	@Autowired
	private ProductMapper mapper;
	
	@GetMapping("/new")
	public List<ProductVO> getNewProducts(){
		return mapper.listNewProducts();
	}
	
	@GetMapping("/best")
	public List<ProductVO> getBestProducts(){
		return mapper.listBestProducts();
	}
	
	@GetMapping("/dc")
	public List<ProductVO> getDCProducts(){
		return mapper.listDcProducts();
	}
	
	@GetMapping("")
	public List<ProductVO> getAllProducts(){
		return mapper.listProducts();
	}
	
	@GetMapping("/craft/{craft_no}")
	public List<ProductVO> getProducts_C(@PathVariable("craft_no") int craft_no){
		return mapper.listProducts_C(craft_no);
	}
	
	@GetMapping("/craft/{craft_no}/{category_no}")
	public List<ProductVO> getProducts_CC(@PathVariable("craft_no") int craft_no,
										  @PathVariable("category_no") int category_no){
		return mapper.listProducts_CC(category_no);
	}
	
	@GetMapping("/brand/{p_brand_no}")
	public List<ProductVO> getProducts_B(@PathVariable("p_brand_no") int p_brand_no){
		return mapper.listProducts_B(p_brand_no);
	}
	
	@GetMapping("/brand/{p_brand_no}/{brand_no}")
	public List<ProductVO> getProducts_BB(@PathVariable("p_brand_no") int p_brand_no,
										  @PathVariable("brand_no") int brand_no){
		return mapper.listProducts_BB(brand_no);
	}
}
