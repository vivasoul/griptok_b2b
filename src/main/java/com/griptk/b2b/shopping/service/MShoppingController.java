package com.griptk.b2b.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.griptk.b2b.shopping.domain.IOrderStatus;
import com.griptk.b2b.shopping.mapper.OrderMapper;

@Controller
public class MShoppingController {
	@Autowired
	private OrderMapper orderMapper;	
	
	@RequestMapping("/admin/ordered")
	public String goAdminOrdered(Model model) {
		int list_cnt = orderMapper.getOrdersCntInStatus(IOrderStatus.COMPLETE_PAYMENT);
		model.addAttribute("list_cnt", list_cnt);		
		model.addAttribute("content_page", "order_hst/admin/list");
		return "_template/admin";
	}
	
	@RequestMapping("/admin/check-deposit")
	public String goAdminDeposit(Model model) {
		int list_cnt = orderMapper.getOrdersCntInStatus(IOrderStatus.WAITING_PAYMENT);
		model.addAttribute("list_cnt", list_cnt);		
		model.addAttribute("content_page", "order_hst/admin/deposit_list");
		return "_template/admin";
	}
	
	@RequestMapping("/admin/delivery")
	public String goAdminDelivery(Model model) {
		int list_cnt = orderMapper.getOrdersCntInStatus(IOrderStatus.WAITING_DELIVERY);
		model.addAttribute("list_cnt", list_cnt);		
		model.addAttribute("content_page", "order_hst/admin/delivery_list");
		return "_template/admin";
	}
	
	@RequestMapping("/admin/delivery-monitor")
	public String goAdminDeliveryMon(Model model) {
		int list_cnt = orderMapper.getOrdersCntInStatus(IOrderStatus.ON_DELIVERY);
		model.addAttribute("list_cnt", list_cnt);		
		model.addAttribute("content_page", "order_hst/admin/delivery_mon_list");
		return "_template/admin";
	}	
}
