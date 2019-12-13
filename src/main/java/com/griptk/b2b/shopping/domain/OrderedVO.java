package com.griptk.b2b.shopping.domain;

import java.util.ArrayList;

public class OrderedVO {
	private String order_no; //tb_order_detail
	private String invoice_no; //tb_order_detail
	private String sender; //tb_order_detail
	private String memo; //tb_order_detail
	private String recv_addr; //tb_order_detail
	
	private String contact_tel; //tb_user
	private String tax_email; //tb_user
	
	private String reg_dt; //tb_order
	
	private String receiver_nm; //tb_shipto_addr
	private String receiver_tel; //tb_shipto_addr
	
	private String shipto_addr; //tb_shipto_addr
	
	public OrderedVO() {
		
	}
	
	public OrderedVO(
		String order_no,   	
		String invoice_no, 	
		String sender, 		
		String memo, 		
		String recv_addr, 	

		String contact_tel, 
		String tax_email, 	

		String reg_dt, 		

		String receiver_nm, 
		String receiver_tel,

		String shipto_addr
	) {
		this.order_no=	   	order_no;
		this.invoice_no=	invoice_no;	
		this.sender=	 	sender;
		this.memo=	 		memo;		
		this.recv_addr=	 	recv_addr;
		this.contact_tel=	contact_tel;
		this.tax_email=	 	tax_email;
		this.reg_dt=	 	reg_dt;
		this.receiver_nm=	receiver_nm;
		this.receiver_tel=	receiver_tel;
		this.shipto_addr=	shipto_addr;	 
	}
	
	public OrderedVO one() {
		return new OrderedVO(
				"2019101200125"
				,"3216546742123"	
				,"주문자"
				,"라이언 불량 확이 해서 보내 주세요 "		
				,"recv_addr"
				,"010-8282-2424"
				,"nemong@iburster.com"
				,"2019.10.12"
				,"받는자"
				,"010-3284-3771"
				,"(03999)서울시 마포구 월드컵북로 7길 34 인터스빌 2층"	 
			);
	}
	
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public String getInvoice_no() {
		return invoice_no;
	}
	public void setInvoice_no(String invoice_no) {
		this.invoice_no = invoice_no;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getRecv_addr() {
		return recv_addr;
	}
	public void setRecv_addr(String recv_addr) {
		this.recv_addr = recv_addr;
	}
	public String getContact_tel() {
		return contact_tel;
	}
	public void setContact_tel(String contact_tel) {
		this.contact_tel = contact_tel;
	}
	public String getTax_email() {
		return tax_email;
	}
	public void setTax_email(String tax_email) {
		this.tax_email = tax_email;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getReceiver_nm() {
		return receiver_nm;
	}
	public void setReceiver_nm(String receiver_nm) {
		this.receiver_nm = receiver_nm;
	}
	public String getReceiver_tel() {
		return receiver_tel;
	}
	public void setReceiver_tel(String receiver_tel) {
		this.receiver_tel = receiver_tel;
	}
	public String getShipto_addr() {
		return shipto_addr;
	}
	public void setShipto_addr(String shipto_addr) {
		this.shipto_addr = shipto_addr;
	}
}
