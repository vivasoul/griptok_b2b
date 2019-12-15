package com.griptk.b2b.product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.griptk.b2b.common.domain.PageLabelVO;
import com.griptk.b2b.product.mapper.ProductMapper;

@Controller
public class ProductController {
	@Autowired
	private ProductMapper productMapper;
	
	@RequestMapping("/main")
	public String goMainPage(Model model) {
		model.addAttribute("content_page", "product/list");
		
		return "_template/main";
	}
	
	@RequestMapping("/main/all")
	public String goAllPage(Model model) {
		int cnt = productMapper.getAllCounts();
		
		model.addAttribute("page_title","전체상품("+cnt+")");
		model.addAttribute("page_path","홈 > 전체상품("+cnt+")");
		model.addAttribute("list_url","/products");
		model.addAttribute("content_page", "product/filtered_list");
		return "_template/main";
	}
	
	@RequestMapping("/main/brand")
	public String goBrandPage(Model model,
							 @RequestParam(value="p_id",required=false) Integer p_id,
							 @RequestParam(value="id",required=false) Integer c_id) {
		if(p_id == null) {
			return "redirect:/main";
		}else {
			PageLabelVO label = null;
			String list_url = null;
			
			if(c_id == null)  {
				label = productMapper.getPageLabel_B(p_id);
				list_url = "/products/brand/"+p_id;
			}else {
				label = productMapper.getPageLabel_BB(c_id);
				list_url = "/products/brand/"+p_id+"/"+c_id;
			}
			
			model.addAttribute("page_title", label.getTitle());
			model.addAttribute("page_path", label.getPath());
			model.addAttribute("list_url",list_url);
			model.addAttribute("content_page", "product/filtered_list");
		}
		return "_template/main";
	}
	
	@RequestMapping("/main/craft")
	public String goCraftPage(Model model,
							 @RequestParam(value="p_id",required=false) Integer p_id,
							 @RequestParam(value="id",required=false) Integer c_id) {
		if(p_id == null) {
			return "redirect:/main";
		}else {
			PageLabelVO label = null;
			String list_url = null;
			
			if(c_id == null)  {
				label = productMapper.getPageLabel_C(p_id);
				list_url = "/products/craft/"+p_id;
			}else {
				label = productMapper.getPageLabel_CC(c_id);
				list_url = "/products/craft/"+p_id+"/"+c_id;
			}
			
			model.addAttribute("page_title", label.getTitle());
			model.addAttribute("page_path", label.getPath());
			model.addAttribute("list_url", list_url);
			model.addAttribute("content_page", "product/filtered_list");
		}
		return "_template/main";
	}
	
	@RequestMapping("/main/dc")
	public String goDCPage(Model model) {
		int cnt = productMapper.getDCCounts();
		
		model.addAttribute("page_title","특가상품("+cnt+")");
		model.addAttribute("page_path","홈 > 특가상품("+cnt+")");
		model.addAttribute("list_url","/products/dc");
		model.addAttribute("content_page", "product/filtered_list");
		return "_template/main";
	}	
}
