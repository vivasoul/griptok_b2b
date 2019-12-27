package com.griptk.b2b.shopping.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.griptk.b2b.shopping.domain.OrderDetailVO;
import com.griptk.b2b.shopping.domain.OrderVO;
import com.griptk.b2b.shopping.domain.OrderedVO;
import com.griptk.b2b.shopping.mapper.OrderMapper;

@Controller
public class ShoppingController {
	@Autowired
	OrderMapper orderMapper;
	/*****************************************************************************************
	 *	VIEW : jsp/interested
	 *****************************************************************************************/
	@GetMapping("/interested")
	public String list(Model model) {
		String viewPath = "interested/list";
		model.addAttribute("content_page", viewPath);
		
		return "_template/main";
	}
	/*****************************************************************************************
	 *	VIEW : jsp/order_hst
	 *****************************************************************************************/
	@GetMapping("/ordered")
	public String hst_list(Model model) {
		String viewPath = "order_hst/list";
		model.addAttribute("content_page", viewPath);
		
		//TO-DO : get user_no from session.
		int order_no = 13;
		List<OrderDetailVO> arr = orderMapper.listOrder(order_no);
		model.addAttribute("arr",arr);
		
		return "_template/main";
	}
	
	@GetMapping("/ordered/view")
	public String hst_detail(Model model,@RequestParam("id") String order_no) {
		String viewPath = "order_hst/detail";
		model.addAttribute("content_page", viewPath);
		//TO-DO : get user_no from session.
		int user_no = 13;
		OrderedVO dtoVo = new OrderedVO();
		dtoVo.setUser_no(user_no);
		dtoVo.setOrder_no(order_no);
		OrderedVO one = orderMapper.selectOrder(dtoVo);
		//[TO-DO]query detail data and setAttribute in mav. Create temporary data in detail.jsp for now.
		List<OrderVO> arr = orderMapper.listChildOrder(dtoVo);
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

