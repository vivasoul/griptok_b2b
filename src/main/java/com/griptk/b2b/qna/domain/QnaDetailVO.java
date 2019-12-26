package com.griptk.b2b.qna.domain;

public class QnaDetailVO {
	private int qna_no;
	private String answer;
	
	public QnaDetailVO() {
		
	}
	
	public QnaDetailVO(int qna_no,String answer) {
		this.qna_no = qna_no;
		this.answer = answer;
	}
	
	
	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
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
		return "qna_no : " + qna_no + " ,answer : " + answer;
	}
}
