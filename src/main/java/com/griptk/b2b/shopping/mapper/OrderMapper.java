package com.griptk.b2b.shopping.mapper;


import java.util.List;

import com.griptk.b2b.shopping.domain.OrderDetailVO;
import com.griptk.b2b.shopping.domain.OrderVO;
import com.griptk.b2b.shopping.domain.OrderedVO;

public interface OrderMapper {
	List<OrderDetailVO> listOrder(int order_no);
	OrderedVO selectOrder(OrderedVO orderedVO);
	List<OrderVO> listChildOrder(OrderedVO orderedVO);
	
	int insertOrder(OrderDetailVO orderDetailVO);
	int maxOrderNo(int user_no);
	int insertOrderList(OrderVO orderVO);
	String selectSender(int user_no);
	int insertDetail(OrderedVO orderedVO);
}
