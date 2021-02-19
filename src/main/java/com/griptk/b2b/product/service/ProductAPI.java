package com.griptk.b2b.product.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.griptk.b2b.common.service.FileAPI;
import com.griptk.b2b.product.domain.IProductSortType;
import com.griptk.b2b.product.domain.OptionVO;
import com.griptk.b2b.product.domain.PredicateVO;
import com.griptk.b2b.product.domain.ProductDetailVO;
import com.griptk.b2b.product.domain.ProductImgReqVO;
import com.griptk.b2b.product.domain.ProductReqVO;
import com.griptk.b2b.product.domain.ProductRespVO;
import com.griptk.b2b.product.domain.ProductVO;
import com.griptk.b2b.product.mapper.OptionMapper;
import com.griptk.b2b.product.mapper.ProductMapper;

@RestController
@RequestMapping("/products")
@SessionAttributes({"user_no"})
public class ProductAPI {
	@Autowired
	private ProductMapper mapper;

	@Autowired
	private OptionMapper optionMapper;	
	
	@Autowired
	private FileAPI fileAPI;
	
	@GetMapping("/new")
	public List<ProductVO> getNewProducts(@ModelAttribute("user_no") int user_no){
		return mapper.listNewProducts(user_no);
	}
	
	@GetMapping("/best")
	public List<ProductVO> getBestProducts(@ModelAttribute("user_no") int user_no){
		return mapper.listBestProducts(user_no);
	}
	
	@GetMapping("/dc")
	public List<ProductVO> getDCProducts(@ModelAttribute("user_no") int user_no, HttpServletRequest req){
		return mapper.listDcProducts(generatePredicate(user_no, 0,req));
	}
	
	@GetMapping("")
	public List<ProductVO> getAllProducts(@ModelAttribute("user_no") int user_no, HttpServletRequest req){
		return mapper.listProducts(generatePredicate(user_no, 0,req));
	}
	
	@GetMapping("/craft/{craft_no}")
	public List<ProductVO> getProducts_C(@ModelAttribute("user_no") int user_no, @PathVariable("craft_no") int craft_no, HttpServletRequest req){
		return mapper.listProducts_C(generatePredicate(user_no, craft_no,req));
	}
	
	@GetMapping("/craft/{craft_no}/{category_no}")
	public List<ProductVO> getProducts_CC(@ModelAttribute("user_no") int user_no,
										  @PathVariable("craft_no") int craft_no,
										  @PathVariable("category_no") int category_no,
										  HttpServletRequest req){
		return mapper.listProducts_CC(generatePredicate(user_no, category_no,req));
	}
	
	@GetMapping("/brand/{p_brand_no}")
	public List<ProductVO> getProducts_B(@ModelAttribute("user_no") int user_no,
										 @PathVariable("p_brand_no") int p_brand_no,
										 HttpServletRequest req){
		return mapper.listProducts_B(generatePredicate(user_no, p_brand_no,req));
	}
	
	@GetMapping("/brand/{p_brand_no}/{brand_no}")
	public List<ProductVO> getProducts_BB(@ModelAttribute("user_no") int user_no,
										  @PathVariable("p_brand_no") int p_brand_no,
										  @PathVariable("brand_no") int brand_no,
										  HttpServletRequest req){
		return mapper.listProducts_BB(generatePredicate(user_no, brand_no,req));
	}
	@GetMapping("/{product_id}")
	public ProductDetailVO getDetail(@PathVariable("product_id") int product_id) {
		ProductDetailVO result = mapper.getDetail(product_id);
		List<String> images = mapper.getImages(product_id);
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
	
	private PredicateVO generatePredicate(int user_no, int id, HttpServletRequest req) {
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
		data.setUser_no(user_no);
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
		//ProductImgReqVO imgReq = fileAPI.uploadProductImage(0, payload.getThumb_file());
		//long thumb_img_no = imgReq.getImg_no();
		//payload.setThumb_img_no(thumb_img_no);
		
		int result = mapper.create(payload);
		
		int product_id = 0;
		if(result != 0) {
			product_id = mapper.insertedId();
			payload.setProduct_id(product_id);
			
			List<ProductImgReqVO> images = getDetailImgs(product_id, payload.getImgs());
			if(!images.isEmpty()) {
				mapper.createImages(images);
			}
			mapper.createDetail(payload);
			updateOptions(payload);
		}
	}
	
	@GetMapping("/{product_id}/edit")
	public ProductRespVO getDetailForEdit(@PathVariable("product_id") int product_id) {
		ProductRespVO result = mapper.getDetail_2(product_id);
		List<ProductImgReqVO> images = mapper.getDetailImages_3(product_id);
		List<OptionVO> options = optionMapper.getOptions(product_id);
		result.setFiles(images);	
		result.setOptions(options);
		return result;
	}	
	
	@PostMapping(value="/{product_id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@Transactional
	public void updateProduct(	@PathVariable int product_id,
								@ModelAttribute ProductReqVO payload) throws IOException, ServletException {
		//long thumb_img_no = payload.getThumb_img_no();
		//if(thumb_img_no > 0) fileAPI.uploadProductImage(product_id, thumb_img_no, payload.getThumb_file());
		
		payload.setProduct_id(product_id);
		int result = mapper.update(payload);
		
		if(result != 0) {
			//long[] img_nos = payload.getImg_nos();
			//if(img_nos != null) {
				List<ProductImgReqVO> images = getDetailImgs(product_id, payload.getImgs());
				if(!images.isEmpty()) mapper.createImages(images);
			//}
			mapper.updateDetail(payload);
			updateOptions(payload);
		}
	}	
	
	@DeleteMapping
	public void deleteProducts(@RequestBody List<ProductReqVO> list) {
		if(!list.isEmpty()) mapper.delete(list);
	}
	
	@DeleteMapping("/all")
	public void deleteAllProducts() {
		mapper.deleteAll();
	}
	
	@PutMapping("/dc")
	public void setToDCProducts(@RequestBody List<ProductReqVO> list) {
		if(!list.isEmpty()) mapper.changeToDC(list);
	}
	
	private void updateOptions(ProductReqVO vo){
		if(vo.getOption_no() != null) {
			int product_id = vo.getProduct_id();
			
			int[] option_nos = vo.getOption_no();
			String[] option_txts = vo.getOption_txt();
			String[] option_del_yns = vo.getOption_del_yn();
			
			int len = vo.getOption_no().length;
			
			for(int i=0; i<len; i++) {
				int option_no = option_nos[i];
				String option_txt = option_txts[i];
				String option_del_yn = option_del_yns[i];
				
				OptionVO opt = new OptionVO();
				opt.setProduct_id(product_id);
				opt.setOption_no(option_no);
				opt.setOption_txt(option_txt);
				
				if(option_no < 0) {
					/* add option */
					optionMapper.insertOption(opt);
				}else if(option_del_yn.equals("Y")){
					/* delete option */
					optionMapper.deleteOption(opt);
				}else {
					/* update option */
					optionMapper.updateOption(opt);
				}
			}
		}
	}
	
	private List<ProductImgReqVO> getDetailImgs(int product_id, String[] links){
		List<ProductImgReqVO> _imgs = new ArrayList<>();
		
		int i=0;
		for(String link: links) {
			i++;
			ProductImgReqVO vo = new ProductImgReqVO();
			vo.setProduct_id(product_id);
			vo.setImg_link(link);
			vo.setSort_no(i);
			_imgs.add(vo);
		}
		
		return _imgs;
	}
}
