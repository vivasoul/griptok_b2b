package com.griptk.b2b.shopping.domain;

import java.util.List;

public class OrderJsonVO {
	private OrderDetailVO orderDetailVO;
	private OrderedVO orderedVO;
	private List<OrderVO> orderList;
	
	public OrderDetailVO getOrderDetailVO() {
		return orderDetailVO;
	}
	public void setOrderDetailVO(OrderDetailVO orderDetailVO) {
		this.orderDetailVO = orderDetailVO;
	}
	public OrderedVO getOrderedVO() {
		return orderedVO;
	}
	public void setOrderedVO(OrderedVO orderedVO) {
		this.orderedVO = orderedVO;
	}
	public List<OrderVO> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<OrderVO> orderList) {
		this.orderList = orderList;
	}
}
