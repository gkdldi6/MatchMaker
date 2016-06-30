package com.kosta.matchmaker.domain;

import java.util.Date;

public class MatchDTO {
	
	private int mno;
	private String mname;
	private Date mbegintime;
	private Date mendtime;
	private int cno;
	private String state;
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public Date getMbegintime() {
		return mbegintime;
	}
	public void setMbegintime(Date mbegintime) {
		this.mbegintime = mbegintime;
	}
	public Date getMendtime() {
		return mendtime;
	}
	public void setMendtime(Date mendtime) {
		this.mendtime = mendtime;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
}
