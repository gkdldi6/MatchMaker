package com.kosta.matchmaker.domain;

import java.util.Date;

public class UserVO {

	private String userid;
	private String userpw;
	private String username;
	private String email;
	private Date regdate;
	private String userinfo;
	private int userpoint;
	private String usergrade;
	private int ulow;
	private int uhigh;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getUserinfo() {
		return userinfo;
	}
	public void setUserinfo(String userinfo) {
		this.userinfo = userinfo;
	}
	public int getUserpoint() {
		return userpoint;
	}
	public void setUserpoint(int userpoint) {
		this.userpoint = userpoint;
	}
	public String getUsergrade() {
		return usergrade;
	}
	public void setUsergrade(String usergrade) {
		this.usergrade = usergrade;
	}
	public int getUlow() {
		return ulow;
	}
	public void setUlow(int ulow) {
		this.ulow = ulow;
	}
	public int getUhigh() {
		return uhigh;
	}
	public void setUhigh(int uhigh) {
		this.uhigh = uhigh;
	}
	
	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", userpw=" + userpw + ", username=" + username + ", email=" + email
				+ ", regdate=" + regdate + ", userinfo=" + userinfo + ", userpoint=" + userpoint + ", usergrade="
				+ usergrade + ", ulow=" + ulow + ", uhigh=" + uhigh + "]";
	}
	
}
