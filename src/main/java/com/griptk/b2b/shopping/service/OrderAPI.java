package com.griptk.b2b.shopping.service;



import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.griptk.b2b.shopping.domain.OrderDetailVO;
import com.griptk.b2b.shopping.domain.OrderJsonVO;
import com.griptk.b2b.shopping.domain.OrderVO;
import com.griptk.b2b.shopping.domain.OrderedVO;
import com.griptk.b2b.shopping.mapper.OrderMapper;


@RestController
@RequestMapping("/orders")
@SessionAttributes({"user_no"})
public class OrderAPI {
	@Autowired
	OrderMapper orderMapper;
	
	@Transactional
	@PostMapping("")
	public int insert(
			@ModelAttribute("user_no") int user_no,
			@RequestBody OrderJsonVO orderJsonVO
			){
//		orderDetailVO.setUser_no(user_no);
//		return orderMapper.insertOrder(orderDetailVO);
		int result = 0;
		try{
			OrderDetailVO orderDetailVO = orderJsonVO.getOrderDetailVO();
			OrderedVO orderedVO = orderJsonVO.getOrderedVO();
			List<OrderVO> orderList = orderJsonVO.getOrderList();
			
			orderDetailVO.setUser_no(user_no);
			orderedVO.setUser_no(user_no);
			
			//1. INSERT INTO TB_ORDER
			result += orderMapper.insertOrder(orderDetailVO);
			
			//1-2. GET ORDER_NO THAT WAS INSERTED.
			int order_no = orderMapper.maxOrderNo(user_no);
			
			//2. SET order_no FOR orderList AND INSERT.
			for(OrderVO each : orderList) {
				each.setOrder_no(order_no);
				result += orderMapper.insertOrderList(each);
			}
			
			//3. Set sender & invoice_no AND INSERT
			String sender = orderMapper.selectSender(user_no);
			orderedVO.setSender(sender);
			orderedVO.setOrder_no(order_no);
			orderedVO.setInvoice_no("invoice_no" + order_no);
			result += orderMapper.insertDetail(orderedVO);
			
		}catch(Exception e) {
			System.out.println(e);
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			result = -1;
		}
		return result;
	}
}
