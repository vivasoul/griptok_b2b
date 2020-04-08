package com.griptk.b2b.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.griptk.b2b.shopping.domain.MOrderedVO;
import com.griptk.b2b.shopping.mapper.OrderMapper;

@RestController
@RequestMapping("/management/orders")
public class MOrderAPI {
	@Autowired
	OrderMapper orderMapper;
	
	@GetMapping
	public List<MOrderedVO> getOrdersForMng(@RequestParam("status") String status, 
											@RequestParam(value="page_no",defaultValue="0") int page_no){
		int start = page_no*10;
		return orderMapper.listOrderInStatus(start, status);
	}
}
