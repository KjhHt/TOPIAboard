package com.topia.board.vo;

import java.sql.Date;

public class memo_board {
	private int no;
	private int cnt;
	private String title;
	private String content;
	private String content_reply;
	private String notice_yn;
	private Date write_date;
	private Date regist_date;
	private Date update_date;
	private String regist_name;	
	private String regist_id;
	private String update_id;
	private String regist_ip;
	private String update_ip;
	private int user_no;
	private String user_name;
	private int rownumcnt;
	
	
	public int getRownumcnt() {
		return rownumcnt;
	}
	public void setRownumcnt(int rownumcnt) {
		this.rownumcnt = rownumcnt;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContent_reply() {
		return content_reply;
	}
	public void setContent_reply(String content_reply) {
		this.content_reply = content_reply;
	}
	public String getNotice_yn() {
		return notice_yn;
	}
	public void setNotice_yn(String notice_yn) {
		this.notice_yn = notice_yn;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	public Date getRegist_date() {
		return regist_date;
	}
	public void setRegist_date(Date regist_date) {
		this.regist_date = regist_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public String getRegist_id() {
		return regist_id;
	}
	public void setRegist_id(String regist_id) {
		this.regist_id = regist_id;
	}
	public String getUpdate_id() {
		return update_id;
	}
	public void setUpdate_id(String update_id) {
		this.update_id = update_id;
	}
	public String getRegist_ip() {
		return regist_ip;
	}
	public void setRegist_ip(String regist_ip) {
		this.regist_ip = regist_ip;
	}
	public String getUpdate_ip() {
		return update_ip;
	}
	public void setUpdate_ip(String update_ip) {
		this.update_ip = update_ip;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getRegist_name() {
		return regist_name;
	}
	public void setRegist_name(String regist_name) {
		this.regist_name = regist_name;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	
}
