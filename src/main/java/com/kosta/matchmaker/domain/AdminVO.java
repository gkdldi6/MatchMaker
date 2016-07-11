package com.kosta.matchmaker.domain;

public class AdminVO {

	private String userid;
	private String userpw;
	private String userauth;
	
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
	public String getUserauth() {
		return userauth;
	}
	public void setUserauth(String userauth) {
		this.userauth = userauth;
	}
	
	@Override
	public String toString() {
		return "AdminVO [userid=" + userid + ", userpw=" + userpw + ", userauth=" + userauth + "]";
	}
	
}