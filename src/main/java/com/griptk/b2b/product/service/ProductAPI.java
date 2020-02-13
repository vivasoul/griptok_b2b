package com.griptk.b2b.product.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.griptk.b2b.product.domain.IProductSortType;
import com.griptk.b2b.product.domain.PredicateVO;
import com.griptk.b2b.product.domain.ProductDetailVO;
import com.griptk.b2b.product.domain.ProductReqVO;
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
	public List<ProductVO> getDCProducts(HttpServletRequest req){
		return mapper.listDcProducts(generatePredicate(0,req));
	}
	
	@GetMapping("")
	public List<ProductVO> getAllProducts(HttpServletRequest req){
		return mapper.listProducts(generatePredicate(0,req));
	}
	
	@GetMapping("/craft/{craft_no}")
	public List<ProductVO> getProducts_C(@PathVariable("craft_no") int craft_no, HttpServletRequest req){
		return mapper.listProducts_C(generatePredicate(craft_no,req));
	}
	
	@GetMapping("/craft/{craft_no}/{category_no}")
	public List<ProductVO> getProducts_CC(@PathVariable("craft_no") int craft_no,
										  @PathVariable("category_no") int category_no,
										  HttpServletRequest req){
		return mapper.listProducts_CC(generatePredicate(category_no,req));
	}
	
	@GetMapping("/brand/{p_brand_no}")
	public List<ProductVO> getProducts_B(@PathVariable("p_brand_no") int p_brand_no,
										 HttpServletRequest req){
		return mapper.listProducts_B(generatePredicate(p_brand_no,req));
	}
	
	@GetMapping("/brand/{p_brand_no}/{brand_no}")
	public List<ProductVO> getProducts_BB(@PathVariable("p_brand_no") int p_brand_no,
										  @PathVariable("brand_no") int brand_no,
										  HttpServletRequest req){
		return mapper.listProducts_BB(generatePredicate(brand_no,req));
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
	
	private PredicateVO generatePredicate(int id, HttpServletRequest req) {
		PredicateVO data = new PredicateVO();
		String sort_type = req.getParameter("sort_type");
		String limit 	 = req.getParameter("limit");
		String page 	 = req.getParameter("page");
		int _limit = 20;
		int _page = 0;
		
		if(limit != null) {
			try { _limit = Integer.parseInt(limit); }catch(NumberFormatException ne) {}
		}
		if(page != null) {
			try { _page = Integer.parseInt(page); }catch(NumberFormatException ne) {}
		}
		
		data.setId(id);
		data.setOrder_by(getOrderByFragment(sort_type != null ? sort_type : IProductSortType.ORDER_BY_REG_DT));
		data.setLimit(_limit);
		data.setStart(_limit*_page);
		return data;
	}
	/* API for admin(manager) */
	@PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@Transactional
	public void createProduct(@ModelAttribute ProductReqVO payload ) throws IOException, ServletException {
		//@RequestParam("title") String title, @RequestParam("files") MultipartFile[] files
		/*
		Collection<Part> parts = request.getParts();
		for(Part p: parts) {
			//p.get
		}*/
		System.out.println(payload);
		System.out.println(payload.getFiles().length);
		for(MultipartFile mf : payload.getFiles()) {
			System.out.println(mf.getName());
		}
	}
}
