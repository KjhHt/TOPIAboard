package com.topia.board.vo;

public class Board {
	private int no;
	private int cnt;
	private String subject;
	private String writer;
	
	public Board(int no, String subject, String writer) {
		super();
		this.no = no;
		this.subject = subject;
		this.writer = writer;
	}
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
}
