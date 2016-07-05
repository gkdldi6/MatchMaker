package com.kosta.matchmaker.domain;

import java.util.Date;

public class UserVO {

	private String userid;
	private String userpw;
	private String username;
	private String email;
	private Date regdate;
	private int userage;
	private String userinfo;
	private String usercode;
	private int userpoint;

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

	public int getUserage() {
		return userage;
	}

	public void setUserage(int userage) {
		this.userage = userage;
	}

	public String getUserinfo() {
		return userinfo;
	}

	public void setUserinfo(String userinfo) {
		this.userinfo = userinfo;
	}

	public String getUsercode() {
		return usercode;
	}

	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}

	public int getUserpoint() {
		return userpoint;
	}

	public void setUserpoint(int userpoint) {
		this.userpoint = userpoint;
	}

	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", userpw=" + userpw + ", username=" + username + ", email=" + email
				+ ", regdate=" + regdate + ", userage=" + userage + ", userinfo=" + userinfo + ", usercode=" + usercode
				+ ", userpoint=" + userpoint + "]";
	}

}
