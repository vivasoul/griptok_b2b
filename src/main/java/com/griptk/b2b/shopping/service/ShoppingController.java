package com.griptk.b2b.shopping.service;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.griptk.b2b.shopping.domain.OrderDetailVO;
import com.griptk.b2b.shopping.domain.OrderedVO;

@Controller
public class ShoppingController {
	
	@GetMapping("/interested")
	public String list() {
		return "interested/list";
	}
	
	@GetMapping("/order_hst")
	public String hst_list() {
		return "order_hst/list";
	}
	
	@GetMapping("/order_hst/{order_no}")
	public ModelAndView hst_detail(@PathVariable String order_no,ModelMap model) {
		String viewPath = "order_hst/detail";
		ModelAndView mav =  new ModelAndView(viewPath);
		
		//[TO-DO]query detail data and setAttribute in mav. Create temporary data in detail.jsp for now.
		ArrayList<OrderDetailVO> arr = new OrderDetailVO().list();
		OrderedVO one = new OrderedVO().one();
		
		mav.addObject("arr",arr);
		mav.addObject("one",one);
		
		return mav;
	}
}

