package com.griptk.b2b.shopping.domain;


public class OrderedVO {
	
	private int user_no; //tb_user
	private int order_no; //tb_order_detail
	private String invoice_no; //tb_order_detail
	private String sender; //tb_order_detail
	private String receiver; //tb_order_detail
	private String memo; //tb_order_detail
	private String recv_addr; //tb_order_detail
	private String order_dt; //tb_order_detail
	
	public OrderedVO() {
		
	}
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
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

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
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

	public String getOrder_dt() {
		return order_dt;
	}

	public void setOrder_dt(String order_dt) {
		this.order_dt = order_dt;
	}
}
