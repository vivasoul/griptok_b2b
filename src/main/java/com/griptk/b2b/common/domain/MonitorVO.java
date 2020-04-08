package com.griptk.b2b.common.domain;

public class MonitorVO {
	private int user_waiting_cnt;
	private int deposit_waiting_cnt;
	private int new_order_cnt;
	private int delivering_cnt;
	public int getUser_waiting_cnt() {
		return user_waiting_cnt;
	}
	public void setUser_waiting_cnt(int user_waiting_cnt) {
		this.user_waiting_cnt = user_waiting_cnt;
	}
	public int getDeposit_waiting_cnt() {
		return deposit_waiting_cnt;
	}
	public void setDeposit_waiting_cnt(int deposit_waiting_cnt) {
		this.deposit_waiting_cnt = deposit_waiting_cnt;
	}
	public int getNew_order_cnt() {
		return new_order_cnt;
	}
	public void setNew_order_cnt(int new_order_cnt) {
		this.new_order_cnt = new_order_cnt;
	}
	public int getDelivering_cnt() {
		return delivering_cnt;
	}
	public void setDelivering_cnt(int delivering_cnt) {
		this.delivering_cnt = delivering_cnt;
	}
	@Override
	public String toString() {
		return "MonitorVO [user_waiting_cnt=" + user_waiting_cnt + ", deposit_waiting_cnt=" + deposit_waiting_cnt
				+ ", new_order_cnt=" + new_order_cnt + ", delivering_cnt=" + delivering_cnt + "]";
	}	
}
