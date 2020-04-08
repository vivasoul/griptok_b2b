package com.griptk.b2b.shopping.domain;

public interface IOrderStatus {
	String WAITING_PAYMENT = "WP";
	String COMPLETE_PAYMENT = "CP";
	String ON_DELIVERY = "OD";
	String WAITING_DELIVERY = "WD";
	String END_OF_DELIVERY = "ED";
}
