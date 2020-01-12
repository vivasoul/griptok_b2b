package com.griptk.b2b.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.product.domain.IProductSortType;
import com.griptk.b2b.product.domain.ProductDetailVO;
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
	public List<ProductVO> getDCProducts(@RequestParam(value="sort_type", defaultValue=IProductSortType.ORDER_BY_REG_DT) String sort_type){
		String order_by = getOrderByFragment(sort_type);
		return mapper.listDcProducts(order_by);
	}
	
	@GetMapping("")
	public List<ProductVO> getAllProducts(@RequestParam(value="sort_type", defaultValue=IProductSortType.ORDER_BY_REG_DT) String sort_type){
		String order_by = getOrderByFragment(sort_type);
		return mapper.listProducts(order_by);
	}
	
	@GetMapping("/craft/{craft_no}")
	public List<ProductVO> getProducts_C(@PathVariable("craft_no") int craft_no,
										 @RequestParam(value="sort_type", defaultValue=IProductSortType.ORDER_BY_REG_DT) String sort_type){
		String order_by = getOrderByFragment(sort_type);
		return mapper.listProducts_C(craft_no, order_by);
	}
	
	@GetMapping("/craft/{craft_no}/{category_no}")
	public List<ProductVO> getProducts_CC(@PathVariable("craft_no") int craft_no,
										  @PathVariable("category_no") int category_no,
										  @RequestParam(value="sort_type", defaultValue=IProductSortType.ORDER_BY_REG_DT) String sort_type){
		String order_by = getOrderByFragment(sort_type);
		return mapper.listProducts_CC(category_no, order_by);
	}
	
	@GetMapping("/brand/{p_brand_no}")
	public List<ProductVO> getProducts_B(@PathVariable("p_brand_no") int p_brand_no,
										 @RequestParam(value="sort_type", defaultValue=IProductSortType.ORDER_BY_REG_DT) String sort_type){
		String order_by = getOrderByFragment(sort_type);
		return mapper.listProducts_B(p_brand_no, order_by);
	}
	
	@GetMapping("/brand/{p_brand_no}/{brand_no}")
	public List<ProductVO> getProducts_BB(@PathVariable("p_brand_no") int p_brand_no,
										  @PathVariable("brand_no") int brand_no,
										  @RequestParam(value="sort_type", defaultValue=IProductSortType.ORDER_BY_REG_DT) String sort_type){
		String order_by = getOrderByFragment(sort_type);
		return mapper.listProducts_BB(brand_no, order_by);
	}
	@GetMapping("/{product_id}")
	public ProductDetailVO getDetail(@PathVariable("product_id") int product_id) {
		ProductDetailVO result = mapper.getDetail(product_id);
		List<String> images = mapper.getDetailImages(product_id);
		result.setImages(images);
		return result;
	}
	
	private String getOrderByFragment(String sort_type) {
		switch(sort_type) {
			case IProductSortType.ORDER_BY_LOW_PRICE: return "ORDER BY sales_price";
			case IProductSortType.ORDER_BY_SALES:	  return "ORDER BY a.reg_dt desc";
			default:								  return "ORDER BY a.reg_dt desc";
		}
	}
}
