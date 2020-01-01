package com.griptk.b2b.shopping.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestParam;

import com.griptk.b2b.shopping.domain.CartedVO;
import com.griptk.b2b.shopping.domain.OrderDetailVO;
import com.griptk.b2b.shopping.domain.OrderVO;
import com.griptk.b2b.shopping.domain.OrderedVO;
import com.griptk.b2b.shopping.mapper.CartMapper;
import com.griptk.b2b.shopping.mapper.OrderMapper;

@Controller
public class ShoppingController {
	@Autowired
	OrderMapper orderMapper;
	
	@Autowired
	CartMapper cartMapper;
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
	public String hst_list(Model model,HttpSession session) {
		String viewPath = "order_hst/list";
		model.addAttribute("content_page", viewPath);
		
		//TO-DO : get user_no from session.
		int user_no = (int) session.getAttribute("user_no");
		List<OrderDetailVO> arr = orderMapper.listOrder(user_no);
		model.addAttribute("arr",arr);
		
		return "_template/main";
	}
	
	@GetMapping("/ordered/view")
	public String hst_detail(Model model,@RequestParam("id") String order_no,HttpSession session) {
		String viewPath = "order_hst/detail";
		model.addAttribute("content_page", viewPath);
		//TO-DO : get user_no from session.
		int user_no = (int) session.getAttribute("user_no");
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
	public String cart_list(Model model,HttpSession session) {
		String viewPath = "cart/list";
		model.addAttribute("content_page", viewPath);
		
		//TO-DO : get user_no from session.
		int user_no = (int) session.getAttribute("user_no");
		List<CartedVO> arr = cartMapper.listCarted(user_no);
		model.addAttribute("arr",arr);
		
		return "_template/main";
	}
	
	
}

