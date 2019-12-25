package com.griptk.b2b.shopping.service;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.griptk.b2b.shopping.domain.OrderDetailVO;
import com.griptk.b2b.shopping.domain.OrderedVO;

@Controller
public class ShoppingController {
	/*****************************************************************************************
	 *	VIEW : jsp/interested
	 *****************************************************************************************/
	@GetMapping("/interested")
	public String list() {
		return "interested/list";
	}
	/*****************************************************************************************
	 *	VIEW : jsp/order_hst
	 *****************************************************************************************/
	@GetMapping("/ordered")
	public String hst_list(Model model) {
		String viewPath = "order_hst/list";
		model.addAttribute("content_page", viewPath);
		return "_template/main";
	}
	
	@GetMapping("/ordered/view")
	public String hst_detail(Model model,@RequestParam("id") String order_no) {
		String viewPath = "order_hst/detail";
		model.addAttribute("content_page", viewPath);
		
		//[TO-DO]query detail data and setAttribute in mav. Create temporary data in detail.jsp for now.
		ArrayList<OrderDetailVO> arr = new OrderDetailVO().list();
		OrderedVO one = new OrderedVO().one();
		
		model.addAttribute("arr",arr);
		model.addAttribute("one",one);
		
		return "_template/main";
	}
	/*****************************************************************************************
	 *	VIEW : jsp/cart
	 *****************************************************************************************/
	@GetMapping("/carted")
	public String cart_list(Model model) {
		String viewPath = "cart/list";
		model.addAttribute("content_page", viewPath);
		return "_template/main";
	}
}

