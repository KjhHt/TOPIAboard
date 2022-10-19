package com.topia.board.vo;

import java.sql.Date;

public class memo_member {
	private int cnt;
	private int user_no;
	private String user_id;
	private String user_password;
	private String user_name;
	private String user_addressno;
	private String user_address;
	private String user_addressdetail;
	private Date user_birth;
	private String user_status;
	private String user_email;
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public Date getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(Date user_birth) {
		this.user_birth = user_birth;
	}
	public String getUser_status() {
		return user_status;
	}
	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_addressno() {
		return user_addressno;
	}
	public void setUser_addressno(String user_addressno) {
		this.user_addressno = user_addressno;
	}
	public String getUser_addressdetail() {
		return user_addressdetail;
	}
	public void setUser_addressdetail(String user_addressdetail) {
		this.user_addressdetail = user_addressdetail;
	}
	
	
}
