package com.griptk.b2b.qna.domain;

public class QnaDetailVO {
	private int board_no;
	private String answer;
	
	public QnaDetailVO() {
		
	}
	
	public QnaDetailVO(int board_no,String answer) {
		this.board_no = board_no;
		this.answer = answer;
	}
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "board_no : " + board_no + " ,answer : " + answer;
	}
}
