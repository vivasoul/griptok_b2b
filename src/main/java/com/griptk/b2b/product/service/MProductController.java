package com.griptk.b2b.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.griptk.b2b.common.domain.MenuVO;
import com.griptk.b2b.common.domain.PageLabelVO;
import com.griptk.b2b.common.mapper.MenuMapper;
import com.griptk.b2b.product.mapper.CategoryMapper;
import com.griptk.b2b.product.mapper.ProductMapper;

@Controller
public class MProductController {
	@Autowired
	private CategoryMapper categoryMapper;
	
	@Autowired
	private ProductMapper productMapper;

	@RequestMapping("/admin/products")
	public String goAdminProducts(Model model) {
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
	public String goAdminProductEdit(Model model) {
		model.addAttribute("content_page", "product/admin/mng_new");
		return "_template/admin";
	}	
}
