package com.griptk.b2b.product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.griptk.b2b.product.mapper.CategoryMapper;
import com.griptk.b2b.product.mapper.ProductMapper;

@Controller
public class MProductController {
	@Autowired
	private ProductMapper productMapper;

	@RequestMapping("/admin/products")
	public String goAdminProducts(Model model) {
		int list_cnt = productMapper.getAllCounts();
		model.addAttribute("list_cnt", list_cnt);
		model.addAttribute("content_page", "product/admin/mng_list");
		return "_template/admin";
	}

	@RequestMapping("/admin/products/edit")
	public String goAdminProductEdit(Model model, @RequestParam("product_id") int product_id) {
		model.addAttribute("product_id", product_id);
		model.addAttribute("content_page", "product/admin/mng_edit");
		return "_template/admin";
	}
	
	@RequestMapping("/admin/new-product")
	public String goAdminProductNew(Model model) {
		model.addAttribute("content_page", "product/admin/mng_new");
		return "_template/admin";
	}
	
	@RequestMapping("/admin/dc-products")
	public String goAdminDcProducts(Model model) {
		int list_cnt = productMapper.getDCCounts();
		model.addAttribute("list_cnt", list_cnt);
		model.addAttribute("dc_only", true);
		model.addAttribute("content_page", "product/admin/mng_list");
		return "_template/admin";
	}
	
	@RequestMapping("/admin/dc-products/edit")
	public String goAdminDcProductEdit(Model model, @RequestParam("product_id") int product_id) {
		model.addAttribute("dc_only", true);
		model.addAttribute("product_id", product_id);
		model.addAttribute("content_page", "product/admin/mng_edit");
		return "_template/admin";
	}
	
	@RequestMapping("/admin/new-dc-product")
	public String goAdminDcProductNew(Model model) {
		model.addAttribute("dc_only", true);
		model.addAttribute("content_page", "product/admin/mng_new");
		return "_template/admin";
	}
	
	@RequestMapping("/admin/category")
	public String goAdminCetegory(Model model) {
		model.addAttribute("content_page", "product/admin/mng_category");
		return "_template/admin";
	}	
}
