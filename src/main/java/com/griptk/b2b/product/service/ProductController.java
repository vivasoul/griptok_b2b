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
public class ProductController {
	@Autowired
	private CategoryMapper categoryMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private MenuMapper menuMapper;
	
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
			PageLabelVO label = getPageLabel('B', p_id, c_id == null ? 0 : c_id);
						
			model.addAttribute("page_title", label.getTitle());
			model.addAttribute("page_path", label.getPath());
			model.addAttribute("list_url", label.getList_url());
			model.addAttribute("side_title", label.getSide_title());
			model.addAttribute("side_menus", label.getSub_menus());
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
			PageLabelVO label = getPageLabel('C', p_id, c_id == null ? 0 : c_id);

			model.addAttribute("page_title", label.getTitle());
			model.addAttribute("page_path", label.getPath());
			model.addAttribute("list_url", label.getList_url());
			model.addAttribute("side_title", label.getSide_title());
			model.addAttribute("side_menus", label.getSub_menus());
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
	
	@RequestMapping("/main/detail")
	public String goDetailPage(Model model,
							  @RequestParam("product_id") int product_id,
							  @RequestParam(value="mode",defaultValue = "0") char mode,
							  @RequestParam(value="p_id",defaultValue = "0") int p_id,
							  @RequestParam(value="id",defaultValue = "0") int c_id) {
		
		PageLabelVO label = getPageLabel(mode, p_id, c_id);
		
		if(label != null) {
			//model.addAttribute("page_title", label.getTitle());
			model.addAttribute("page_path", label.getPath());
			model.addAttribute("side_title", label.getSide_title());
			model.addAttribute("side_menus", label.getSub_menus());
		}
		model.addAttribute("product_id", product_id);
		model.addAttribute("content_page", "product/detail");
		return "_template/main";
	}
	
	private PageLabelVO getPageLabel(char mode, int p_id, int c_id) {
		PageLabelVO label = null;
		String list_url = null;
		String side_title = null;
		List<MenuVO> sub_menus = null;
		switch(mode) {
			case 'B':
				if(c_id < 1)  {
					label = productMapper.getPageLabel_B(p_id);
					list_url = "/products/brand/"+p_id;
				}else {
					label = productMapper.getPageLabel_BB(c_id);
					list_url = "/products/brand/"+p_id+"/"+c_id;
				}
				sub_menus = menuMapper.listMenusByBrand(p_id);
				side_title = categoryMapper.getBrand(p_id).getBrand_nm();
				break;
			case 'C':
				if(c_id < 1)  {
					label = productMapper.getPageLabel_C(p_id);
					list_url = "/products/craft/"+p_id;
				}else {
					label = productMapper.getPageLabel_CC(c_id);
					list_url = "/products/craft/"+p_id+"/"+c_id;
				}
				sub_menus = menuMapper.listMenusByCraft(p_id);
				side_title = categoryMapper.getCraft(p_id).getCraft_nm();
				break;
			default:
		}
		if(label != null) {
			label.setList_url(list_url);
			label.setSide_title(side_title);
			label.setSub_menus(sub_menus);
		}
		return label;
	}
}
