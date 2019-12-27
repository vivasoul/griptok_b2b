package com.griptk.b2b.shopping.domain;

import java.util.ArrayList;

public class OrderDetailVO {
	private String reg_dt; //tb_order
	private String order_no; //tb_order
	
	private String order_title; //tb_order
	private int order_cnt; //tb_order
	private double tot_order_cost; //tb_order
	private String order_status; //tb_order
	/*
	 *
	"reg_dt": "2019/12/04", tb_order[reg_dt]
  	"order_no": "20191204b", tb_order[order_no]
  	"order_title": "완료된 주문 제목 ", tb_order[order_title]
	"tot_order_cost" : "30000원", tb_order[tot_order_cost]
	"order_status": "완료된주문" tb_order [order_no,user_no]
	 */
	
	public OrderDetailVO() {
		
	}
	
	public OrderDetailVO(
		String order_no,   	
		String reg_dt,
		String order_title, 		
		int order_cnt, 		
		double tot_order_cost
	) {
		this.order_no=	   	order_no;
		this.reg_dt=	 	reg_dt;
		this.order_title=	order_title;
		this.order_cnt=	 	order_cnt;
		this.tot_order_cost=	tot_order_cost;
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
	
	
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	
	public String getOrder_title() {
		return order_title;
	}

	public void setOrder_title(String order_title) {
		this.order_title = order_title;
	}

	public int getOrder_cnt() {
		return order_cnt;
	}
	public void setOrder_cnt(int order_cnt) {
		this.order_cnt = order_cnt;
	}

	public double getTot_order_cost() {
		return tot_order_cost;
	}

	public void setTot_order_cost(double tot_order_cost) {
		this.tot_order_cost = tot_order_cost;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
}
