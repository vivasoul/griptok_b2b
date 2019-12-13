package com.griptk.b2b.shopping.domain;

import java.util.ArrayList;

public class OrderDetailVO {
	private String order_no; //tb_order_detail
	private String reg_dt; //tb_order
	
	private String title; //tb_product
	private int order_cnt; //tb_order_list
	private double order_cost; //tb_order_list
	
	public OrderDetailVO() {
		
	}
	
	public OrderDetailVO(
		String order_no,   	
		String reg_dt,
		String title, 		
		int order_cnt, 		
		double order_cost
	) {
		this.order_no=	   	order_no;
		this.reg_dt=	 	reg_dt;
		this.title=	 		title;
		this.order_cnt=	 	order_cnt;
		this.order_cost=	order_cost;
	}
	
	public ArrayList<OrderDetailVO> list() {
		return new ArrayList<OrderDetailVO>() { 
            {
                add(
            		new OrderDetailVO(
        				"2019101200125"
        				,"2019.10.12"
        				,"카카오 그립톡  라이언"
        				,3
        				,10000
        			)
                ); 
                add(
            		new OrderDetailVO(
        				"2019101200125"
        				,"2019.10.12"
        				,"카카오 그립톡  외무지"
        				,5
        				,30000
        			)
                );  
            } 
        }; 
	}
	
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getOrder_cnt() {
		return order_cnt;
	}
	public void setOrder_cnt(int order_cnt) {
		this.order_cnt = order_cnt;
	}
	public double getOrder_cost() {
		return order_cost;
	}
	public void setOrder_cost(double order_cost) {
		this.order_cost = order_cost;
	}
}
